//
//  CharacterClass.swift
//  ERSwiftDataLoader
//
//  Created by Makra Flórián Róbert on 29/07/2024.
//

import Foundation
import SwiftData

@Model
class CharacterClass: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case classId, name, level, stats
    }
    
    let id: UUID
    var classId: Int
    var name: String
    var level: Int
    var stats: CharacterStats?
    
    init(from: CharacterClass) {
        self.id = from.id
        self.classId = from.classId
        self.name = from.name
        self.level = from.level
        self.stats = from.stats
    }
    
    init(id: UUID, classId: Int, name: String, level: Int, stats: CharacterStats) {
        self.id = id
        self.classId = classId
        self.name = name
        self.level = level
        self.stats = stats
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.classId = try container.decode(Int.self, forKey: .classId)
        self.name = try container.decode(String.self, forKey: .name)
        self.level = try container.decode(Int.self, forKey: .level)
        self.stats = try container.decodeIfPresent(CharacterStats.self, forKey: .stats)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(classId, forKey: .classId)
        try container.encode(name, forKey: .name)
        try container.encode(level, forKey: .level)
        try container.encode(stats, forKey: .stats)
    }
}

struct CharacterStats: Codable, Hashable {
    enum CodingKeys: CodingKey {
        case vigor, mind, endurance, strength, dexterity, intelligence, faith, arcane
    }
    
    //    let id: UUID
    var vigor: Int
    var mind: Int
    var endurance: Int
    var strength: Int
    var dexterity: Int
    var intelligence: Int
    var faith: Int
    var arcane: Int
    
    init(from: CharacterStats) {
        self.vigor = from.vigor
        self.mind = from.mind
        self.endurance = from.endurance
        self.strength = from.strength
        self.dexterity = from.dexterity
        self.intelligence = from.intelligence
        self.faith = from.faith
        self.arcane = from.arcane
    }
    
    init(vigor: Int, mind: Int, endurance: Int, strength: Int, dexterity: Int, intelligence: Int, faith: Int, arcane: Int) {
        self.vigor = vigor
        self.mind = mind
        self.endurance = endurance
        self.strength = strength
        self.dexterity = dexterity
        self.intelligence = intelligence
        self.faith = faith
        self.arcane = arcane
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.vigor = try container.decode(Int.self, forKey: .vigor)
        self.mind = try container.decode(Int.self, forKey: .mind)
        self.endurance = try container.decode(Int.self, forKey: .endurance)
        self.strength = try container.decode(Int.self, forKey: .strength)
        self.dexterity = try container.decode(Int.self, forKey: .dexterity)
        self.intelligence = try container.decode(Int.self, forKey: .intelligence)
        self.faith = try container.decode(Int.self, forKey: .faith)
        self.arcane = try container.decode(Int.self, forKey: .arcane)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(vigor, forKey: .vigor)
        try container.encode(mind, forKey: .mind)
        try container.encode(endurance, forKey: .endurance)
        try container.encode(strength, forKey: .strength)
        try container.encode(dexterity, forKey: .dexterity)
        try container.encode(intelligence, forKey: .intelligence)
        try container.encode(faith, forKey: .faith)
        try container.encode(arcane, forKey: .arcane)
    }
}
