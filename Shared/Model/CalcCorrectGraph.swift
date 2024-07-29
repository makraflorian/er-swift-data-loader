//
//  CalcCorrectGraph.swift
//  ERSwiftDataLoader
//
//  Created by Makra Flórián Róbert on 29/07/2024.
//

import Foundation
import SwiftData

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
