import Foundation

func rollDiceSum(dice: Int, sum: Int){
    var chosen = [Int]()
    rollDiceSum(dice, sum, chosen)
}

func rollDiceSum(_ dice: Int,_ sum: Int, _ chosen: [Int]){
    if dice == 0{
        // print("End of line, chosen:\(chosen)")
        if chosen.reduce(0,+) == sum {
            print(chosen)    
        }
        return
    } else {
        // print("Running, chosen:\(chosen)")
        for i in 1...6 {
            if i+dice+chosen.reduce(0,+)-1 > sum {
                continue;
            } else {
                var aux = chosen
                aux.append(i)
                rollDiceSum(dice-1, sum, aux)
            }
        }
    }
}