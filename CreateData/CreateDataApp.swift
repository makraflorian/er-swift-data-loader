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
        let configuration = ModelConfiguration(for: Weapon.self, WeaponUpgrade.self, ElementScaling.self)
        do {
            self.container = try ModelContainer(for: Weapon.self, WeaponUpgrade.self, ElementScaling.self, configurations: configuration)
        } catch {
            fatalError("Failed to setup SwiftData: \(error.localizedDescription)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            CreateWeaponsView()
                .modelContainer(container)
        }
        .commands {
            CommandGroup(after: CommandGroupPlacement.newItem) {
                Divider()
                
                Button("Export") {
                    exportWeapons()
                }
                .keyboardShortcut("e", modifiers: .command)
            }
        }
    }
    
    @MainActor
    func exportWeapons() {
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
                    // Get all the challenges from the main SwiftData datastore
                    let fetchDescriptor = FetchDescriptor<Weapon>()
                    let weapons = try container.mainContext.fetch(fetchDescriptor)
                    
                    let fetchDescriptorUpgrades = FetchDescriptor<WeaponUpgrade>()
                    let weaponUpgrades = try container.mainContext.fetch(fetchDescriptorUpgrades)
                    
                    let fetchDescriptorScaling = FetchDescriptor<ElementScaling>()
                    let elementScaling = try container.mainContext.fetch(fetchDescriptorScaling)
                    
                    // Create the export datastore
                    let exportConfig = ModelConfiguration(url: url.appending(path: Constants.weaponsFilename))
                    let exportContainer = try ModelContainer(for: Weapon.self, WeaponUpgrade.self, ElementScaling.self, configurations: exportConfig)
                    
                    
                    // Copy the challenges to the exportContainer
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
                    
                    try exportContainer.mainContext.save()
                    print("================")
                    print("SAVED and EXPORTED")
                    print("================")
                    
                } catch {
                    print("Failed during export: \(error.localizedDescription)")
                }
                url.stopAccessingSecurityScopedResource()
            }
        }
        
    }
}
