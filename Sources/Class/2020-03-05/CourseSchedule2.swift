import Foundation

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var output = [Int]()
    var count = 0
    var adj = [[Int]](repeating: [Int](), count: numCourses)
    var indegree = [Int](repeating: 0, count: numCourses)
    for req in prerequisites{
        adj[req[1]].append(req[0])
        indegree[req[0]] += 1
    }
    let q = Queue<Int>()
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
        count += 1
        output.append(x)
    }
    if count != numCourses {
        output = []
    }
    return output
}