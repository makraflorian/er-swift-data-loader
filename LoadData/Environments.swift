//
//  Environments.swift
//  ERSwiftDataLoader
//
//  Created by Makra Flórián Róbert on 24/06/2024.
//

import Foundation
import SwiftData
import SwiftUI

struct WeaponsContainer: EnvironmentKey {
    static let defaultValue: ModelContainer = try! .init()
}

extension EnvironmentValues {
    var weaponsContainer: ModelContainer {
        get { self[WeaponsContainer.self] }
        set { self[WeaponsContainer.self] = newValue }
    }
}

extension Scene {
    func weaponsContainer(_ container: ModelContainer) -> some Scene {
        environment(\.weaponsContainer, container)
    }
}

extension View {
    @MainActor func weaponsContainer(_ container: ModelContainer) -> some View {
        environment(\.weaponsContainer, container)
    }
}
