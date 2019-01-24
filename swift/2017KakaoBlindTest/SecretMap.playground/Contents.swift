import Cocoa

let n: Int = 5
let arr1: [Int] = [9, 20, 28, 18, 11]
let arr2: [Int] = [30, 1, 21, 17, 28]

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for index in 0..<n {
        let rowBits = UInt64(arr1[index] | arr2[index])
        var targetBit = UInt64(1)
        var walls = ""
        for _ in 0..<n {
            let wall = (rowBits & targetBit) > 0 ? "#" : " "
            walls = wall + walls
            targetBit = targetBit << 1
        }
        answer.append(walls)
    }
    
    return answer
}

solution(n, arr1, arr2)
