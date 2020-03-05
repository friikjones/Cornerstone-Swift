import Foundation

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var output = [Int]()

    var adj = [[Int]]()
    var indegree = [Int]()

    for req in prerequisites{
        adj[req[0]].append(req[1])
        indegree[req[1]] += 1
    }

    //topological sort
    let q = Queue<Int>()
    // initial state
    for v in 0..<numCourses{
        if indegree[v]==0{
            q.enqueue(item: v)
        }
    }

    while !q.isEmpty() {
        let x = q.dequeue()!
        for v in adj[x] {
            indegree[v] -= 1
            if indegree[v] == 0{
                q.enqueue(item: v)
            }
        }
        output.append(x)
    }
    return output
}
