//
//  CalcCorrectGraph.swift
//  ERSwiftDataLoader
//
//  Created by Makra Flórián Róbert on 29/07/2024.
//

import Foundation
import SwiftData
import SwiftDataModelMirror

@ModelMirror
@Model
class CalcCorrectGraph: Codable, Identifiable {
    // TODO: refactor this name
    enum CodingKeys: CodingKey {
        case graphId, name, pairs
    }
    
    let id: UUID
    var graphId: Int
    var name: String
    var pairs: [Pairs]
    
    init(from: CalcCorrectGraph) {
        self.id = from.id
        self.graphId = from.graphId
        self.name = from.name
        self.pairs = from.pairs
    }
    
    internal init(id: UUID, graphId: Int, name: String, pairs: [Pairs]) {
        self.id = id
        self.graphId = graphId
        self.name = name
        self.pairs = pairs
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.graphId = try container.decode(Int.self, forKey: .graphId)
        self.name = try container.decode(String.self, forKey: .name)
        self.pairs = try container.decode([Pairs].self, forKey: .pairs)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(graphId, forKey: .graphId)
        try container.encode(name, forKey: .name)
        try container.encode(pairs, forKey: .pairs)
    }
}

struct Pairs: Codable, Hashable {
    
    enum CodingKeys: CodingKey {
        case stageMaxVal, stageMaxGrowVal, adjPt_maxGrowVal
    }
    
    var stageMaxVal: Double
    var stageMaxGrowVal: Double
    var adjPt_maxGrowVal: Double
    
    init(from: Pairs) {
        self.stageMaxVal = from.stageMaxVal
        self.stageMaxGrowVal = from.stageMaxGrowVal
        self.adjPt_maxGrowVal = from.adjPt_maxGrowVal
    }
    
    init(stageMaxVal: Double, stageMaxGrowVal: Double, adjPt_maxGrowVal: Double) {
        self.stageMaxVal = stageMaxVal
        self.stageMaxGrowVal = stageMaxGrowVal
        self.adjPt_maxGrowVal = adjPt_maxGrowVal
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.stageMaxVal = try container.decode(Double.self, forKey: .stageMaxVal)
        self.stageMaxGrowVal = try container.decode(Double.self, forKey: .stageMaxGrowVal)
        self.adjPt_maxGrowVal = try container.decode(Double.self, forKey: .adjPt_maxGrowVal)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(stageMaxVal, forKey: .stageMaxVal)
        try container.encode(stageMaxGrowVal, forKey: .stageMaxGrowVal)
        try container.encode(adjPt_maxGrowVal, forKey: .adjPt_maxGrowVal)
    }
}
