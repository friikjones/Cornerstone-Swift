import Foundation

// class TreeNode<T> {
//     var data: T?
//     var leftChild: TreeNode<T>?
//     var rightChild: TreeNode<T>?
// }

var tree = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 27)

func preOrderTree(_ node: Int){
    if node == -1 { return }
    //print itself
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
    // preOrderTree(left)
    preOrderTree(tree[node][0])
    // preOrderTree(right)
    preOrderTree(tree[node][1])    
}

func inOrderTree(_ node: Int){
    if node == -1 { return }
    // inOrderTree(left)
    inOrderTree(tree[node][0])
    // print itself
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
    // inOrderTree(right)
    inOrderTree(tree[node][1])
}

func postOrderTree(_ node: Int){
    if node == -1 { return }
    // postOrderTree(left)
    postOrderTree(tree[node][0])
    // postOrderTree(right)
    postOrderTree(tree[node][1])
    // print itself
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
}

func treeTraversal() {
    let n = Int(readLine()!)!
    for _ in 0..<n{
        let nodeInfo = readLine()!.split(separator: " ").map { String($0)}
        //A, ... ,Z
        let x = Int(Character(nodeInfo[0]).asciiValue! - 65)
        let l = Int(Character(nodeInfo[1]).asciiValue!)
        let r = Int(Character(nodeInfo[2]).asciiValue!)
        // ascii 46 -> . -> -1
        tree[x][0] = l == 46 ? -1 : l - 65
        tree[x][1] = r == 46 ? -1 : r - 65
    }
    print("Pre Order:")
    preOrderTree(0)
    print()
    print("In Order:")
    inOrderTree(0)
    print()
    print("Post Order:")
    postOrderTree(0)
    print()
}