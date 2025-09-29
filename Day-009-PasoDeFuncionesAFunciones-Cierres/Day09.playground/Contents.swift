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
