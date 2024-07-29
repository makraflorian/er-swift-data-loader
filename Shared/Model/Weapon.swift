//
//  Weapon.swift
//  CreateData
//
//  Created by Makra Flórián Róbert on 24/06/2024.
//

import Foundation
import SwiftData

@Model
class Weapon: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case weaponId, name, sortId, affinityId, weaponAffinities
    }
    
    //    @Attribute(.unique)
    let id: UUID
    var weaponId: Int
    var name: String
    var sortId: Int
    var affinityId: Int
    var weaponAffinities: [WeaponAffinity]?
    
    init(from: Weapon) {
        self.id = from.id
        self.weaponId = from.weaponId
        self.name = from.name
        self.sortId = from.sortId
        self.affinityId = from.affinityId
        self.weaponAffinities = from.weaponAffinities
    }
    
    init(from: Weapon, with: [WeaponAffinity]) {
        self.id = from.id
        self.weaponId = from.weaponId
        self.name = from.name
        self.sortId = from.sortId
        self.affinityId = from.affinityId
        self.weaponAffinities = with
    }
    
    init(id: UUID = UUID(), weaponId: Int, name: String, sortId: Int, affinityId: Int, weaponAffinities: [WeaponAffinity]) {
        self.id = id
        self.weaponId = weaponId
        self.name = name
        self.sortId = sortId
        self.affinityId = affinityId
        self.weaponAffinities = weaponAffinities
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.weaponId = try container.decode(Int.self, forKey: .weaponId)
        self.name = try container.decode(String.self, forKey: .name)
        self.sortId = try container.decode(Int.self, forKey: .sortId)
        self.affinityId = try container.decode(Int.self, forKey: .affinityId)
        self.weaponAffinities = try container.decodeIfPresent([WeaponAffinity].self, forKey: .weaponAffinities)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(weaponId, forKey: .weaponId)
        try container.encode(name, forKey: .name)
        try container.encode(sortId, forKey: .sortId)
        try container.encode(affinityId, forKey: .affinityId)
        try container.encode(weaponAffinities, forKey: .weaponAffinities)
    }
}

struct WeaponAffinity: Codable, Hashable, Identifiable {
    enum CodingKeys: CodingKey {
        case weaponId, name, sortId, reinforceTypeId, affinityId, attackBasePhysics, attackBaseMagic, attackBaseFire, attackBaseThunder, attackBaseDark, correctStrength, correctAgility, correctMagic, correctFaith, correctLuck, weight, affinityHelper
    }
    
    let id: UUID
    var weaponId: Int
    var name: String
    var sortId: Int
    var reinforceTypeId: Int
    var affinityId: Int
    var attackBasePhysics: Double
    var attackBaseMagic: Double
    var attackBaseFire: Double
    var attackBaseThunder: Double
    var attackBaseDark: Double
    var correctStrength: Double
    var correctAgility: Double
    var correctMagic: Double
    var correctFaith: Double
    var correctLuck: Double
    var weight: Double
    var affinityHelper: Bool
    
    init(from: WeaponAffinity) {
        self.id = from.id
        self.weaponId = from.weaponId
        self.name = from.name
        self.sortId = from.sortId
        self.reinforceTypeId = from.reinforceTypeId
        self.affinityId = from.affinityId
        self.attackBasePhysics = from.attackBasePhysics
        self.attackBaseMagic = from.attackBaseMagic
        self.attackBaseFire = from.attackBaseFire
        self.attackBaseThunder = from.attackBaseThunder
        self.attackBaseDark = from.attackBaseDark
        self.correctStrength = from.correctStrength
        self.correctAgility = from.correctAgility
        self.correctMagic = from.correctMagic
        self.correctFaith = from.correctFaith
        self.correctLuck = from.correctLuck
        self.weight = from.weight
        self.affinityHelper = from.affinityHelper
    }
    
    init(id: UUID = UUID(), weaponId: Int, name: String, sortId: Int, reinforceTypeId: Int, affinityId: Int, attackBasePhysics: Double, attackBaseMagic: Double, attackBaseFire: Double, attackBaseThunder: Double, attackBaseDark: Double, correctStrength: Double, correctAgility: Double, correctMagic: Double, correctFaith: Double, correctLuck: Double,  weight: Double, affinityHelper: Bool) {
        self.id = id
        self.weaponId = weaponId
        self.name = name
        self.sortId = sortId
        self.reinforceTypeId = reinforceTypeId
        self.affinityId = affinityId
        self.attackBasePhysics = attackBasePhysics
        self.attackBaseMagic = attackBaseMagic
        self.attackBaseFire = attackBaseFire
        self.attackBaseThunder = attackBaseThunder
        self.attackBaseDark = attackBaseDark
        self.correctStrength = correctStrength
        self.correctAgility = correctAgility
        self.correctMagic = correctMagic
        self.correctFaith = correctFaith
        self.correctLuck = correctLuck
        self.weight = weight
        self.affinityHelper = affinityHelper
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.weaponId = try container.decode(Int.self, forKey: .weaponId)
        self.name = try container.decode(String.self, forKey: .name)
        self.sortId = try container.decode(Int.self, forKey: .sortId)
        self.reinforceTypeId = try container.decode(Int.self, forKey: .reinforceTypeId)
        self.affinityId = try container.decode(Int.self, forKey: .affinityId)
        self.attackBasePhysics = try container.decode(Double.self, forKey: .attackBasePhysics)
        self.attackBaseMagic = try container.decode(Double.self, forKey: .attackBaseMagic)
        self.attackBaseFire = try container.decode(Double.self, forKey: .attackBaseFire)
        self.attackBaseThunder = try container.decode(Double.self, forKey: .attackBaseThunder)
        self.attackBaseDark = try container.decode(Double.self, forKey: .attackBaseDark)
        self.correctStrength = try container.decode(Double.self, forKey: .correctStrength)
        self.correctAgility = try container.decode(Double.self, forKey: .correctAgility)
        self.correctMagic = try container.decode(Double.self, forKey: .correctMagic)
        self.correctFaith = try container.decode(Double.self, forKey: .correctFaith)
        self.correctLuck = try container.decode(Double.self, forKey: .correctLuck)
        self.weight = try container.decode(Double.self, forKey: .weight)
        self.affinityHelper = try container.decode(Bool.self, forKey: .affinityHelper)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(weaponId, forKey: .weaponId)
        try container.encode(name, forKey: .name)
        try container.encode(sortId, forKey: .sortId)
        try container.encode(reinforceTypeId, forKey: .reinforceTypeId)
        try container.encode(affinityId, forKey: .affinityId)
        try container.encode(attackBasePhysics, forKey: .attackBasePhysics)
        try container.encode(attackBaseMagic, forKey: .attackBaseMagic)
        try container.encode(attackBaseFire, forKey: .attackBaseFire)
        try container.encode(attackBaseThunder, forKey: .attackBaseThunder)
        try container.encode(attackBaseDark, forKey: .attackBaseDark)
        try container.encode(correctStrength, forKey: .correctStrength)
        try container.encode(correctAgility, forKey: .correctAgility)
        try container.encode(correctMagic, forKey: .correctMagic)
        try container.encode(correctFaith, forKey: .correctFaith)
        try container.encode(correctLuck, forKey: .correctLuck)
        try container.encode(weight, forKey: .weight)
        try container.encode(affinityHelper, forKey: .affinityHelper)
    }
}
