import UIKit
//Funcion que crece en funcion de su tamanio de entrada
func calculateSum(number : Int) -> Int {
    var sum = 0
    for i in 1...number {
        sum += i
    }
    return sum
}
print(calculateSum(number: 5))

//Complejidad O(1) tiempo constante
func indiceUnoArreglo(arreglo : [Int]) -> Int {
    return arreglo.first ?? 0
}
print(indiceUnoArreglo(arreglo: [1,2,3,4,5]))

//Comlejidad temporal lineal O(n)
func factorialNumero(numero : Int) -> Int{
    var factorial = 1
    
    for i in 1...numero {
        factorial *= i
    }
    return factorial
}
print(factorialNumero(numero: 5))

//Complejidad temporal logaritmico O(logn)

func bynarySearch(array : [Int], key : Int) -> Int {
    var firstIndex = 0
    var lastIndex = array.count - 1
    
    while firstIndex <= lastIndex {
        let middleIndex = (firstIndex  + lastIndex) / 2
        
        if array[middleIndex] == key {
            return middleIndex
        }
        
        if array[middleIndex] > key {
            lastIndex = middleIndex - 1
        }else {
            firstIndex = middleIndex + 1
        }
    }
    return -1
}

let score = [12,22,45,67,96]
print(bynarySearch(array: score, key: 96))

//Complejidad temporal cuadratica O(n^2)
func matchElements(_ array: [String]) -> String {
    for i in 0..<array.count {
        for j in 0..<array.count {
            if i != j && array[i] == array[j] {
                return "Match found at \(i) and \(j)"
            }
        }
    }
    return "No matches found 😞"
}

let fruit = ["🍓", "🍐", "🍊", "🍌", "🍍", "🍑", "🍎", "🍈", "🍊", "🍇"]
print(matchElements(fruit)) // Match found at 2 and 8

//Complejidad temportal factorial O(n!)

func recursiveFibonacci(_ n: Int) -> Int {
    guard n > 1 else {
        return n
    }
    return recursiveFibonacci(n - 1) + recursiveFibonacci(n - 2)
}
print(recursiveFibonacci(3))


var contadorr = 0
var numeror = 10

while contadorr < numeror {
    contadorr += 1
    
}
print(contadorr)

var contador2 = 10
var numero2 = 21
repeat {
    numero2 += 1
}while numero2 < contador2
        
print(numero2)

var numero = 5

for i in 1...10{
    print("\(numero) * \(i) = \(numero * i) ")
}
