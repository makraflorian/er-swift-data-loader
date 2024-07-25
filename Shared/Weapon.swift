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
class ElementScaling: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case rowId, physical, magic, fire, lightning, holy
    }
    
    enum Stats: String, Codable, Hashable {
        case str, dex, int, fai, arc
    }
    
    let id: UUID
    var rowId: Int
    var physical: [Stats]
    var magic: [Stats]
    var fire: [Stats]
    var lightning: [Stats]
    var holy: [Stats]
    
    init(from: ElementScaling) {
        self.id = from.id
        self.rowId = from.rowId
        self.physical = from.physical
        self.magic = from.magic
        self.fire = from.fire
        self.lightning = from.lightning
        self.holy = from.holy
    }
    
    init(id: UUID = UUID(), rowId: Int, physical: [Stats], magic: [Stats], fire: [Stats], lightning: [Stats], holy: [Stats]) {
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
        self.physical = try container.decode([Stats].self, forKey: .physical)
        self.magic = try container.decode([Stats].self, forKey: .magic)
        self.fire = try container.decode([Stats].self, forKey: .fire)
        self.lightning = try container.decode([Stats].self, forKey: .lightning)
        self.holy = try container.decode([Stats].self, forKey: .holy)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(rowId, forKey: .rowId)
        try container.encode(physical, forKey: .physical)
        try container.encode(magic, forKey: .magic)
        try container.encode(fire, forKey: .fire)
        try container.encode(lightning, forKey: .lightning)
        try container.encode(holy, forKey: .holy)
    }
}

@Model
class CalcCorrectGraph: Codable, Identifiable { // TODO: refactor this name
    
    enum CodingKeys: CodingKey {
        case graphId, name, stageMaxVal0, stageMaxVal1, stageMaxVal2, stageMaxVal3, stageMaxVal4, stageMaxGrowVal0, stageMaxGrowVal1, stageMaxGrowVal2, stageMaxGrowVal3, stageMaxGrowVal4, adjPt_maxGrowVal0, adjPt_maxGrowVal1, adjPt_maxGrowVal2, adjPt_maxGrowVal3, adjPt_maxGrowVal4, init_inclination_soul, adjustment_value, boundry_inclination_soul, boundry_value
    }
    
    let id: UUID
    var graphId: Int
    var name: String
    var stageMaxVal0: Double
    var stageMaxVal1: Double
    var stageMaxVal2: Double
    var stageMaxVal3: Double
    var stageMaxVal4: Double
    var stageMaxGrowVal0: Double
    var stageMaxGrowVal1: Double
    var stageMaxGrowVal2: Double
    var stageMaxGrowVal3: Double
    var stageMaxGrowVal4: Double
    var adjPt_maxGrowVal0: Double
    var adjPt_maxGrowVal1: Double
    var adjPt_maxGrowVal2: Double
    var adjPt_maxGrowVal3: Double
    var adjPt_maxGrowVal4: Double
    var init_inclination_soul: Double
    var adjustment_value: Double
    var boundry_inclination_soul: Double
    var boundry_value: Double
    
    init(from: CalcCorrectGraph) {
        self.id = from.id
        self.graphId = from.graphId
        self.name = from.name
        self.stageMaxVal0 = from.stageMaxVal0
        self.stageMaxVal1 = from.stageMaxVal1
        self.stageMaxVal2 = from.stageMaxVal2
        self.stageMaxVal3 = from.stageMaxVal3
        self.stageMaxVal4 = from.stageMaxVal4
        self.stageMaxGrowVal0 = from.stageMaxGrowVal0
        self.stageMaxGrowVal1 = from.stageMaxGrowVal1
        self.stageMaxGrowVal2 = from.stageMaxGrowVal2
        self.stageMaxGrowVal3 = from.stageMaxGrowVal3
        self.stageMaxGrowVal4 = from.stageMaxGrowVal4
        self.adjPt_maxGrowVal0 = from.adjPt_maxGrowVal0
        self.adjPt_maxGrowVal1 = from.adjPt_maxGrowVal1
        self.adjPt_maxGrowVal2 = from.adjPt_maxGrowVal2
        self.adjPt_maxGrowVal3 = from.adjPt_maxGrowVal3
        self.adjPt_maxGrowVal4 = from.adjPt_maxGrowVal4
        self.init_inclination_soul = from.init_inclination_soul
        self.adjustment_value = from.adjustment_value
        self.boundry_inclination_soul = from.boundry_inclination_soul
        self.boundry_value = from.boundry_value
    }
    
