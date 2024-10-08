//
//  CorrectGraphRowView.swift
//  LoadData
//
//  Created by Makra Flórián Róbert on 25/07/2024.
//

import SwiftUI
import SwiftData

struct CorrectGraphRowView: View {
    
    @Bindable var correctGraph: CalcCorrectGraph
    
    init(correctGraph: CalcCorrectGraph) {
        self.correctGraph = correctGraph
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(correctGraph.name)")
                    .font(.title2)
                Spacer()
                Text("graphId: \(correctGraph.graphId)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("\(correctGraph.pairs[0].stageMaxVal)")
                Text("\(correctGraph.pairs[0].stageMaxGrowVal)")
                Text("\(correctGraph.pairs[0].adjPt_maxGrowVal)")
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
    }
}
