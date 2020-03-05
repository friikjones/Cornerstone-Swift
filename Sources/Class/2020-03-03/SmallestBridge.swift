import Foundation

func smallestBridge() {
    struct Square {
        let x: Int
        let y: Int
    }
    
    class newSquare {
        let x: Int
        let y: Int
        public var g: Int
        init(nx: Int, ny: Int, generarion: Int) {
            x = nx
            y = ny
            g = generarion
        }
    }
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    let input = readLine()!.split(separator: " ").map { Int($0)!}
    let N = input[0]
    var islandArray = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
    var group = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
    
    for i in 0..<N {
        let line = readLine()!.split(separator: " ").map { Int($0)!}
        for j in 0..<N {
            islandArray[i][j] = line[j]
        }
    }
    
    
    func bfs(x: Int, y: Int, id: Int, n: Int) {
        let q = Queue<Square>()
        q.enqueue(item: Square(x: x, y: y))
        group[x][y] = id
        while !q.isEmpty() {
            let square = q.dequeue()!
            let x = square.x
            let y = square.y
            // check 4 directions
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                // check the bounds
                if nx >= 0 && nx < n && ny >= 0 && ny < n {
                    // check if there's a house and not yet marked in group
                    if islandArray[nx][ny] == 1 && group[nx][ny] == 0 {
                        q.enqueue(item: Square(x: nx, y: ny))
                        group[nx][ny] = id
                    }
                }
            }
        }
    }
    
    func shortestPathBFS(x: Int, y: Int, groupId: Int, n: Int) -> Int {
        let q = Queue<newSquare>()
        q.enqueue(item: newSquare(nx: x, ny: y, generarion: 0))
        var navMash = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        navMash = group
        
        var bridgeSize: Int = 0
        while !q.isEmpty() {
            let square = q.dequeue()!
            let x = square.x
            let y = square.y
            
            // check 4 directions
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                // check the bounds
                if nx >= 0 && nx < n && ny >= 0 && ny < n {
                    // check if there's a house and not yet marked in group
                    
                    if navMash[nx][ny] == 0 {
                        navMash[nx][ny] = -1
                        q.enqueue(item: newSquare(nx: nx, ny: ny, generarion: square.g+1))
                        bridgeSize += 1
                    }
                    if navMash[nx][ny] != 0  && navMash[nx][ny] != groupId && navMash[nx][ny] != -1 {
                        return square.g
                    }
                }
            }
        }
        
        return Int.max
    }
    
    var id = 0
    for x in 0..<N {
        for y in 0..<N {
            if islandArray[x][y] == 1 && group[x][y] == 0 {
                id += 1
                bfs(x: x, y: y, id: id, n: N)
            }
        }
    }
    
    var smalestBridge: Int = N + 2
    for x in 0..<N {
        for y in 0..<N {
            if group[x][y] != 0 {
                let res: Int = shortestPathBFS(x: x, y: y, groupId: group[x][y], n: N)
                if (res < smalestBridge) {
                    smalestBridge = res
                }
            }
        }
    }
    
    print(smalestBridge)
}