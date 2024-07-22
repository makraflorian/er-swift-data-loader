//
//  LoadDataApp.swift
//  LoadData
//
//  Created by Makra Flórián Róbert on 24/06/2024.
//

import SwiftUI
import SwiftData

@main
struct LoadDataApp: App {
    
    var weaponsContainer: ModelContainer
    
    ///https://stackoverflow.com/questions/77407501/how-to-pre-populate-an-app-with-a-read-only-store-located-in-the-apps-bundle
    init() {
        do {
            guard let weaponsURL = Bundle.main.url(forResource: Constants.tempFileName, withExtension: nil)  else {
                fatalError("Could not find Weapons datastore in bundle.")
            }
            
            // Code for save in the document directory, for later use
            // Get the default.store
//            let fileManager = FileManager.default
//            let documentDirectoryURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//            let documentURL = documentDirectoryURL.appendingPathComponent("default.store")
//            
//            // Only copy the store from the bundle to the Documents directory if it doesn't exist
//            if !fileManager.fileExists(atPath: documentURL.path) {
//                try fileManager.copyItem(at: weaponsURL, to: documentURL)
//            }
            
            let weaponsConfiguration = ModelConfiguration(url: weaponsURL, allowsSave: false) // allowSave: false - ultramega important
            self.weaponsContainer = try ModelContainer(for: Weapon.self, WeaponUpgrade.self, ElementScaling.self, configurations: weaponsConfiguration)
        } catch {
            fatalError("Failed to setup SwiftData for Weapons: \(error.localizedDescription)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            HostingView()
                .weaponsContainer(weaponsContainer)
        }
    }
}
