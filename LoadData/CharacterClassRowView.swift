//
//  CharacterClassRowView.swift
//  LoadData
//
//  Created by Makra Flórián Róbert on 29/07/2024.
//

import SwiftUI
import SwiftData

struct CharacterClassRowView: View {
    
    @Bindable var characterClass: CharacterClass
    
    init(characterClass: CharacterClass) {
        self.characterClass = characterClass
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(characterClass.name)")
                    .font(.title2)
                Spacer()
                Text("Level: \(characterClass.level)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("\(characterClass.stats?.vigor ?? 0)")
                Text("\(characterClass.stats?.endurance ?? 0)")
                Text("\(characterClass.stats?.strength ?? 0)")
                Text("\(characterClass.stats?.dexterity ?? 0)")
                Text("\(characterClass.stats?.intelligence ?? 0)")
                Text("\(characterClass.stats?.faith ?? 0)")
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
    }
}
