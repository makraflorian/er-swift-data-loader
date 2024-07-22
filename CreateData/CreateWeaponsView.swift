//
//  ContentView.swift
//  CreateData
//
//  Created by Makra Flórián Róbert on 24/06/2024.
//

import SwiftData
import SwiftUI

struct CreateWeaponsView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \Weapon.weaponId) private var weapons: [Weapon]
    @Query(sort: \WeaponUpgrade.reinforceTypeId) private var weaponUpgrades: [WeaponUpgrade]
    @Query(sort: \ElementScaling.rowId) private var elementScaling: [ElementScaling]
    
    func parseWeaponsJson() {
        guard let weaponsArray = DefaultsJSON.decode(from: "weapons", type: [Weapon].self),
              let weaponAffinitiesArray = DefaultsJSON.decode(from: "weaponAffinities", type: [WeaponAffinity].self),
              weapons.isEmpty else {
            return
        }
        
        weaponsArray.forEach { weapon in
            let weaponAffinitiesArrayFiltered = weaponAffinitiesArray.filter({ $0.affinityId == weapon.affinityId })
            weapon.weaponAffinities = weaponAffinitiesArrayFiltered
            modelContext.insert(weapon) // save into the binary
            print("===============")
            print("\(weapon.name)")
            print("\(weapon.weaponAffinities?.count ?? 0)")
            print("===============")
        }
    }
    
    func parseWeaponUpgradesJson() {
        guard let weaponUpgradesArray = DefaultsJSON.decode(from: "weaponUpgrades", type: [WeaponUpgrade].self),
              weaponUpgrades.isEmpty else {
            return
        }
        
        weaponUpgradesArray.forEach { modelContext.insert($0) }
        print("===============")
        print("Inserted weapon upgrades: \(weaponUpgradesArray.count)")
        print("===============")
    }
    
    func parseElementScalingJson() {
        guard let elementScalingArray = DefaultsJSON.decode(from: "elementScaling", type: [ElementScaling].self),
              elementScaling.isEmpty else {
            return
        }
        
        elementScalingArray.forEach { modelContext.insert($0) }
        print("===============")
        print("Inserted weapon element scaling: \(elementScalingArray.count)")
        print("===============")
    }
    
    var body: some View {
        NavigationStack {
            HStack(alignment: .top) {
                Text("There are \(weapons.count) weapons")
                    .font(.title)
                Spacer()
                Button("Add") {
                    do {
                        parseWeaponsJson()
                        parseWeaponUpgradesJson()
                        parseElementScalingJson()
                        try modelContext.save()
                    } catch {
                        print("JSON decode failed: \(error.localizedDescription)")
                    }
                }
            }
            List {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Weapons")
                            .font(.title2)
                        Spacer()
                        Text("Number of data: \(weapons.count)")
                    }
                }
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        weapons.forEach { modelContext.delete($0) }
                    }
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Upgrades")
                            .font(.title2)
                        Spacer()
                        Text("Number of data: \(weaponUpgrades.count)")
                    }
                }
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        weaponUpgrades.forEach { modelContext.delete($0) }
                    }
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Element Scaling")
                            .font(.title2)
                        Spacer()
                        Text("Number of data: \(elementScaling.count)")
                    }
                }
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        elementScaling.forEach { modelContext.delete($0) }
                    }
                }
            }
            .navigationTitle("Create Data")
        }
        .padding()
    }
}
