//
//  Shuffle:Restart.swift
//  cube
//
//  Created by Simon Schweizer on 31.12.2025.
//

import SwiftUI

struct Shuffle_Restart: View {
    @AppStorage("shuffle") private var shuffle: Int = 20
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("Number of shuffle moves")
                .font(.headline)

            Slider(
                value: Binding(
                    get: { Double(shuffle) },
                    set: { shuffle = Int($0) }
                ),
                in: 1...30,
                step: 1
            )
            .padding(.horizontal, 40)

            Text("\(shuffle)")
                .font(.title)

            Button("Start Cube") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
