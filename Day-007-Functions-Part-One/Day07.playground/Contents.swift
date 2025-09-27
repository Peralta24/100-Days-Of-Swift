import UIKit

//Dia 07 de 100 dias con Swift

//Crear funciones
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}
//LLamar a funcion
showWelcome()

//Crear funciones con parametros
func printTimeTables(number : Int,start: Int,end: Int) {
    for i in start...end {
        print("\(i) x \(number) = \(i * number)")
    }
}
//Llamar a la funcion con argumentos
printTimeTables(number: 10, start: -2, end: 12)

//Funcion que retorna un valor

func rollDice() -> Int {
    return Int.random(in: 1...6)
}
let result = rollDice( )
print("You rolled a \(result)")

//Ejercicio uno
func contieneMismo (palabra1:String,palabra2:String) -> Bool {
    if palabra1.sorted() == palabra2.sorted() {
        return true
    }else{
        return false
    }
}
let mismo = contieneMismo(palabra1: "abcd", palabra2: "cba")
print(mismo)

//Ejercicio dos

func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)


//Como devolver multiples valores desde funciones
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")


func juegoFavorito (nombre : String) -> (juego: String,categoria:String){
    (juego: "The Legend of Zelda: Breath of the Wild",categoria:"Aventura")
    
}
let juegoFavorito1 = juegoFavorito(nombre: "Pablo")
print("El juego favorito es \(juegoFavorito1.juego) y pertenece a la categoria de \(juegoFavorito1.categoria)")


//Como personalizar las etiquetas de los parametros

let lyric = "I see a reed door and i know that it's time to go"
print(lyric.hasPrefix("I see"))

func isUpperCase(_ string:String) -> Bool {
    string == string.uppercased()
    
}

let string = "HOLA MUNDO"
print(isUpperCase(string))

func printTimesTable(for number: Int) {
    for i in 1...12{
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTable(for: 5)

//Mini proyecto del dia 07

