import UIKit

//Dia 09 de 100 dias con Swift!

func greetUser(){
    print("Hi there!")
}

greetUser( )

var greetCopy = greetUser
greetCopy()


let sayHello = {
    print("Hi there!")
}

sayHello()


let sayHello2  = { (name : String) -> String in
    "Hello \(name)!"
}
print(sayHello2("Sam"))


let saludarAmigo = { (a : String) -> String in
        "Hola \(a)!"
}
let contarNumero = { ( de : Int) -> Int in
        de + 1
}
var saludoAmigo = saludarAmigo
print(saludoAmigo("Sam"))
let numero = contarNumero
print(numero(10))

func getUserdata(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}


let data: (Int) -> String = getUserdata
let userD = data(1989)
print(userD)


let team = ["Gloria","Suzanne","Piper","Tiffany","Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool{
    if name1 == "Suzanne"{
        return true
    }else if name2 == "Suzanne"{
        return false
    }
    
    return name1 < name2
}

let captainFirstTeam = team.sorted(by : captainFirstSorted)
print(captainFirstTeam)

let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

let saludo = {
    print("Hola Closure!")
}

let saludoNom = { (nombreb: String) -> String in
        "Hola \(nombreb)"
}

saludoNom("Xana")

let numeros = [5,2,8,1,9,4]
numeros.sorted()
let numerosComparado = numeros.sorted(by: {(num1 : Int, num2: Int) -> Bool in
    num1 != num2
})

//Como utilizar cierres finales y sintaxix abreviada

let captainFirstTeam3 = team.sorted{ $0 > $1}

let tOnly = team.filter { $0.hasPrefix("T")}
print(tOnly)
let upperCaseTeam = team.map {$0.uppercased()}
print(upperCaseTeam)


//Ejercicios de cierres finales
let scores = [8, 4, 10, 6, 2, 9, 7, 5, 1]
let animal = ["Lion", "Tiger", "Bear", "Elephant", "Giraffe", "Zebra", "Penguin"]

let scoresSort = scores.sorted{$0 < $1}
print(scoresSort)

let animalAlfabetic = animal.sorted{$0.last! < $1.last!}
print(animalAlfabetic)

let animalLongitud = animal.sorted{$0.count < $1.count}
print(animalLongitud)

let scoresMa7 = scores.filter{$0 >= 7}
print(scoresMa7)

let scoresNumeroImpar = scores.filter{$0 % 2 != 0}
print(scoresNumeroImpar)

let name5count = animal.filter{$0.count <= 5}
print(name5count)


let scoreXTen = scores.map{$0 * 10}
print(scoreXTen)
let scoresPun = scores.map{"Tu puntuacion fue de \($0)"}
print(scoresPun)

let animalsCount = animal.map{$0.count}
print(animalsCount)

let desafioScores = scores.filter{$0 % 2 == 0}
print(desafioScores)

let desafioDuplicado = desafioScores.map {$0 * 2}
print(desafioDuplicado)

//Mas ejercicios sobre cierres finales
let productos = [
    ["name": "Laptop", "price": 1200, "stock": 5],
    ["name": "Mouse", "price": 25, "stock": 30],
    ["name": "Keyboard", "price": 75, "stock": 0],
    ["name": "Monitor", "price": 300, "stock": 10],
    ["name": "Webcam", "price": 50, "stock": 0]
]


let stockDisponible = productos.filter{ ($0["stock"] as! Int) > 0}
print(stockDisponible)

let nombreProducto = productos.map {$0["name"] as! String}
print(nombreProducto)


let sortedByPrice = productos.sorted { ($0["price"] as! Int) < ($1["price"] as! Int) }
print(sortedByPrice)


let productosBaratos = productos.filter { ($0["price"] as! Int) < 100 }
print(productosBaratos)
let productosMap = productosBaratos.map{ "\($0["name",default: ""])"}
print(productosMap)
let prouductosOrdenados = productosMap.sorted { $0 < $1 }
print(prouductosOrdenados)


//Version mas Swiftie
let affordableProductNames = productos
    .filter { ($0["price"] as! Int) < 100 }
    .map { $0["name"] as! String }
    .sorted() // .sorted() sin cierre ordena alfabéticamente por defecto
print(affordableProductNames) // Debería imprimir ["Keyboard", "Mouse", "Webcam"]


//Escribir funciones que aceptan otras funciones como parametros

func greetUser1(){
    print("Hi there!")
}
greetUser1()

var greetCopy2 : () -> Void = greetUser1
greetCopy2()


func makeArray(size : Int, using generator : () -> Int) ->[Int]{
    var number = [Int]()
    
    for _ in 0...size{
        let newNumber = generator()
        number.append(newNumber)
    }
    return number
}
func generateNumber() -> Int {
    Int.random(in: 1...2102)
}
let rolls = makeArray(size: 50){
    Int.random(in: 1...20)
}
print(rolls)

print(makeArray(size: 10, using: generateNumber))


func doImportanWork(first : () -> Void, second: () -> Void, third: () -> Void) {
    print("About to star first Work")
    first()
    print("About to start second work")
    second()
    print("About to star third work")
    third()
    print("Done!")
}

doImportanWork {
    print("This is the first work")
} second : {
    print("This is the second work")
} third: {
    print("This is the third work")
}
//Fin dia 09

//CheckPoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

luckyNumbers
    .filter{$0 % 2 != 0}
    .sorted()
    .map{"\($0) is a lucky number"}
    .forEach{print($0)}

//Ejercicos de practica de lo visto hoy


