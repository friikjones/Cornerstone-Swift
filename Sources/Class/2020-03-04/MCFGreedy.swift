import Foundation

class Edge {
    
    public var cost = -1
    public var node = [Int](repeating: 0, count: 2)
    public var active = false;
}

func MinimumCostFlow () {
    let input = readLine()!.split(separator: " ").map { Int($0)!}
    let N = input[0] // number of vertexes
    let M = input[1] // number of edges
    let _ = input[2] // cost

    var edgeArray = [Edge]()
    
    var vertex = [Int](repeating: 0, count: N)
    var count = 0
    
    for i in 0..<M{
        //readline
        let linesInput = readLine()!.split(separator: " ").map { Int($0)!}
        let line0 = linesInput[0]
        let line1 = linesInput[1]
        let line2 = linesInput[2]
        let edgeTemp = Edge()
        edgeTemp.node[0] = line0
        edgeTemp.node[1] = line1
        edgeTemp.cost = line2
        edgeArray.append(edgeTemp)
        
        if count < N-1 {
            edgeArray[i].active = true;
        }
        count += 1
    }

    var targetArray = [Int]()
    for edge in edgeArray{
        targetArray.append(edge.cost)
    }
    targetArray.sort()
    
    var optimalArray = [Bool](repeating: false, count: M)
    var iterator = 0
    var activated = 0
    while activated < N-1{
        for i in 0..<M{
            if edgeArray[i].cost == targetArray[iterator] && activated < N-1{
                if vertex[edgeArray[i].node[0]-1] < 2 || vertex[edgeArray[i].node[1]-1] < 2{
                    optimalArray[i] = true;
                    vertex[edgeArray[i].node[0]-1] += 1
                    vertex[edgeArray[i].node[1]-1] += 1
                    activated += 1
                    iterator += 1
                }
            }
        }
    }

    var changes = 0   
    for i in 0..<N-1{
        if optimalArray[i] == false{
            changes += 1
        }
    }
    print(changes)

}