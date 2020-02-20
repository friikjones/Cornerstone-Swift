import Foundation

// class TreeNode<T> {
//     var data: T?
//     var leftChild: TreeNode<T>?
//     var rightChild: TreeNode<T>?
// }

var bin = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 50)

func preOrderBin(_ node: Int){
    if node == -1 { return }
    //print itself
    print(Character(UnicodeScalar(node - 65)!), terminator: "")
    // preOrderBin(left)
    for i in 0..<bin[node].count{
        preOrderBin(bin[node][i])
    }
}

// func inOrderBin(_ node: Int){
//     if node == -1 { return }
//     // inOrderBin(left)
//     inOrderBin(tree[node][0])
//     // print itself
//     print(Character(UnicodeScalar(node - 65)!), terminator: "")
//     // inOrderBin(right)
//     inOrderBin(tree[node][1])
// }

func postOrderBin(_ node: Int){
    if node == -1 { return }
    // preOrderBin(left)
    for i in 0..<bin[node].count{
        postOrderBin(bin[node][i])
    }
    //print itself
    print(Character(UnicodeScalar(node - 65)!), terminator: "")
}

// func binaryTraversal(_ inputArray: [String]) {

//     let x = Int(inputArray[0])



    

//     print("Pre Order:")
//     preOrderBin(1)
//     // print("In Order:")
//     // inOrderBin(0)
//     print("Post Order:")
//     postOrderBin(1)
// }