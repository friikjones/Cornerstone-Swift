func Merge(_ left:[Int],_ right:[Int],_ pivot:Int) -> [Int]{
    print("DEBUG - Merging \(left), \(right) and \(pivot)")
    var aux = [Int]()
    aux += left
    aux += [pivot]
    aux += right
    return aux
}

func QuickSort(_ inputArray: [Int],_ ident: String="") -> [Int]{
    print("DEBUG - \(ident)Running Quick sort with \(inputArray)")
    if inputArray.count < 2{
        return inputArray
        print("DEBUG - \(ident)returning \(inputArray)")
    }else{
        let pivot = inputArray.first
        var leftArray = [Int]()
        var rightArray = [Int]()
        for i in 1..<inputArray.count{
            if(inputArray[i] <= pivot!){
                leftArray.append(inputArray[i])
            }else{
                rightArray.append(inputArray[i])
            }
        }
        print("DEBUG - \(ident)leftArray: \(leftArray)")
        print("DEBUG - \(ident)rightArray: \(rightArray)")
        return Merge(QuickSort(leftArray,"  "),QuickSort(rightArray,"  "),pivot!)
    }
}