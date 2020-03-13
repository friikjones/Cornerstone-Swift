import Foundation

func nonDecreasing(_ N: Int) -> Int{
    var output = 0
    var calc = 1
    for _ in 0..<N{
        calc = calc*10
    }

    let target = calc

    for i in 0..<target{
        //breaking into array
        var arrayInt = [Int]()
        var num = i
        var check = true
        arrayInt.append(num%10)
        while num >= 10 {
            num = num/10
            arrayInt.insert(num%10, at: 0)
        }
        for c in arrayInt.indices{
            if c < arrayInt.count-1{
                if arrayInt[c] > arrayInt[c+1]{
                    check = false
                    break;
                }
            }
        }
        if check {
            output += 1
        }

    }


    return output
}