import Foundation

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var vertexes = [Bool](repeating: false, count: numCourses)
    for req in prerequisites {
        if vertexes[req[0]] && vertexes[req[1]] {
            return false
        }
        vertexes[req[0]] = true
        vertexes[req[1]] = true
    }
    return true
}
