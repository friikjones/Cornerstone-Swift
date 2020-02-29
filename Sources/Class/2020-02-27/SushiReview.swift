import Foundation

func SushiReview(){

    let n_m = readLine()!.split(separator: " ").map { String($0)}
    let restaurantList = readLine()!.split(separator: " ").map { Int($0)!}

    var g = Graph(V: Int(n_m[0])!)!
    var validEdges: [Int] = [Int]()

    for _ in 0..<(Int(n_m[0]) ?? 0) - 1{
        let nodeInfo = readLine()!.split(separator: " ").map { String($0)}
        let item1 = Int(nodeInfo[0])!
        let item2 = Int(nodeInfo[1])!
        
        g.addEdge(from: item1, to: item2)
    }

    var dfs1 = DFS(G: g, s: 0)
    var longest: Int = 0
    var from: Int = -1
    var to: Int = -1
    for i in 0..<(Int(n_m[0]) ?? 0) - 1{
        let dist: Int = dfs1.path(to: i)!.count
        if (dist > longest && restaurantList.contains(i)) {
            longest = dist
            from = i
        }
    }

    var dfs2 = DFS(G: g, s: from)
    longest = 0
    for i in 0..<(Int(n_m[0]) ?? 0) - 1{
        let dist: Int = dfs2.path(to: i)!.count
        if (dist > longest && restaurantList.contains(i)) {
            longest = dist
            to = i
        }
    }


    let dfs = DFS(G: g, s: from)
    for i in dfs.path(to: to)! {
        validEdges.append(i)
    }

    let finalEdges = Set(validEdges).union(restaurantList)
    print("\nResult: \((finalEdges.count - 1) * 2 - (validEdges.count - 1))")
}