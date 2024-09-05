//
//  CreateDataView.swift
//  CreateData
//
//  Created by Makra Flórián Róbert on 24/06/2024.
//

import SwiftData
import SwiftUI

struct CreateDataView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \Weapon.weaponId) private var weapons: [Weapon]
    @Query(sort: \WeaponUpgrade.reinforceTypeId) private var weaponUpgrades: [WeaponUpgrade]
    @Query(sort: \ElementScaling.rowId) private var elementScaling: [ElementScaling]
    @Query(sort: \CalcCorrectGraph.graphId) private var calcCorrectGraphs: [CalcCorrectGraph]
    @Query(sort: \CharacterClass.classId) private var characterClasses: [CharacterClass]
    
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
    
    func parseCalcCorrectGraphJson() {
        guard let calcCorrectGraphsArray = DefaultsJSON.decode(from: "calcCorrectGraph", type: [CalcCorrectGraph].self),
              calcCorrectGraphs.isEmpty else {
            return
        }
        
        calcCorrectGraphsArray.forEach { modelContext.insert($0) }
        print("===============")
        print("Inserted Calc Correct Graphs: \(calcCorrectGraphsArray.count)")
        print("===============")
    }
    
    func parseCharacterClassesJson() {
        guard let characterClassesArray = DefaultsJSON.decode(from: "characterClasses", type: [CharacterClass].self),
              characterClasses.isEmpty else {
            return
        }
        
        characterClassesArray.forEach { modelContext.insert($0) }
        print("===============")
        print("Inserted Character Classes: \(characterClassesArray.count)")
        print("===============")
    }
    
    var body: some View {
        NavigationStack {
            HStack(alignment: .top) {
                ///https://www.hackingwithswift.com/quick-start/swiftdata/how-to-optimize-the-performance-of-your-swiftdata-apps
                //ModelContext has a dedicated fetchCount() method for times when you want to know how many objects would be returned for a given query. This is significantly more efficient than fetching a whole array then reading its count property. - Ohmm.. POG 100% will forgor
                Text("Number of all data: \(weapons.count + weaponUpgrades.count + elementScaling.count + calcCorrectGraphs.count + characterClasses.count)")
                    .font(.title)
                Spacer()
                Button("Add") {
                    do {
                        parseWeaponsJson()
                        parseWeaponUpgradesJson()
                        parseElementScalingJson()
                        parseCalcCorrectGraphJson()
                        parseCharacterClassesJson()
                        try modelContext.save()
                        print("================")
                        print("PARSED and IMPORTED")
                        print("================")
                    } catch {
                        print("JSON decode failed: \(error.localizedDescription)")
                    }
                }
            }
            List {
                Text("Weapons:")
                    .font(.title)
                    .padding([.bottom, .top, .trailing], 20)
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
                VStack(alignment: .leading) {
                    HStack {
                        Text("Calc Correct Graph")
                            .font(.title2)
                        Spacer()
                        Text("Number of data: \(calcCorrectGraphs.count)")
                    }
                }
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        calcCorrectGraphs.forEach { modelContext.delete($0) }
                    }
                }
                Text("Character:")
                    .font(.title)
                    .padding([.bottom, .top, .trailing], 20)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Character Classes")
                            .font(.title2)
                        Spacer()
                        Text("Number of data: \(characterClasses.count)")
                    }
                }
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        characterClasses.forEach { modelContext.delete($0) }
                    }
                }
            }
            .navigationTitle("Create Data")
        }
        .padding()
    }
}
