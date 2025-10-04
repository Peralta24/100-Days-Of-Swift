import UIKit

//Dia 14 de 100 dias con Swift
//Opcionales

let opposites = [
    "Mario":"Luigi",
    "Luigi" :"Waluigi"
]
let peachOpposite = opposites["Peach"]


if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}


var username : String? = nil
username = "Jose"

if let unwrappedUsername = username {
    print("Hello \(unwrappedUsername)")
} else {
    print("Hello, world!")
}

func square(number: Int) -> Int {
    number * number
}

var number : Int? = nil
number = 5
if let number = number {
    print(square(number: number))
}else{
    print("NO HAY UN NUMERO")
}

func getUsername() -> String? {
    nil
}

if let username = getUsername() {
    print("Username is \(username)")
}else{
    print("No user name")
}
var bestScore: Int? = nil
bestScore = 101

if let bestScore {
    if bestScore > 100 {
        print("You got a high score!")
    } else {
        print("Better luck next time.")
    }
}

//Ejerciicos primera leccion opcionales


func dobleDelNumero(de texto : String){
    if let numero = Int(texto) {
        print(numero * 2)
    }else{
        print("Entrada invalida")
    }
}

dobleDelNumero(de: "10")
dobleDelNumero(de: "Swift")
dobleDelNumero(de: "-5")

let capitales = [
    "México": "Ciudad de México",
    "Francia": "París",
    "Japón": "Tokio"
]
func imprimirCapital(de pais : String) {
    if let capital = capitales[pais] {
        print(capital)
    }else{
        print("No se encontro el capital")
    }
}

imprimirCapital(de: "Francia")
imprimirCapital(de: "Italia")

struct Persona {
    let nombre : String
    let segundoNombre : String?
}

var rafael = Persona(nombre: "Rafael", segundoNombre: "Peralta")
var xana = Persona(nombre: "Xana", segundoNombre: nil)

func saludoCompleto(a persona : Persona) {
    
    if let nombreCompleto = persona.segundoNombre {
        print("Tu nombre es : \(persona.nombre) \(nombreCompleto)")
    }else{
        print("Hola \(persona.nombre)")
    }
    
}
saludoCompleto(a: rafael)
saludoCompleto(a: xana)

//Desenvolver con guard

func printSquare(of number: Int?) {
    guard let number = number else{
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number*number)")
}

func getMeaningOfLife() -> Int? {
    42
}
func printMeaningOfLife() {
    if let name = getMeaningOfLife() {
        print(name)
    }
}

func printMeaningOfLifeG() {
    guard let name = getMeaningOfLife() else {
        return
    }

    print(name)
}

//Ejercicios guard

