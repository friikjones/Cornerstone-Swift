import Foundation

func Town(){
    let n = Int(readLine()!)!
    var matrixCity = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var matrixChecked = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
    for i in 0..<n {
        let m = readLine()!.map { String($0)}
        for j in 0..<n{
            matrixCity[i][j] = Int(m[j])!
        }
    }

    
    
}

func printMatrix<T>(_ inputArray: [[T]]){
    print("Printing...")
    for i in 0..<inputArray.count{
        for j in 0..<inputArray.count{
            print(inputArray[i][j], terminator:"")
        }
        print()
    }
}