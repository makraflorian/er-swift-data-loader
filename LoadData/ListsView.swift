//
//  ListsView.swift
//  LoadData
//
//  Created by Makra Flórián Róbert on 24/06/2024.
//

import SwiftUI
import SwiftData

struct ListWeaponView: View {
    
    @Environment(\.weaponsContainer) var weaponsContainer: ModelContainer
    
    @MainActor
    func getWeapons() -> [Weapon] {

        let fd = FetchDescriptor<Weapon>(sortBy: [SortDescriptor(\.sortId)])
        do {
            let weapons = try weaponsContainer.mainContext.fetch(fd)
            print(weapons.count)
            print("\(weapons[1].weaponAffinities?.count ?? 0)")
            return weapons
        } catch {
            print("Failed to fetch weapons: \(error.localizedDescription)")
        }
        
        return []
    }
    
    var body: some View {
        NavigationStack {
            List(getWeapons()) { weapon in
                WeaponRowView(weapon: weapon)
            }
            .navigationTitle("Weapons")
        }
    }
}


struct UpgradesView: View {
    
    @Environment(\.weaponsContainer) var weaponsContainer: ModelContainer
    
    @MainActor
    func getUpgrades() -> [WeaponUpgrade] {
//        testing xd
        let fd2 = FetchDescriptor<WeaponUpgrade>(sortBy: [SortDescriptor(\.reinforceTypeId)])
        do {
            let upgrades = try weaponsContainer.mainContext.fetch(fd2)
            print(upgrades.count)
            return upgrades
        } catch {
            print("Failed to fetch upgrades: \(error.localizedDescription)")
        }
        
        return []
    }
    
    var body: some View {
        NavigationStack {
            List(getUpgrades()) { upgrade in
                UpgradesRowView(upgrade: upgrade)
            }
            .navigationTitle("Upgrades")
        }
    }
}

struct ScalingView: View {
    
    @Environment(\.weaponsContainer) var weaponsContainer: ModelContainer
    
    @MainActor
    func getScaling() -> [ElementScaling] {
//        testing xd
        let fd2 = FetchDescriptor<ElementScaling>(sortBy: [SortDescriptor(\.rowId)])
        do {
            let scaling = try weaponsContainer.mainContext.fetch(fd2)
            print(scaling.count)
            return scaling
        } catch {
            print("Failed to fetch scaling: \(error.localizedDescription)")
        }
        
        return []
    }
    
    var body: some View {
        NavigationStack {
            List(getScaling()) { scaling in
                ScalingRowView(scaling: scaling)
            }
            .navigationTitle("Scaling")
        }
    }
}

struct HostingView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: ListWeaponView()) {
                    Text("Weapons").font(.largeTitle)
                }
                NavigationLink(destination: UpgradesView()) {
                    Text("Upgrades").font(.largeTitle)
                }
                NavigationLink(destination: ScalingView()) {
                    Text("Scaling").font(.largeTitle)
                }
            }
        }
    }
}
