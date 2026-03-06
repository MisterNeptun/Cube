//
//  Settingsmanager.swift
//  cube
//
//  Created by Simon Schweizer on 06.10.2025.
//

import SwiftUI

struct Settingsmanager: View {
    var body: some View {
        TabView{
            Tab("App", systemImage: "play.square"){
                EmptyView()
            }
            
            Tab("Cube", systemImage: "cube"){
                EmptyView()
            }
            
            
            
        }.frame(maxWidth: 500, minHeight: 350)
    }
}

#Preview {
    Settingsmanager()
}
