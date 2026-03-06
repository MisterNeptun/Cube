//
//  cubescenecontroller.swift
//  cube
//
//  Created by Simon Schweizer on 02.08.2025.
import Foundation
import SwiftUI
import SceneKit



class CubeSceneController: ObservableObject {
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
        
        cubeNode.F_clockwise_model()
        cubeNode.model=F_clockwise(cubeNode.model)
        isSolved = testsolve()
    }
    func rotateFrontinverse() {
        
        cubeNode.F_notclockwise_model()
        cubeNode.model=F_notclockwise(cubeNode.model)
        isSolved = testsolve()
    }
    func rotateBack() {
        
        cubeNode.B_clockwise_model()
        cubeNode.model=B_clockwise(cubeNode.model)
        isSolved = testsolve()
    }
    func rotateBackinverse() {
        
        cubeNode.B_notclockwise_model()
        cubeNode.model=B_notclockwise(cubeNode.model)
        isSolved = testsolve()
    }
    func rotateUp() {
        
        cubeNode.U_clockwise_model()
        cubeNode.model=U_clockwise(cubeNode.model)
        isSolved = testsolve()
    }
    func rotateUpinverse() {
        
        cubeNode.U_notclockwise_model()
        cubeNode.model=U_notclockwise(cubeNode.model)
        isSolved = testsolve()
    }
    func rotateDown() {
        
        cubeNode.D_clockwise_model()
        cubeNode.model=D_clockwise(cubeNode.model)
        isSolved = testsolve()
    }
    func rotateDowninverse() {
        
        cubeNode.D_notclockwise_model()
        cubeNode.model=D_notclockwise(cubeNode.model)
        isSolved = testsolve()
    }
    func rotateLeft() {
        
        cubeNode.L_clockwise_model()
        cubeNode.model=L_clockwise(cubeNode.model)
        isSolved = testsolve()
        
    }
    func rotateLeftinverse() {
        
        cubeNode.L_notclockwise_model()
        cubeNode.model=L_notclockwise(cubeNode.model)
        isSolved = testsolve()
    }
    func rotateRight() {
        
        cubeNode.R_clockwise_model()
        cubeNode.model=R_clockwise(cubeNode.model)
        isSolved = testsolve()
    }
    func rotateRightinverse() {
        
        cubeNode.R_notclockwise_model()
        cubeNode.model=R_notclockwise(cubeNode.model)
        isSolved = testsolve()
    }
    
    
    
    
    func testsolve()->Bool{
        print(cubeNode.model)
        if cubeNode.model.front==[[0, 0, 0], [0, 0, 0], [0, 0, 0]] && cubeNode.model.back==[[3, 3, 3], [3, 3, 3], [3, 3, 3]] && cubeNode.model.left==[[4, 4, 4], [4, 4, 4], [4, 4, 4]] && cubeNode.model.right==[[5, 5, 5], [5, 5, 5], [5, 5, 5]] && cubeNode.model.top==[[2, 2, 2], [2, 2, 2], [2, 2, 2]] && cubeNode.model.bottom==[[1, 1, 1], [1, 1, 1], [1, 1, 1]]{
            
            return true
        }
        else{
            return false
        }
    }
}
