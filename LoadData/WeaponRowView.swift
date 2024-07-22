//
//  WeaponRowView.swift
//  LoadData
//
//  Created by Makra Flórián Róbert on 24/06/2024.
//

import SwiftUI
import SwiftData

struct WeaponRowView: View {

    @Bindable var weapon: Weapon
    
    init(weapon: Weapon) {
        self.weapon = weapon
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(weapon.name)
                    .font(.title2)
                Spacer()
                Text("\(weapon.weaponId)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            VStack {
                ForEach(weapon.weaponAffinities ?? [], id: \.self) { affinity in
                    Text(affinity.name)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}
