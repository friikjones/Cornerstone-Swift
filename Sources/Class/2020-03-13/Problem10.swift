func sumOfSquareNumbers(_ x:Int) -> Int {
    var counterArray = [Int]()

    func goDeeper(_ input: Int, _ counter: Int){
        if input == 0 || counter == 5 {
            counterArray.append(counter)
        }else{
            var mult = 1
            while (mult*mult <= input){
                goDeeper(input-(mult*mult),counter+1)
                mult += 1
            }
        }
    }
    goDeeper(x,0)
    var min = Int.max
    for n in counterArray{
        if n < min{
            min = n
        }
    }
    return min
}