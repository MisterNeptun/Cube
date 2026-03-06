//
//  CubeSettings.swift
//  cube
//
//  Created by Simon Schweizer on 30.12.2025.
//

import SwiftUI

struct CubeSettings: View {
    @AppStorage("cooldown") private var cooldown: Double = 0.5
    var body: some View {
        VStack{
            Text("Time of the animation")
                .frame(alignment: .center)
            
            Slider(
                value: $cooldown, in: 0...2)
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            
            
            Text(String(format: "%.1f",cooldown))
            
                .frame(alignment: .center)
            
        }
    }
}

    
