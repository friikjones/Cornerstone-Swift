func pokemon() {
    let input = readLine()!.split(separator: " ").map { Int($0)!}
    let N = input[0]
    let M = input[1]
    var grid = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)

    for i in 0..<N{
        let line = readLine()!.split(separator: " ").map { Int($0)!}
        for j in 0..<M{
            grid[i][j] = line[j]
        }
    }

    var output = [Int]()
    func goDeeper(_ x:Int, _ y:Int, _ counter:Int){
        if x < M-1 {
            goDeeper(x+1,y,counter+grid[y][x])
        }
        if y < N-1 {
            goDeeper(x,y+1,counter+grid[y][x])
        }
        if x == M-1 && y == N-1 {
            output.append(counter+grid[y][x]) 
        }
    }
    goDeeper(0,0,0)

    var max = 0
    for n in output{
        if n > max{
            max = n
        }
    }
    print(max)
    
}