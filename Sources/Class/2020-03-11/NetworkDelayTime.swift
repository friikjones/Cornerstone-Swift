import Foundation

class NetworkDelayTime {

    struct Edge {
        let from: Int
        let to: Int
        let cost: Int
    }

    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        var edgeArray = [Edge]()
        for edge in times{
            let tmp_edge = Edge(from: edge[0], to: edge[1], cost: edge[2])
            edgeArray.append(tmp_edge)
        }
        let outputArray = bellmanFord(edgeArray, N, K)
        var output = 0
        for e in outputArray.indices{
            if outputArray[e] > output && e != 0 {
                output = outputArray[e]
            }
        }
        if output == Int.max {
            output = -1
        }
        return output
    }

    func bellmanFord(_ edges: [Edge], _ N: Int, _ source: Int) -> [Int] {
        var dist = [Int](repeating: Int.max, count: N + 1)
        dist[source] = 0
        for _ in 0..<N-1 {
            for edge in edges {
                let from = edge.from
                let to = edge.to
                let cost = edge.cost
                if dist[to] > dist[from] + cost {
                    dist[to] = dist[from] + cost
                }
            }
        }
        return dist
    }
}