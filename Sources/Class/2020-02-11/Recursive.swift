import Foundation

func power(_ base: Int, _ exponent: Int) -> Int{
    if exponent == 0 {return 1}
    return base * power(base, exponent-1)
}

func isPalindrome(_ word: String) -> Bool {

    if word.count <= 1 {return true}

    if let first = word.first?.lowercased(), let last = word.last?.lowercased(), first == last{
        let start = word.index(word.startIndex, offsetBy: 1)
        let last = word.index(word.endIndex, offsetBy: -1)
        return isPalindrome(String(word[start..<last]))
    }
    return false
}

func printBinary(_ num:Int){
    printBinaryInternal(num)
    print()
}

func printBinaryInternal(_ num:Int) {
    if num < 2 {
        print(num, terminator: "")
        return
    }
    printBinary(num / 2)
    print(num % 2, terminator:"")
}

func printBinaryExaustive(_ n:Int, _ prefix: String = "", _ ident: String = ""){
    print("\(ident)current n:\(n) - \(prefix)")
    if n==0 {
        print(prefix)
    }else{
        for i in 0..<2 {
            printBinaryExaustive(n-1, prefix + "\(i)",ident+"  ")
        }
    }
}

func printPermutations(_ input:String, _ prefix: String = "",_ ident: String = ""){
    //print("\(ident)prefix:\(prefix),input:\(input)")
    if input.count == 0{
        print(prefix)
    } else{
        for i in 0..<input.count {
            var charArray = Array(input)
            let auxPrefix = prefix+String(charArray.remove(at:i))
            let auxString = String(charArray)
            printPermutations(auxString,auxPrefix,"  ")
        }
    }
}