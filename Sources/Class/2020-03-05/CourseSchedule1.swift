import Foundation

public final class Queue<E> : Sequence {
    private var first: Node<E>? = nil
    private var last: Node<E>? = nil
    private(set) var count: Int = 0
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item
            self.next = next
        }
    }
    public init() {}
    public func isEmpty() -> Bool {
        return first == nil
    }
    public func peek() -> E? {
        return first?.item
    }
    public func enqueue(item: E) {
        let oldLast = last
        last = Node<E>(item: item)
        if isEmpty() { first = last }
        else { oldLast?.next = last }
        count += 1
    }
    public func dequeue() -> E? {
        if let item = first?.item {
            first = first?.next
            count -= 1
            if isEmpty() { last = nil }
            return item
        }
        return nil
    }
    public struct QueueIterator<E> : IteratorProtocol {
        private var current: Node<E>?
        fileprivate init(_ first: Node<E>?) {
            self.current = first
        }
        public mutating func next() -> E? {
            if let item = current?.item {
                current = current?.next
                return item
            }
            return nil
        }
        public typealias Element = E
    }
    public __consuming func makeIterator() -> QueueIterator<E> {
        return QueueIterator<E>(first)
    }
}
extension Queue: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) " }
    }
}

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var output = [Int]()
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
            output.append(x)
        }
        return output
    }
}