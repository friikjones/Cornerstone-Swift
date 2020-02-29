//
//  UF.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/24/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

public struct UF {
    private var parent: [Int]
    private var size: [Int]
    private(set) var count: Int
    
    public init(_ n: Int) {
        self.count = n
        self.size = [Int](repeating: 1, count: n)
        self.parent = [Int](repeating: 0, count: n)
        for i in 0..<n {
            self.parent[i] = i
        }
    }
    
    public mutating func find(_ p: Int) -> Int {
        var i = p
        while i != parent[p]{
            i = parent[p]
        }
        return i
    }
    
    public mutating func connected(_ p: Int, _ q: Int) -> Bool {
        return parent[p] == parent[q]
    }
    
    public mutating func union(_ p: Int, _ q: Int) {
        let i = find(p)
        let j = find(q)
        parent[i] = j
    }
}
