import Foundation

func pow (_ base:Int, _ power:Int) -> Int {
  var answer : Int = 1
  for _ in 0..<power { answer *= base }
  return answer
}

func RepeatingSequence() {
    let input = readLine()!.split(separator: " ").map { Int($0)!}
    var inputNumber = Int(input[0])
    let power = Int(input[1])
    
    var calculations = [Int]()
    calculations.append(inputNumber)

    while(true){
        //Breaking into array of digits
        var arrayInt = [Int]()
        var num = inputNumber
        arrayInt.append(num%10)
        while num >= 10 {
            num = num/10
            arrayInt.insert(num%10, at: 0)
        }
        //Adding to result
        var result = 0
        for n in arrayInt{
            result += pow(n,power)
        }
        //If found repeating element
        if calculations.contains(result){
            //Index of repeating element is equal to number of non-repeating elements before it
            print(calculations.firstIndex(of: result)!)
            //Stop the loop
            break;
        }else{ //If not found repeating element
            calculations.append(result)
            //start again from this number
            inputNumber = result
        }
    }
}