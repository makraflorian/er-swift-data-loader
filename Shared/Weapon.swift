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

//@Model
struct WeaponAffinity: Codable, Hashable, Identifiable {
    
    enum CodingKeys: CodingKey {
        case weaponId, name, sortId, reinforceTypeId, affinityId, attackBasePhysics, attackBaseMagic, attackBaseFire, attackBaseThunder, attackBaseDark, correctStrength, correctAgility, correctMagic, correctFaith, correctLuck, weight, affinityHelper
    }
    
    //    @Attribute(.unique)
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

@Model
class ElementScaling: Decodable, Identifiable {
    enum CodingKeys: CodingKey {
        case id, rowId, physical, magic, fire, lightning, holy
    }
    
    enum stats: String, Decodable {
        case str, dex, int, fai, arc
    }
    
    let id: UUID
    var rowId: Int
    var physical: [stats]
    var magic: [stats]
    var fire: [stats]
    var lightning: [stats]
    var holy: [stats]
    
    init(from: ElementScaling) {
        self.id = from.id
        self.rowId = from.rowId
        self.physical = from.physical
        self.magic = from.magic
        self.fire = from.fire
        self.lightning = from.lightning
        self.holy = from.holy
    }
    
    init(id: UUID = UUID(), rowId: Int, physical: [stats], magic: [stats], fire: [stats], lightning: [stats], holy: [stats]) {
        self.id = id
        self.rowId = rowId
        self.physical = physical
        self.magic = magic
        self.fire = fire
        self.lightning = lightning
        self.holy = holy
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.rowId = try container.decode(Int.self, forKey: .rowId)
        self.physical = try container.decode([stats].self, forKey: .physical)
        self.magic = try container.decode([stats].self, forKey: .magic)
        self.fire = try container.decode([stats].self, forKey: .fire)
        self.lightning = try container.decode([stats].self, forKey: .lightning)
        self.holy = try container.decode([stats].self, forKey: .holy)
        
    }
}
