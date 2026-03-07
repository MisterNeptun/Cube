//
//  cubescenecontroller.swift
//  cube
//
//  Created by Simon Schweizer on 02.08.2025.
import Foundation
import SwiftUI
import SceneKit

import Combine

class CubeSceneController: ObservableObject {
    
    @Published var isRotating: Bool = false
    
    let scene = SCNScene()
    var cubeNode = RubiksCubeNode()
    @Published var isSolved: Bool = false
    
    init() {
        scene.background.contents = NSColor.lightGray
        scene.rootNode.addChildNode(cubeNode)

        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 10)
        scene.rootNode.addChildNode(cameraNode)

        let light = SCNLight()
        light.type = .ambient
        light.intensity = 1000
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(0, 100, 100)
        scene.rootNode.addChildNode(lightNode)
    }

    func rotateFront() {
        
        guard !isRotating else { return }
            isRotating = true
        
        cubeNode.F_clockwise_model()
        cubeNode.model=F_clockwise(cubeNode.model)
        isSolved = testsolve()
        DispatchQueue.main.asyncAfter(deadline: .now() + UserDefaults.standard.double(forKey: "cooldown")) {
                self.isRotating = false
            }
    }
    func rotateFrontinverse() {
        guard !isRotating else { return }
            isRotating = true
        
        cubeNode.F_notclockwise_model()
        cubeNode.model=F_notclockwise(cubeNode.model)
        isSolved = testsolve()
        DispatchQueue.main.asyncAfter(deadline: .now() + UserDefaults.standard.double(forKey: "cooldown")) {
                self.isRotating = false
            }
    }
    func rotateBack() {
        guard !isRotating else { return }
            isRotating = true
        
        cubeNode.B_clockwise_model()
        cubeNode.model=B_clockwise(cubeNode.model)
        isSolved = testsolve()
        DispatchQueue.main.asyncAfter(deadline: .now() + UserDefaults.standard.double(forKey: "cooldown")) {
                self.isRotating = false
            }
    }
    func rotateBackinverse() {
        guard !isRotating else { return }
            isRotating = true
        
        cubeNode.B_notclockwise_model()
        cubeNode.model=B_notclockwise(cubeNode.model)
        isSolved = testsolve()
        DispatchQueue.main.asyncAfter(deadline: .now() + UserDefaults.standard.double(forKey: "cooldown")) {
                self.isRotating = false
            }
    }
    func rotateUp() {
        guard !isRotating else { return }
            isRotating = true
        
        cubeNode.U_clockwise_model()
        cubeNode.model=U_clockwise(cubeNode.model)
        isSolved = testsolve()
        DispatchQueue.main.asyncAfter(deadline: .now() + UserDefaults.standard.double(forKey: "cooldown")) {
                self.isRotating = false
            }
    }
    func rotateUpinverse() {
        guard !isRotating else { return }
            isRotating = true
        
        cubeNode.U_notclockwise_model()
        cubeNode.model=U_notclockwise(cubeNode.model)
        isSolved = testsolve()
        DispatchQueue.main.asyncAfter(deadline: .now() + UserDefaults.standard.double(forKey: "cooldown")) {
                self.isRotating = false
            }
    }
    func rotateDown() {
        guard !isRotating else { return }
            isRotating = true
        
        cubeNode.D_clockwise_model()
        cubeNode.model=D_clockwise(cubeNode.model)
        isSolved = testsolve()
        DispatchQueue.main.asyncAfter(deadline: .now() + UserDefaults.standard.double(forKey: "cooldown")) {
                self.isRotating = false
            }
    }
    func rotateDowninverse() {
        guard !isRotating else { return }
            isRotating = true
        
        cubeNode.D_notclockwise_model()
        cubeNode.model=D_notclockwise(cubeNode.model)
        isSolved = testsolve()
        DispatchQueue.main.asyncAfter(deadline: .now() + UserDefaults.standard.double(forKey: "cooldown")) {
                self.isRotating = false
            }
    }
    func rotateLeft() {
        guard !isRotating else { return }
            isRotating = true
        
        cubeNode.L_clockwise_model()
        cubeNode.model=L_clockwise(cubeNode.model)
        isSolved = testsolve()
        DispatchQueue.main.asyncAfter(deadline: .now() + UserDefaults.standard.double(forKey: "cooldown")) {
                self.isRotating = false
            }
        
    }
    func rotateLeftinverse() {
        guard !isRotating else { return }
            isRotating = true
        
        cubeNode.L_notclockwise_model()
        cubeNode.model=L_notclockwise(cubeNode.model)
        isSolved = testsolve()
        DispatchQueue.main.asyncAfter(deadline: .now() + UserDefaults.standard.double(forKey: "cooldown")) {
                self.isRotating = false
            }
    }
    func rotateRight() {
        guard !isRotating else { return }
            isRotating = true
        
        cubeNode.R_clockwise_model()
        cubeNode.model=R_clockwise(cubeNode.model)
        isSolved = testsolve()
        DispatchQueue.main.asyncAfter(deadline: .now() + UserDefaults.standard.double(forKey: "cooldown")) {
                self.isRotating = false
            }
    }
    func rotateRightinverse() {
        guard !isRotating else { return }
            isRotating = true
        
        cubeNode.R_notclockwise_model()
        cubeNode.model=R_notclockwise(cubeNode.model)
        isSolved = testsolve()
        DispatchQueue.main.asyncAfter(deadline: .now() + UserDefaults.standard.double(forKey: "cooldown")) {
                self.isRotating = false
            }
    }
    
    
    
    
    func testsolve()->Bool{
        print(cubeNode.model)
        if cubeNode.model.front==[[1, 1, 1], [1, 1, 1], [1, 1, 1]] && cubeNode.model.back==[[4, 4, 4], [4, 4, 4], [4, 4, 4]] && cubeNode.model.left==[[5, 5, 5], [5, 5, 5], [5, 5, 5]] && cubeNode.model.right==[[6, 6, 6], [6, 6, 6], [6, 6, 6]] && cubeNode.model.top==[[3, 3, 3], [3, 3, 3], [3, 3, 3]] && cubeNode.model.bottom==[[2, 2, 2], [2, 2, 2], [2, 2, 2]]{
            
            return true
        }
        else{
            return false
        }
    }
    
    
    
    
    
    
    func restart() {
        guard !isRotating else { return }

        isRotating = true
        isSolved = false

        // Alten Würfel entfernen
        cubeNode.removeFromParentNode()

        // Neuen Würfel erzeugen
        cubeNode = RubiksCubeNode()
        scene.rootNode.addChildNode(cubeNode)

        // Buttons sofort wieder freigeben
        isRotating = false
    }
}









