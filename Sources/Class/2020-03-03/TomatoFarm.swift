import Foundation

func TomatoFarm() {

    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]

    let input = readLine()!.split(separator: " ").map { Int($0)!}
    let M = input[0] //width
    let N = input[1] //height

    var tomatoArray = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    var nextArray = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)

    for i in 0..<tomatoArray.count {
        let line = readLine()!.split(separator: " ").map { Int($0)!}
        for j in 0..<line.count{
            tomatoArray[i][j] = line[j]
            nextArray[i][j] = line[j]
        }
    }

    var done = false;
    var count = 0
    while !done{
        done = true
        for i in 0..<tomatoArray.count{
            for j in 0..<tomatoArray[i].count{
                if tomatoArray[i][j] == 1{
                    done = false
                    for k in 0..<4 {
                        let ny = i + dy[k]
                        let nx = j + dx[k]
                        // check the bounds
                        if nx >= 0 && nx < M && ny >= 0 && ny < N {
                            if tomatoArray[ny][nx] == 0 {
                                nextArray[ny][nx] = 1
                            }
                        }
                    }
                    nextArray[i][j] = 2
                }
            }
        }

        // print("Iteration \(count)")
        // print("Tomato Array")
        // printMatrix(tomatoArray)
        // print("Next Array")
        // printMatrix(nextArray)
        count += 1
        tomatoArray = nextArray
    }

    var solvable = true
    for i in 0..<tomatoArray.count{
        for j in 0..<tomatoArray[i].count{
            if tomatoArray[i][j] == 0 {
                solvable = false
            }
        }
    }
    if solvable{
        print(count-2)
    }else{
        print(-1)
    }

}

func printMatrix<T>(_ inputArray: [[T]]){
    for i in 0..<inputArray.count{
        for j in 0..<inputArray[i].count{
            print(inputArray[i][j], terminator:"")
        }
        print()
    }
}
