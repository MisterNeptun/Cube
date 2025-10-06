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
                    Button("F'") {
                        controller.rotateFrontinverse()
                       
                    }
                    .padding()
                    Button("B") {
                        controller.rotateBack()
                       
                    }
                    .padding()
                    Button("B'") {
                        controller.rotateBackinverse()
                        
                    }
                    .padding()
                    
                    Button("U ") {
                        controller.rotateUp()
                        
                    }
                    .padding()
                    Button("U'") {
                        controller.rotateUpinverse()
                        
                    }
                    .padding()
                    Button("D") {
                        controller.rotateDown()
                        
                    }
                    .padding()
                    Button("D'") {
                        controller.rotateDowninverse()
                       
                    }
                    .padding()
                    
                    Button("L ") {
                        controller.rotateLeft()
                        
                    }
                    .padding()
                    Button("L'") {
                        controller.rotateLeftinverse()
                        
                    }
                    .padding()
                    Button("R") {
                        controller.rotateRight()
                        
                    }
                    .padding()
                    Button("R'") {
                        controller.rotateRightinverse()
                        
                    }
                    .padding()
                }}
            if controller.isSolved == true {
                    
                    Text("gelöst")
                }
            }
       
    }
    
}


