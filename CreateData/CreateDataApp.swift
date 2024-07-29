//
//  CreateDataApp.swift
//  CreateData
//
//  Created by Makra Flórián Róbert on 24/06/2024.
//

import SwiftData
import SwiftUI

@main
struct CreateDataApp: App {
    
    var container: ModelContainer
    
    init() {
        let configuration = ModelConfiguration(for: Weapon.self,
                                               WeaponUpgrade.self,
                                               ElementScaling.self,
                                               CalcCorrectGraph.self,
                                               CharacterClass.self)
        do {
            self.container = try ModelContainer(for: Weapon.self,
                                                WeaponUpgrade.self,
                                                ElementScaling.self,
                                                CalcCorrectGraph.self,
                                                CharacterClass.self,
                                                configurations: configuration)
        } catch {
            fatalError("Failed to setup SwiftData: \(error.localizedDescription)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            CreateDataView()
                .modelContainer(container)
        }
        .commands {
            CommandGroup(after: CommandGroupPlacement.newItem) {
                Divider()
                
                Button("Export") {
                    exportData()
                }
                .keyboardShortcut("e", modifiers: .command)
            }
        }
    }
    
    @MainActor
    func exportData() {
        let panel = NSOpenPanel()
        panel.canChooseDirectories = true
        panel.canChooseFiles = false
        panel.canCreateDirectories = true
        panel.showsTagField = false
        
        if panel.runModal() == .OK {
            guard let url = panel.url else {
                print("Somehow I can't get a URL for saving")
                return
            }
            
            if url.startAccessingSecurityScopedResource() {
                do {
                    // Get all the data from the main SwiftData datastore
                    let fetchDescriptor = FetchDescriptor<Weapon>()
                    let weapons = try container.mainContext.fetch(fetchDescriptor)
                    
                    let fetchDescriptorUpgrades = FetchDescriptor<WeaponUpgrade>()
                    let weaponUpgrades = try container.mainContext.fetch(fetchDescriptorUpgrades)
                    
                    let fetchDescriptorScaling = FetchDescriptor<ElementScaling>()
                    let elementScaling = try container.mainContext.fetch(fetchDescriptorScaling)
                    
                    let fetchDescriptorCorrectGraph = FetchDescriptor<CalcCorrectGraph>()
                    let calcCorrectGraphs = try container.mainContext.fetch(fetchDescriptorCorrectGraph)
                    
                    let fetchDescriptorCharacterClass = FetchDescriptor<CharacterClass>()
                    let characterClasses = try container.mainContext.fetch(fetchDescriptorCharacterClass)
                    
                    // Create the export datastore
                    let exportConfig = ModelConfiguration(url: url.appending(path: Constants.weaponsFilename))
                    let exportContainer = try ModelContainer(for: Weapon.self,
                                                             WeaponUpgrade.self,
                                                             ElementScaling.self,
                                                             CalcCorrectGraph.self,
                                                             CharacterClass.self,
                                                             configurations: exportConfig)
                    
                    
                    // Copy the data to the exportContainer
                    for weapon in weapons {
                        let newWeapon = Weapon(from: weapon)
                        exportContainer.mainContext.insert(newWeapon)
                    }
                    
                    for upgrade in weaponUpgrades {
                        let newUpgrade = WeaponUpgrade(from: upgrade)
                        exportContainer.mainContext.insert(newUpgrade)
                    }
                    
                    for scaling in elementScaling {
                        let newScaling = ElementScaling(from: scaling)
                        exportContainer.mainContext.insert(newScaling)
                    }
                    
                    for correctGraph in calcCorrectGraphs {
                        let newCorrectGraph = CalcCorrectGraph(from: correctGraph)
                        exportContainer.mainContext.insert(newCorrectGraph)
                    }
                    
                    for characterClass in characterClasses {
                        let newCharacterClass = CharacterClass(from: characterClass)
                        exportContainer.mainContext.insert(newCharacterClass)
                    }
                    
                    try exportContainer.mainContext.save()
                    print("================")
                    print("SAVED and EXPORTED") // popup maybe
                    print("================")
                    
                } catch {
                    print("Failed during export: \(error.localizedDescription)")
                }
                url.stopAccessingSecurityScopedResource()
            }
        }
        
    }
}
