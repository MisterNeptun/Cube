import SceneKit
import SwiftUI


class RubiksCubeNode: SCNNode {
    
    
    let cubieSize: CGFloat = 0.95
    let spacing: CGFloat = 1.0
    var model: RubiksCube

    override init() {
        model = init_cube()
        
       
       model=shuffle(cube: model)
        
        super.init()
        
        buildCube(from: model)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func colorForIndex(_ index: Int) -> NSColor {
        switch index {
        case 1: return .green   // Front
        case 2: return .white   // Bottom
        case 3: return .yellow    // Top
        case 4: return .blue  // Back
        case 5: return .red  // Left
        case 6: return .orange     // Right
        default: return .gray
        }
    }

    private func buildCube(from model: RubiksCube) {
        
        for x in -1...1 {
            for y in -1...1 {
                for z in -1...1 {
                    if x == 0 && y == 0 && z == 0 { continue }

                    let cube = SCNBox(width: cubieSize, height: cubieSize, length: cubieSize, chamferRadius: 0.05)
                    var materials = (0..<6).map { _ in
                        let mat = SCNMaterial()
                        mat.diffuse.contents = NSColor.darkGray
                        return mat
                    }

                    if z == 1 {
                        materials[0].diffuse.contents = colorForIndex(model.front[2 - (y + 1)][x + 1])
                    }
                    if z == -1 {
                        materials[2].diffuse.contents = colorForIndex(model.back[2 - (y + 1)][2 - (x + 1)])
                    }
                    if y == 1 {
                        materials[4].diffuse.contents = colorForIndex(model.top[z + 1][x + 1])
                    }
                    if y == -1 {
                        materials[5].diffuse.contents = colorForIndex(model.bottom[2 - (z + 1)][x + 1])
                    }
                    if x == -1 {
                        materials[3].diffuse.contents = colorForIndex(model.left[2 - (y + 1)][z + 1])
                    }
                    if x == 1 {
                        materials[1].diffuse.contents = colorForIndex(model.right[2 - (y + 1)][2 - (z + 1)])
                    }

                    cube.materials = materials

                    let node = SCNNode(geometry: cube)
                    node.position = SCNVector3(
                        Float(x) * Float(spacing),
                        Float(y) * Float(spacing),
                        Float(z) * Float(spacing)
                    )
                    node.name = "cubie_\(x)_\(y)_\(z)"
                    self.addChildNode(node)
                }
            }
        }
    }

    
    func F_clockwise_model() {
        
        let rotationNode = SCNNode()
        self.addChildNode(rotationNode)

        for cubie in self.childNodes where cubie.name?.starts(with: "cubie") == true {
            if abs(cubie.position.z - 1.0) < 0.1 {
                cubie.removeFromParentNode()
                rotationNode.addChildNode(cubie)
            }
        }
        let action = SCNAction.rotateBy(x: 0, y: 0, z: -.pi / 2, duration: UserDefaults.standard.double(forKey: "cooldown"))
        rotationNode.runAction(action) {
            
            for cubie in rotationNode.childNodes {
                       
                        let worldTransform = cubie.worldTransform
                        cubie.removeFromParentNode()
                        cubie.transform = self.convertTransform(worldTransform, from: nil)
                        self.addChildNode(cubie)
                    }
                    rotationNode.removeFromParentNode()
                }
            }
    func F_notclockwise_model() {
        
        let rotationNode = SCNNode()
        self.addChildNode(rotationNode)

        for cubie in self.childNodes where cubie.name?.starts(with: "cubie") == true {
            if abs(cubie.position.z - 1.0) < 0.1 {
                cubie.removeFromParentNode()
                rotationNode.addChildNode(cubie)
            }
        }
        let action = SCNAction.rotateBy(x: 0, y: 0, z: .pi / 2, duration: UserDefaults.standard.double(forKey: "cooldown"))
        rotationNode.runAction(action) {
            
            for cubie in rotationNode.childNodes {
                       
                        let worldTransform = cubie.worldTransform
                        cubie.removeFromParentNode()
                        cubie.transform = self.convertTransform(worldTransform, from: nil)
                        self.addChildNode(cubie)
                    }
                    rotationNode.removeFromParentNode()
                }
            }
    
    
    
    
    
    
    
    func B_clockwise_model() {
        
        let rotationNode = SCNNode()
        self.addChildNode(rotationNode)

        for cubie in self.childNodes where cubie.name?.starts(with: "cubie") == true {
            if abs(cubie.position.z + 1.0) < 0.1 {
                cubie.removeFromParentNode()
                rotationNode.addChildNode(cubie)
            }
        }
        let action = SCNAction.rotateBy(x: 0, y: 0, z: .pi / 2, duration: UserDefaults.standard.double(forKey: "cooldown"))
        rotationNode.runAction(action) {
            
            for cubie in rotationNode.childNodes {
                       
                        let worldTransform = cubie.worldTransform
                        cubie.removeFromParentNode()
                        cubie.transform = self.convertTransform(worldTransform, from: nil)
                        self.addChildNode(cubie)
                    }
                    rotationNode.removeFromParentNode()
                }
            }
    func B_notclockwise_model() {
        
        let rotationNode = SCNNode()
        self.addChildNode(rotationNode)

        for cubie in self.childNodes where cubie.name?.starts(with: "cubie") == true {
            if abs(cubie.position.z + 1.0) < 0.1 {
                cubie.removeFromParentNode()
                rotationNode.addChildNode(cubie)
            }
        }
        let action = SCNAction.rotateBy(x: 0, y: 0, z: -.pi / 2, duration: UserDefaults.standard.double(forKey: "cooldown"))
        rotationNode.runAction(action) {
            
            for cubie in rotationNode.childNodes {
                       
                        let worldTransform = cubie.worldTransform
                        cubie.removeFromParentNode()
                        cubie.transform = self.convertTransform(worldTransform, from: nil)
                        self.addChildNode(cubie)
                    }
                    rotationNode.removeFromParentNode()
                }
            }
    
    
    
    
    func U_clockwise_model() {
        
        let rotationNode = SCNNode()
        self.addChildNode(rotationNode)

        for cubie in self.childNodes where cubie.name?.starts(with: "cubie") == true {
            if abs(cubie.position.y - 1.0) < 0.1 {
                cubie.removeFromParentNode()
                rotationNode.addChildNode(cubie)
            }
        }
        let action = SCNAction.rotateBy(x: 0, y: -.pi/2, z: 0, duration: UserDefaults.standard.double(forKey: "cooldown"))
        rotationNode.runAction(action) {
            
            for cubie in rotationNode.childNodes {
                       
                        let worldTransform = cubie.worldTransform
                        cubie.removeFromParentNode()
                        cubie.transform = self.convertTransform(worldTransform, from: nil)
                        self.addChildNode(cubie)
                    }
                    rotationNode.removeFromParentNode()
                }
            }
    func U_notclockwise_model() {
        
        let rotationNode = SCNNode()
        self.addChildNode(rotationNode)

        for cubie in self.childNodes where cubie.name?.starts(with: "cubie") == true {
            if abs(cubie.position.y - 1.0) < 0.1 {
                cubie.removeFromParentNode()
                rotationNode.addChildNode(cubie)
            }
        }
        let action = SCNAction.rotateBy(x: 0, y:  .pi / 2, z:0, duration: UserDefaults.standard.double(forKey: "cooldown"))
        rotationNode.runAction(action) {
            
            for cubie in rotationNode.childNodes {
                       
                        let worldTransform = cubie.worldTransform
                        cubie.removeFromParentNode()
                        cubie.transform = self.convertTransform(worldTransform, from: nil)
                        self.addChildNode(cubie)
                    }
                    rotationNode.removeFromParentNode()
                }
            }
    
    
    
    
    
    
    
    func D_clockwise_model() {
        
        let rotationNode = SCNNode()
        self.addChildNode(rotationNode)

        for cubie in self.childNodes where cubie.name?.starts(with: "cubie") == true {
            if abs(cubie.position.y + 1.0) < 0.1 {
                cubie.removeFromParentNode()
                rotationNode.addChildNode(cubie)
            }
        }
        let action = SCNAction.rotateBy(x: 0, y: .pi / 2, z: 0, duration: UserDefaults.standard.double(forKey: "cooldown"))
        rotationNode.runAction(action) {
            
            for cubie in rotationNode.childNodes {
                       
                        let worldTransform = cubie.worldTransform
                        cubie.removeFromParentNode()
                        cubie.transform = self.convertTransform(worldTransform, from: nil)
                        self.addChildNode(cubie)
                    }
                    rotationNode.removeFromParentNode()
                }
            }
    func D_notclockwise_model() {
        
        let rotationNode = SCNNode()
        self.addChildNode(rotationNode)

        for cubie in self.childNodes where cubie.name?.starts(with: "cubie") == true {
            if abs(cubie.position.y + 1.0) < 0.1 {
                cubie.removeFromParentNode()
                rotationNode.addChildNode(cubie)
            }
        }
        let action = SCNAction.rotateBy(x: 0, y: -.pi / 2, z: 0, duration: UserDefaults.standard.double(forKey: "cooldown"))
        rotationNode.runAction(action) {
            
            for cubie in rotationNode.childNodes {
                       
                        let worldTransform = cubie.worldTransform
                        cubie.removeFromParentNode()
                        cubie.transform = self.convertTransform(worldTransform, from: nil)
                        self.addChildNode(cubie)
                    }
                    rotationNode.removeFromParentNode()
                }
            }
    
    
    
    
    
    func L_clockwise_model() {
        
        let rotationNode = SCNNode()
        self.addChildNode(rotationNode)

        for cubie in self.childNodes where cubie.name?.starts(with: "cubie") == true {
            if abs(cubie.position.x + 1.0) < 0.1 {
                cubie.removeFromParentNode()
                rotationNode.addChildNode(cubie)
            }
        }
        let action = SCNAction.rotateBy(x:  .pi/2, y:0, z: 0, duration: UserDefaults.standard.double(forKey: "cooldown"))
        rotationNode.runAction(action) {
            
            for cubie in rotationNode.childNodes {
                       
                        let worldTransform = cubie.worldTransform
                        cubie.removeFromParentNode()
                        cubie.transform = self.convertTransform(worldTransform, from: nil)
                        self.addChildNode(cubie)
                    }
                    rotationNode.removeFromParentNode()
                }
            }
    func L_notclockwise_model() {
        
        let rotationNode = SCNNode()
        self.addChildNode(rotationNode)

        for cubie in self.childNodes where cubie.name?.starts(with: "cubie") == true {
            if abs(cubie.position.x + 1.0) < 0.1 {
                cubie.removeFromParentNode()
                rotationNode.addChildNode(cubie)
            }
        }
        let action = SCNAction.rotateBy(x:  -.pi/2, y:  0, z:0, duration: UserDefaults.standard.double(forKey: "cooldown"))
        rotationNode.runAction(action) {
            
            for cubie in rotationNode.childNodes {
                       
                        let worldTransform = cubie.worldTransform
                        cubie.removeFromParentNode()
                        cubie.transform = self.convertTransform(worldTransform, from: nil)
                        self.addChildNode(cubie)
                    }
                    rotationNode.removeFromParentNode()
                }
            }
    
    
    
    
    
    
    
    func R_clockwise_model() {
        
        let rotationNode = SCNNode()
        self.addChildNode(rotationNode)

        for cubie in self.childNodes where cubie.name?.starts(with: "cubie") == true {
            if abs(cubie.position.x - 1.0) < 0.1 {
                cubie.removeFromParentNode()
                rotationNode.addChildNode(cubie)
            }
        }
        let action = SCNAction.rotateBy(x: -.pi / 2, y: 0, z: 0, duration: UserDefaults.standard.double(forKey: "cooldown"))
        rotationNode.runAction(action) {
            
            for cubie in rotationNode.childNodes {
                       
                        let worldTransform = cubie.worldTransform
                        cubie.removeFromParentNode()
                        cubie.transform = self.convertTransform(worldTransform, from: nil)
                        self.addChildNode(cubie)
                    }
                    rotationNode.removeFromParentNode()
                }
            }
    func R_notclockwise_model() {
        
        let rotationNode = SCNNode()
        self.addChildNode(rotationNode)

        for cubie in self.childNodes where cubie.name?.starts(with: "cubie") == true {
            if abs(cubie.position.x - 1.0) < 0.1 {
                cubie.removeFromParentNode()
                rotationNode.addChildNode(cubie)
            }
        }
        let action = SCNAction.rotateBy(x: .pi / 2, y: 0, z: 0, duration: UserDefaults.standard.double(forKey: "cooldown"))
        rotationNode.runAction(action) {
            
            for cubie in rotationNode.childNodes {
                       
                        let worldTransform = cubie.worldTransform
                        cubie.removeFromParentNode()
                        cubie.transform = self.convertTransform(worldTransform, from: nil)
                        self.addChildNode(cubie)
                    }
                    rotationNode.removeFromParentNode()
                }
            }
    
    
    
}
