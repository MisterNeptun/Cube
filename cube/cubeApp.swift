//
//  cubeApp.swift
//  cube
//
//  Created by Simon Schweizer on 28.07.2025.
//

import SwiftUI

@main
struct cubeApp: App {
    
    init() {
            UserDefaults.standard.register(defaults: [
                "cooldown": 0.5
            ])
        UserDefaults.standard.register(defaults: [
            "shuffle": 20
        ])
        }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        Settings{
            Settingsmanager()
            
            
            
            
        }
    }
}
