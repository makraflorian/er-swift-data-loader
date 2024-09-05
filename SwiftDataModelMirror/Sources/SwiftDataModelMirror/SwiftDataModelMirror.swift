// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example,
///
///     #stringify(x + y)
///
/// produces a tuple `(x + y, "x + y")`.
@freestanding(expression)
public macro stringify<T>(_ value: T) -> (T, String) = #externalMacro(module: "SwiftDataModelMirrorMacros", type: "StringifyMacro")

/// A macro for printing the description of any class the way
/// like `CustomReflectable` does. For example,
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
@attached(extension, conformances: CustomReflectable, names: named(customMirror))
public macro ModelMirror() = #externalMacro(module: "SwiftDataModelMirrorMacros", type: "ModelMirrorMacro")
