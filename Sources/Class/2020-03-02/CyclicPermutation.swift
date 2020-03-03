//
//  UF.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/24/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

class Node {
    
    public init(value v: Int) {
        val = v
    }
    
    public var val: Int = -1
    public var visited: Bool = false
}

func CyclicPermutations(){
    let t = Int(readLine()!)!
    //matrix of Nodes, being [test #][node values]
    var cases = [[Node]]()

    // Data Input
    // for every test #
    for _ in 0..<t{
        // size N has no real significance for this algo
        _ = Int(readLine()!)!
        // get the nodes, where nodes.count = N
        let input = readLine()!.split(separator: " ").map { Int($0)!}
        var inputNodes = [Node]()
        //append input to the data structure
        // for every node value
        for i in 0..<input.count {
            inputNodes.append(Node(value: input[i]))
        }
        cases.append(inputNodes)
    }

    // Data Output
    // for every test #
    for i in 0..<cases.count {
        var groupCount = 0
        // for every node value
        for j in 0..<cases[i].count {
            //if not visited yet
            if cases[i][j].visited == false {
                var nodeInstance = cases[i][j]
                // run through all connected nodes
                while (nodeInstance.visited == false) {
                    // mark checked as true
                    nodeInstance.visited = true
                    // go to next node (-1 because node starts at 1, not 0)
                    let nJ = nodeInstance.val - 1
                    nodeInstance = cases[i][nJ]
                }
                // add 1 to gorup count
                groupCount += 1
            }   
        }
        //prints answer for this test #
        print(groupCount)
    }
}


