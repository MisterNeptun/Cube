//
//  ContentView.swift
//  cube
//
//  Created by Simon Schweizer on 28.07.2025.
//
import SwiftUI
import SceneKit

struct modelView: View {
    @StateObject var controller = CubeSceneController()
    @State private var showShuffleSheet = true
    var body: some View {
        
        VStack {
            SceneView(
                scene: controller.scene,
                pointOfView: nil,
                options: [.allowsCameraControl],
                preferredFramesPerSecond: 60,
                antialiasingMode: .multisampling4X
            )
            .ignoresSafeArea()
            if controller.isSolved == false{
                HStack{
                    Button("F ") {
                        controller.rotateFront()
                        
                    }
                    .padding()
                    .disabled(controller.isRotating)
                    
                    Button("F'") {
                        controller.rotateFrontinverse()
                        
                    }
                    .padding()
                    .disabled(controller.isRotating)
                    
                    Button("B") {
                        controller.rotateBack()
                        
                    }
                    .padding()
                    .disabled(controller.isRotating)
                    
                    Button("B'") {
                        controller.rotateBackinverse()
                        
                    }
                    .padding()
                    .disabled(controller.isRotating)
                    
                    Button("U ") {
                        controller.rotateUp()
                        
                    }
                    .padding()
                    .disabled(controller.isRotating)
                    
                    Button("U'") {
                        controller.rotateUpinverse()
                        
                    }
                    .padding()
                    .disabled(controller.isRotating)
                    
                    Button("D") {
                        controller.rotateDown()
                        
                    }
                    .padding()
                    .disabled(controller.isRotating)
                    
                    Button("D'") {
                        controller.rotateDowninverse()
                        
                    }
                    .padding()
                    .disabled(controller.isRotating)
                    
                    Button("L ") {
                        controller.rotateLeft()
                        
                    }
                    .padding()
                    .disabled(controller.isRotating)
                    
                    Button("L'") {
                        controller.rotateLeftinverse()
                        
                    }
                    .padding()
                    .disabled(controller.isRotating)
                    
                    Button("R") {
                        controller.rotateRight()
                        
                    }
                    .padding()
                    .disabled(controller.isRotating)
                    
                    Button("R'") {
                        controller.rotateRightinverse()
                        
                    }
                    .padding()
                    .disabled(controller.isRotating)
                    
                }}
            else {
                
                Button("Restart") {
                    showShuffleSheet = true
                    
                }.padding()
                    
                            
                        
                        
                        
                    }
            }.sheet(isPresented: $showShuffleSheet,onDismiss: {controller.restart()}) {
                Shuffle_Restart ()
            
        }
        
    }
    
}
