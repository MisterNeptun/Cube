import Foundation

struct RubiksCube: Equatable{
    var front: [[Int]]
    var back: [[Int]]
    var top: [[Int]]
    var bottom: [[Int]]
    var left: [[Int]]
    var right: [[Int]]
    
}

func init_face(_ color: Int) -> [[Int]] {
    Array(repeating: Array(repeating: color, count: 3), count: 3)
}


func init_cube() -> RubiksCube{
    
    return  RubiksCube(
        front:  init_face(0),
        back:  init_face(3),
        top:    init_face(2),
        bottom: init_face(1),
        left:   init_face(4),
        right:  init_face(5)
    )
}

func shuffle(cube:   RubiksCube)->RubiksCube{
    let shuffle_list: [(RubiksCube ) -> RubiksCube] = [L_clockwise,L_notclockwise,F_clockwise,F_notclockwise,R_clockwise,R_notclockwise,B_clockwise,B_notclockwise,D_clockwise,D_notclockwise,U_clockwise,U_notclockwise]
    let original = init_cube()
    var result = cube
    for _ in 0..<20{
        if let move = shuffle_list.randomElement() {
            result = move(result)
            print(result)
        }
    }
    if result != original{
        return result
    }
    else{
       return  shuffle(cube: result)
    }
         
}






func rot_clockwise(_ face: [[Int]])->[[Int]]{
    let original = face
    var result = face
    result[0][0] = original[2][0]
    result[2][0] = original[2][2]
    result[0][2] = original[0][0]
    result[2][2] = original[0][2]
    
    result[1][0] = original[2][1]
    result[0][1] = original[1][0]
    result[2][1] = original[1][2]
    result[1][2] = original[0][1]
    
    return result
}

func rot_notclockwise(_ face: [[Int]])->[[Int]]{
    let original = face
    var result = face
    result[2][2] = original[2][0]
    result[0][2] = original[2][2]
    result[2][0] = original[0][0]
    result[0][0] = original[0][2]
    
    result[1][2] = original[2][1]
    result[2][1] = original[1][0]
    result[0][1] = original[1][2]
    result[1][0] = original[0][1]
    
    return result
}







func D_clockwise(_ cube: RubiksCube)->RubiksCube{
    let original = cube
    var result = cube
    result.bottom = rot_clockwise(result.bottom)
    result.front [2] = original.left[2]
    result.back [2] = original.right[2]
    result.left [2] = original.back[2]
    result.right [2] = original.front[2]
    return result
}

func D_notclockwise(_ cube: RubiksCube)->RubiksCube{
    let original = cube
    var result = cube
    result.bottom = rot_notclockwise(result.bottom)
    result.back [2] = original.left[2]
    result.front [2] = original.right[2]
    result.right [2] = original.back[2]
    result.left [2] = original.front[2]
    return result
}

func U_notclockwise(_ cube: RubiksCube)->RubiksCube{
    let original = cube
    var result = cube
    result.top = rot_notclockwise(result.top)
    result.front [0] = original.left[0]
    result.back [0] = original.right[0]
    result.left [0] = original.back[0]
    result.right [0] = original.front[0]
    return result
}

func U_clockwise(_ cube: RubiksCube)->RubiksCube{
    let original = cube
    var result = cube
    result.top = rot_clockwise(result.top)
    result.back [0] = original.left[0]
    result.front [0] = original.right[0]
    result.right [0] = original.back[0]
    result.left [0] = original.front[0]
    return result
    }



func F_clockwise(_ cube: RubiksCube)->RubiksCube{
    let original = cube
    var result = cube
    result.front = rot_clockwise(result.front)
    
    result.top [2][2] = original.left[0][2]
    result.top [2][1] = original.left[1][2]
    result.top [2][0] = original.left[2][2]
    
    result.right [0][0] = original.top[2][0]
    result.right [1][0] = original.top[2][1]
    result.right [2][0] = original.top[2][2]
    
    result.bottom [0][2] = original.right[0][0]
    result.bottom [0][1] = original.right[1][0]
    result.bottom [0][0] = original.right[2][0]
    
    result.left [0][2] = original.bottom[0][0]
    result.left [1][2] = original.bottom[0][1]
    result.left [2][2] = original.bottom[0][2]
    return result
}

func F_notclockwise(_ cube: RubiksCube)->RubiksCube{
    let original = cube
    var result = cube
    result.front = rot_notclockwise(result.front)
    
    result.top [2][0] = original.right[0][0]
    result.top [2][1] = original.right[1][0]
    result.top [2][2] = original.right[2][0]
    
    result.right [2][0] = original.bottom[0][0]
    result.right [1][0] = original.bottom[0][1]
    result.right [0][0] = original.bottom[0][2]
    
    result.bottom [0][0] = original.left[0][2]
    result.bottom [0][1] = original.left[1][2]
    result.bottom [0][2] = original.left[2][2]
    
    result.left [0][2] = original.top[2][2]
    result.left [1][2] = original.top[2][1]
    result.left [2][2] = original.top[2][0]
    return result
}

