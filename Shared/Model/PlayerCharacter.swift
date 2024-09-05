////
////  PlayerCharacter.swift
////  ERSwiftDataLoader
////
////  Created by Makra Flórián Róbert on 08/08/2024.
////
//
//import Foundation
//import SwiftData
//
//@Model
//class PlayerCharacter: Identifiable {
//    
//    let id: UUID
//    var classId: Int
//    var name: String
//    var level: Int
//    var stats: CharacterStats?
//    var equipment: Equipment?
//    
//    init(from: PlayerCharacter) {
//        self.id = from.id
//        self.classId = from.classId
//        self.name = from.name
//        self.level = from.level
//        self.stats = from.stats
//        self.equipment = from.equipment
//    }
//    
//    init(id: UUID, classId: Int, name: String, level: Int, stats: CharacterStats, equipment: Equipment) {
//        self.id = id
//        self.classId = classId
//        self.name = name
//        self.level = level
//        self.stats = stats
//        self.equipment = equipment
//    }
//}
//
//struct Equipment: Codable, Hashable {
//    
//    // only store ID-s, need to figure out how to cache some data and only calculate again on equipment or stat change
//    // Temp solution, gonna need proper types for head/chest..etc gear, right/left armament
//    // rn it is good enough, i have zero armor data
//    
//    var weapons: [Int]
//    var armors: [Int]
//    var talismans: [Int]
//}
