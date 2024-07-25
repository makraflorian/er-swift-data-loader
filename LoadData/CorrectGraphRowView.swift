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
                Text("\(correctGraph.stageMaxVal0)")
                Text("\(correctGraph.stageMaxVal1)")
                Text("\(correctGraph.stageMaxVal3)")
                Text("\(correctGraph.stageMaxVal4)")
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
    }
}
