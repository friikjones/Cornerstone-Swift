class treeNode {
    var data: Int?
    var child: Array<treeNode> = Array()
    var parent: Int?
}

//global tree
var tree = [treeNode](repeating: treeNode(),count: 10000)

func LCAInput ()
{
    //reading N nodes
    let n = Int(readLine()!)!
    
    // reading all node info
    for _ in 0..<n-1{
        let nodeInfo = readLine()!.split(separator: " ").map { String($0)}
        let item1 = Int(nodeInfo[0])!
        let item2 = Int(nodeInfo[1])!

        // if first item exists, make first parent of second
        if(tree[item1].data != nil){
            let temp = treeNode()
            temp.data = item2
            temp.parent = item1
            tree[item1].child.append(temp)
            tree[item2] = temp
        //if second item exists, make second parent of first
        }else if (tree[item2].data != nil){
            let temp = treeNode()
            temp.data = item1
            temp.parent = item2
            tree[item2].child.append(temp)
            tree[item1] = temp
        //if none exists (first item), make first parent of second
        }else{
            let temp1 = treeNode()
            temp1.data = item1
            let temp2 = treeNode()
            temp2.data = item2
            temp2.parent = item1
            temp1.child.append(temp2)
            tree[item1] = temp1
            tree[item2] = temp2
        }
    }
}

func LCAOutput(){
    //reading N targets
    let n = Int(readLine()!)!
    var output = [Int]()

    for _ in 0..<n{
        let nodeInfo = readLine()!.split(separator: " ").map { String($0)}
        var item1 = Int(nodeInfo[0])!
        var item2 = Int(nodeInfo[1])!

        //checkign depths
        var depth1 = 0
        var depth2 = 0
        while item1 != 1 {
            item1 = tree[item1].parent!
            depth1 += 1
        }
        while item2 != 1 {
            item2 = tree[item2].parent!
            depth2 += 1
        }

        //reseting items
        item1 = Int(nodeInfo[0])!
        item2 = Int(nodeInfo[1])!
        while depth1 != depth2 {
            if depth1 > depth2{
                item1 = tree[item1].parent!
                depth1 -= 1
            }else{
                item2 = tree[item2].parent!
                depth2 -= 1
            }
        }
        
        //backtrack until LCA found
        while item1 != item2{
            item1 = tree[item1].parent!
            item2 = tree[item2].parent!
        }
        output.append(item1)
    }
    for i in 0..<output.count{
        print(output[i])
    }
}

func PrintTree()
{
    // Print Tree node-by-node
    for child in tree{
        if child.data != nil {
            print("node: \(child.data!)")
            if child.parent != nil {
                print("  parent: \(child.parent!)")
            }
            for subchild in child.child{
                print("  child: \(subchild.data!)")
            }
        } 
    }
}