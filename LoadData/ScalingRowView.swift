//
//  ScalingRowView.swift
//  LoadData
//
//  Created by Makra Flórián Róbert on 22/07/2024.
//

import SwiftUI
import SwiftData

struct ScalingRowView: View {
    
    @Bindable var scaling: ElementScaling
    
    init(scaling: ElementScaling) {
        self.scaling = scaling
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(scaling.rowId)")
                    .font(.title2)
                Spacer()
                Text("physical: \(scaling.physical.count)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            HStack {
                ForEach(scaling.physical, id: \.self) { scale in
                    Text("\(scale.rawValue)")
                }
            }
        }
    }
}
