//
//  WeaponUpgrade.swift
//  LoadData
//
//  Created by Makra Flórián Róbert on 29/07/2024.
//

import Foundation
import SwiftData

@Model
class WeaponUpgrade: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case reinforceTypeId, name, physicsAtkRate, magicAtkRate, fireAtkRate, thunderAtkRate, darkAtkRate, correctStrengthRate, correctAgilityRate, correctMagicRate, correctFaithRate, correctLuckRate, baseAtkRate
    }
    
    let id: UUID
    var reinforceTypeId: Int
    var name: String
    var physicsAtkRate: Double
    var magicAtkRate: Double
    var fireAtkRate: Double
    var thunderAtkRate: Double
    var darkAtkRate: Double
    var correctStrengthRate: Double
    var correctAgilityRate: Double
    var correctMagicRate: Double
    var correctFaithRate: Double
    var correctLuckRate: Double
    var baseAtkRate: Double
    
    init(from: WeaponUpgrade) {
        self.id = from.id
        self.reinforceTypeId = from.reinforceTypeId
        self.name = from.name
        self.physicsAtkRate = from.physicsAtkRate
        self.magicAtkRate = from.magicAtkRate
        self.fireAtkRate = from.fireAtkRate
        self.thunderAtkRate = from.thunderAtkRate
        self.darkAtkRate = from.darkAtkRate
        self.correctStrengthRate = from.correctStrengthRate
        self.correctAgilityRate = from.correctAgilityRate
        self.correctMagicRate = from.correctMagicRate
        self.correctFaithRate = from.correctFaithRate
        self.correctLuckRate = from.correctLuckRate
        self.baseAtkRate = from.baseAtkRate
    }
    
    init(id: UUID = UUID(), reinforceTypeId: Int, name: String, physicsAtkRate: Double, magicAtkRate: Double, fireAtkRate: Double, thunderAtkRate: Double, darkAtkRate: Double, correctStrengthRate: Double, correctAgilityRate: Double, correctMagicRate: Double, correctFaithRate: Double, correctLuckRate: Double, baseAtkRate: Double) {
        self.id = id
        self.reinforceTypeId = reinforceTypeId
        self.name = name
        self.physicsAtkRate = physicsAtkRate
        self.magicAtkRate = magicAtkRate
        self.fireAtkRate = fireAtkRate
        self.thunderAtkRate = thunderAtkRate
        self.darkAtkRate = darkAtkRate
        self.correctStrengthRate = correctStrengthRate
        self.correctAgilityRate = correctAgilityRate
        self.correctMagicRate = correctMagicRate
        self.correctFaithRate = correctFaithRate
        self.correctLuckRate = correctLuckRate
        self.baseAtkRate = baseAtkRate
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.reinforceTypeId = try container.decode(Int.self, forKey: .reinforceTypeId)
        self.name = try container.decode(String.self, forKey: .name)
        self.physicsAtkRate = try container.decode(Double.self, forKey: .physicsAtkRate)
        self.magicAtkRate = try container.decode(Double.self, forKey: .magicAtkRate)
        self.fireAtkRate = try container.decode(Double.self, forKey: .fireAtkRate)
        self.thunderAtkRate = try container.decode(Double.self, forKey: .thunderAtkRate)
        self.darkAtkRate = try container.decode(Double.self, forKey: .darkAtkRate)
        self.correctStrengthRate = try container.decode(Double.self, forKey: .correctStrengthRate)
        self.correctAgilityRate = try container.decode(Double.self, forKey: .correctAgilityRate)
        self.correctMagicRate = try container.decode(Double.self, forKey: .correctMagicRate)
        self.correctFaithRate = try container.decode(Double.self, forKey: .correctFaithRate)
        self.correctLuckRate = try container.decode(Double.self, forKey: .correctLuckRate)
        self.baseAtkRate = try container.decode(Double.self, forKey: .baseAtkRate)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(reinforceTypeId, forKey: .reinforceTypeId)
        try container.encode(name, forKey: .name)
        try container.encode(physicsAtkRate, forKey: .physicsAtkRate)
        try container.encode(magicAtkRate, forKey: .magicAtkRate)
        try container.encode(fireAtkRate, forKey: .fireAtkRate)
        try container.encode(thunderAtkRate, forKey: .thunderAtkRate)
        try container.encode(darkAtkRate, forKey: .darkAtkRate)
        try container.encode(correctStrengthRate, forKey: .correctStrengthRate)
        try container.encode(correctAgilityRate, forKey: .correctAgilityRate)
        try container.encode(correctMagicRate, forKey: .correctMagicRate)
        try container.encode(correctFaithRate, forKey: .correctFaithRate)
        try container.encode(correctLuckRate, forKey: .correctLuckRate)
        try container.encode(baseAtkRate, forKey: .baseAtkRate)
    }
}
