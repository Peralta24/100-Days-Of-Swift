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

