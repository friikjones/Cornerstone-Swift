func makeOne(_ x: Int) -> Int {
    var counterArray = [Int]()
        
    func goDeeper(_ input: Int, _ counter: Int){
        if input == 1 {
            counterArray.append(counter)
        }else{
            if(input%3==0){  
                goDeeper(input/3, counter+1)
            }
            if(input%2==0){ 
                goDeeper(input/2, counter+1)
            } 
            goDeeper(input-1, counter+1)
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

