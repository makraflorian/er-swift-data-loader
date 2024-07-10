//
//  UpgradesRowView.swift
//  LoadData
//
//  Created by Makra Flórián Róbert on 10/07/2024.
//

import SwiftUI
import SwiftData

struct UpgradesRowView: View {

    @Bindable var upgrade: WeaponUpgrade
    
    init(upgrade: WeaponUpgrade) {
        self.upgrade = upgrade
//        let weaponID = weapon.weaponId
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(upgrade.name)
                    .font(.title2)
                Spacer()
                Text("\(upgrade.reinforceTypeId)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("\(upgrade.physicsAtkRate) ")
                Text("\(upgrade.fireAtkRate) ")
                Text("\(upgrade.magicAtkRate) ")
                Text("\(upgrade.thunderAtkRate) ")
                Text("\(upgrade.darkAtkRate) ")
            }
        }
    }
}