func B_clockwise(_ cube: RubiksCube)->RubiksCube{
    let original = cube
    var result = cube
    result.back = rot_clockwise(result.back)
    
    result.top [0][0] = original.right[0][2]
    result.top [0][1] = original.right[1][2]
    result.top [0][2] = original.right[2][2]
    
    result.right [2][2] = original.bottom[2][0]
    result.right [1][2] = original.bottom[2][1]
    result.right [0][2] = original.bottom[2][2]
    
    result.bottom [2][0] = original.left[0][0]
    result.bottom [2][1] = original.left[1][0]
    result.bottom [2][2] = original.left[2][0]
    
    result.left [0][0] = original.top[0][2]
    result.left [1][0] = original.top[0][1]
    result.left [2][0] = original.top[0][0]
    return result
   
}

func B_notclockwise(_ cube: RubiksCube)->RubiksCube{
    let original = cube
    var result = cube
    result.back = rot_notclockwise(result.back)
    
    result.top [0][2] = original.left[0][0]
    result.top [0][1] = original.left[1][0]
    result.top [0][0] = original.left[2][0]
    
    result.right [0][2] = original.top[0][0]
    result.right [1][2] = original.top[0][1]
    result.right [2][2] = original.top[0][2]
    
    result.bottom [2][2] = original.right[0][2]
    result.bottom [2][1] = original.right[1][2]
    result.bottom [2][0] = original.right[2][2]
    
    result.left [2][0] = original.bottom[2][2]
    result.left [1][0] = original.bottom[2][1]
    result.left [0][0] = original.bottom[2][0]
    return result
   
}

func L_clockwise(_ cube: RubiksCube)->RubiksCube{
    let original = cube
    var result = cube
    result.left = rot_clockwise(result.left)
    
    result.top [2][0] = original.back[0][2]
    result.top [1][0] = original.back[1][2]
    result.top [0][0] = original.back[2][2]
    
    result.back [0][2] = original.bottom[2][0]
    result.back [1][2] = original.bottom[1][0]
    result.back [2][2] = original.bottom[0][0]
    
    result.bottom [0][0] = original.front[0][0]
    result.bottom [1][0] = original.front[1][0]
    result.bottom [2][0] = original.front[2][0]
    
    result.front [0][0] = original.top[0][0]
    result.front [1][0] = original.top[1][0]
    result.front [2][0] = original.top[2][0]
    return result
    
}

func L_notclockwise(_ cube: RubiksCube)->RubiksCube{
    let original = cube
    var result = cube
    result.left = rot_notclockwise(result.left)
    
    result.top [0][0] = original.front[0][0]
    result.top [1][0] = original.front[1][0]
    result.top [2][0] = original.front[2][0]
    
    result.back [0][2] = original.top[2][0]
    result.back [1][2] = original.top[1][0]
    result.back [2][2] = original.top[0][0]
    
    result.bottom [2][0] = original.back[0][2]
    result.bottom [1][0] = original.back[1][2]
    result.bottom [0][0] = original.back[2][2]
    
    result.front [0][0] = original.bottom[0][0]
    result.front [1][0] = original.bottom[1][0]
    result.front [2][0] = original.bottom[2][0]
    return result
    
}

func R_notclockwise(_ cube: RubiksCube)->RubiksCube{
    let original = cube
    var result = cube
    result.right = rot_notclockwise(result.right)
    
    result.top [2][2] = original.back[0][0]
    result.top [1][2] = original.back[1][0]
    result.top [0][2] = original.back[2][0]
    
    result.back [0][0] = original.bottom[2][2]
    result.back [1][0] = original.bottom[1][2]
    result.back [2][0] = original.bottom[0][2]
    
    result.bottom [0][2] = original.front[0][2]
    result.bottom [1][2] = original.front[1][2]
    result.bottom [2][2] = original.front[2][2]
    
    result.front [0][2] = original.top[0][2]
    result.front [1][2] = original.top[1][2]
    result.front [2][2] = original.top[2][2]
    return result
    
}

func R_clockwise(_ cube: RubiksCube)->RubiksCube{
    let original = cube
    var result = cube
    result.right = rot_clockwise(result.right)
    
    result.top [0][2] = original.front[0][2]
    result.top [1][2] = original.front[1][2]
    result.top [2][2] = original.front[2][2]
    
    result.back [0][0] = original.top[2][2]
    result.back [1][0] = original.top[1][2]
    result.back [2][0] = original.top[0][2]
    
    result.bottom [0][2] = original.back[0][0]
    result.bottom [1][2] = original.back[1][0]
    result.bottom [2][2] = original.back[2][0]
    
    result.front [0][2] = original.bottom[0][2]
    result.front [1][2] = original.bottom[1][2]
    result.front [2][2] = original.bottom[2][2]
    return result
}

