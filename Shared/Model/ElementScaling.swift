//
//  ElementScaling.swift
//  ERSwiftDataLoader
//
//  Created by Makra Flórián Róbert on 29/07/2024.
//

import Foundation
import SwiftData

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