    init(id: UUID = UUID(), graphId: Int, name: String, stageMaxVal0: Double, stageMaxVal1: Double, stageMaxVal2: Double, stageMaxVal3: Double, stageMaxVal4: Double, stageMaxGrowVal0: Double, stageMaxGrowVal1: Double, stageMaxGrowVal2: Double, stageMaxGrowVal3: Double, stageMaxGrowVal4: Double, adjPt_maxGrowVal0: Double, adjPt_maxGrowVal1: Double, adjPt_maxGrowVal2: Double, adjPt_maxGrowVal3: Double, adjPt_maxGrowVal4: Double, init_inclination_soul: Double, adjustment_value: Double, boundry_inclination_soul: Double, boundry_value: Double) {
        self.id = id
        self.graphId = graphId
        self.name = name
        self.stageMaxVal0 = stageMaxVal0
        self.stageMaxVal1 = stageMaxVal1
        self.stageMaxVal2 = stageMaxVal2
        self.stageMaxVal3 = stageMaxVal3
        self.stageMaxVal4 = stageMaxVal4
        self.stageMaxGrowVal0 = stageMaxGrowVal0
        self.stageMaxGrowVal1 = stageMaxGrowVal1
        self.stageMaxGrowVal2 = stageMaxGrowVal2
        self.stageMaxGrowVal3 = stageMaxGrowVal3
        self.stageMaxGrowVal4 = stageMaxGrowVal4
        self.adjPt_maxGrowVal0 = adjPt_maxGrowVal0
        self.adjPt_maxGrowVal1 = adjPt_maxGrowVal1
        self.adjPt_maxGrowVal2 = adjPt_maxGrowVal2
        self.adjPt_maxGrowVal3 = adjPt_maxGrowVal3
        self.adjPt_maxGrowVal4 = adjPt_maxGrowVal4
        self.init_inclination_soul = init_inclination_soul
        self.adjustment_value = adjustment_value
        self.boundry_inclination_soul = boundry_inclination_soul
        self.boundry_value = boundry_value
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.graphId = try container.decode(Int.self, forKey: .graphId)
        self.name = try container.decode(String.self, forKey: .name)
        self.stageMaxVal0 = try container.decode(Double.self, forKey: .stageMaxVal0)
        self.stageMaxVal1 = try container.decode(Double.self, forKey: .stageMaxVal1)
        self.stageMaxVal2 = try container.decode(Double.self, forKey: .stageMaxVal2)
        self.stageMaxVal3 = try container.decode(Double.self, forKey: .stageMaxVal3)
        self.stageMaxVal4 = try container.decode(Double.self, forKey: .stageMaxVal4)
        self.stageMaxGrowVal0 = try container.decode(Double.self, forKey: .stageMaxGrowVal0)
        self.stageMaxGrowVal1 = try container.decode(Double.self, forKey: .stageMaxGrowVal1)
        self.stageMaxGrowVal2 = try container.decode(Double.self, forKey: .stageMaxGrowVal2)
        self.stageMaxGrowVal3 = try container.decode(Double.self, forKey: .stageMaxGrowVal3)
        self.stageMaxGrowVal4 = try container.decode(Double.self, forKey: .stageMaxGrowVal4)
        self.adjPt_maxGrowVal0 = try container.decode(Double.self, forKey: .adjPt_maxGrowVal0)
        self.adjPt_maxGrowVal1 = try container.decode(Double.self, forKey: .adjPt_maxGrowVal1)
        self.adjPt_maxGrowVal2 = try container.decode(Double.self, forKey: .adjPt_maxGrowVal2)
        self.adjPt_maxGrowVal3 = try container.decode(Double.self, forKey: .adjPt_maxGrowVal3)
        self.adjPt_maxGrowVal4 = try container.decode(Double.self, forKey: .adjPt_maxGrowVal4)
        self.init_inclination_soul = try container.decode(Double.self, forKey: .init_inclination_soul)
        self.adjustment_value = try container.decode(Double.self, forKey: .adjustment_value)
        self.boundry_inclination_soul = try container.decode(Double.self, forKey: .boundry_inclination_soul)
        self.boundry_value = try container.decode(Double.self, forKey: .boundry_value)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(graphId, forKey: .graphId)
        try container.encode(name, forKey: .name)
        try container.encode(stageMaxVal0, forKey: .stageMaxVal0)
        try container.encode(stageMaxVal1, forKey: .stageMaxVal1)
        try container.encode(stageMaxVal2, forKey: .stageMaxVal2)
        try container.encode(stageMaxVal3, forKey: .stageMaxVal3)
        try container.encode(stageMaxVal4, forKey: .stageMaxVal4)
        try container.encode(stageMaxGrowVal0, forKey: .stageMaxGrowVal0)
        try container.encode(stageMaxGrowVal1, forKey: .stageMaxGrowVal1)
        try container.encode(stageMaxGrowVal2, forKey: .stageMaxGrowVal2)
        try container.encode(stageMaxGrowVal3, forKey: .stageMaxGrowVal3)
        try container.encode(stageMaxGrowVal4, forKey: .stageMaxGrowVal4)
        try container.encode(adjPt_maxGrowVal0, forKey: .adjPt_maxGrowVal0)
        try container.encode(adjPt_maxGrowVal1, forKey: .adjPt_maxGrowVal1)
        try container.encode(adjPt_maxGrowVal2, forKey: .adjPt_maxGrowVal2)
        try container.encode(adjPt_maxGrowVal3, forKey: .adjPt_maxGrowVal3)
        try container.encode(adjPt_maxGrowVal4, forKey: .adjPt_maxGrowVal4)
        try container.encode(init_inclination_soul, forKey: .init_inclination_soul)
        try container.encode(adjustment_value, forKey: .adjustment_value)
        try container.encode(boundry_inclination_soul, forKey: .boundry_inclination_soul)
        try container.encode(boundry_value, forKey: .boundry_value)
    }
}

