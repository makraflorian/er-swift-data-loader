import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Implementation of the `stringify` macro, which takes an expression
/// of any type and produces a tuple containing the value of that expression
/// and the source code that produced the value. For example
///
///     #stringify(x + y)
///
///  will expand to
///
///     (x + y, "x + y")
public struct StringifyMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        return "(\(argument), \(literal: argument.description))"
    }
}

/// Implementation of the `ModelMirrorMacro` macro, which can be
/// attached to any class and while debugging pressing the `Print Description` button,
/// or type `po dump(object_name)` in the console it will print its description.
/// Useful for SwiftData model types where you can't see the property values while debugging.
/// Based on: https://stackoverflow.com/questions/78609939/how-can-i-improve-debug-information-shown-on-swiftdata-properties-marked-as-swi
/// For example
///
///     @ModelMirror
///     class MyClass {
///         var x: Int
///         var y: Int
///     }
///
/// will print something like this
///
///     Printing description of object_name:
///         ▿ MyClass
///             - x : 1
///             - y : 2
enum ModelMirrorMacro: ExtensionMacro {
    static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {
        guard let classDecl = declaration.as(ClassDeclSyntax.self) else { return [] }
        let name = classDecl.name
        let propertyNames = classDecl.memberBlock.members.compactMap {
            $0.decl.as(VariableDeclSyntax.self)?.bindings.first?.pattern.as(IdentifierPatternSyntax.self)?.identifier
        }
        let extensionDecl = try ExtensionDeclSyntax("extension \(name): CustomReflectable") {
            let kvp = DictionaryExprSyntax(contentBuilder: {
                for name in propertyNames {
                    DictionaryElementSyntax(key: StringLiteralExprSyntax(content: name.text), value: DeclReferenceExprSyntax(baseName: name))
                }
            })
            "var customMirror: Mirror { Mirror(self, children: \(kvp)) }"
        }
        return [extensionDecl]
    }
}

@main
struct SwiftDataModelMirrorPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        StringifyMacro.self,
        ModelMirrorMacro.self
    ]
}
