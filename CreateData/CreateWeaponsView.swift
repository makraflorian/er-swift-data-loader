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
    
    func parseJson() {
        let weapons = DefaultsJSON.decode(from: "weapons", type: [Weapon].self)
        let weaponAffinitiesArr = DefaultsJSON.decode(from: "weaponAffinities", type: [WeaponAffinity].self)
        let weaponUpgrades = DefaultsJSON.decode(from: "weaponUpgrades", type: [WeaponUpgrade].self)
        
        weaponUpgrades?.forEach { modelContext.insert($0) }
        
        weapons?.forEach { weapon in
            weapon.weaponAffinities?.append(contentsOf: weaponAffinitiesArr?.filter({ $0.affinityId == weapon.affinityId }) ?? [])
            var weaponAffinitiesArrFiltered = weaponAffinitiesArr?.filter({ $0.affinityId == weapon.affinityId }) ?? []
            print("\(weaponAffinitiesArrFiltered[0].affinityId) \(weaponAffinitiesArrFiltered[0].name), \(weaponAffinitiesArrFiltered[0].correctLuck)")
            let newWeapon = Weapon(from: weapon, with: weaponAffinitiesArrFiltered)
            weapon.weaponAffinities = weaponAffinitiesArrFiltered
            modelContext.insert(weapon) // save into the binary
            print("===============")
            print(newWeapon.weaponAffinities?.count)
            print(weapon.weaponAffinities?.count)
            print("Upgrades count: \(weaponUpgrades?.count)")
            print("===============")
        }
    }
    
    var body: some View {
        NavigationStack {
            HStack(alignment: .top) {
                Text("There are \(weapons.count) weapons")
                    .font(.title)
                Spacer()
                Button("Add") {
                    parseJson()
                    do {
                        try modelContext.save()
                    } catch {
                        print("Failed when saving the newly added weapons: \(error.localizedDescription)")
                    }
                }
            }
            List(weapons) { weapon in
                VStack(alignment: .leading) {
                    HStack {
                        Text(weapon.name)
                            .font(.title2)
                        Spacer()
                        Text("Weapon id: \(weapon.weaponId)")
                    }
                    HStack {
                        ForEach(weapon.weaponAffinities ?? [], id: \.self) { affinity in
                            Text(affinity.name)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        modelContext.delete(weapon)
                    }
                }
            }
            .navigationTitle("Weapons")
        }
        .padding()
    }
}
