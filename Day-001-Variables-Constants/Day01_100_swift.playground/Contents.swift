import UIKit

// Variables
var greeting = "Hello, playground"
var name = "Rafael"
name = "Jose"
name = "Xana"

// Constant
let character = "Dolphie"

// Print values
var playerName = "Roy"
print(playerName)
playerName = "Xana"
print(playerName)
playerName = "Jose"
print(playerName)

// Otras variables
var managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"

// Funciones con Strings
let countManagerName = managerName.count
print(countManagerName)                 // Imprime la cantidad de caracteres
print(managerName.uppercased())         // Imprime en mayúsculas
print(managerName.lowercased())         // Imprime en minúsculas
print(managerName.hasPrefix("Man"))     // ¿Empieza con "Man"?
print(managerName.hasSuffix("Scott"))   // ¿Termina con "Scott"?

//Como guardar todos los numeros enteros
let score = 10
let reallyBig = 100_000_000
let lowerScore = score - 2
let higherScore = score + 2
let doubleScore = score * 2
let squaredScore = score * score
let holvedScore = score / 2
print(score)

//Asignar nuevo valor a una variable misma
var counter = 10
counter = counter + 1
counter += 5
print(counter)
counter -= 6
print(counter)
counter *= 7
print(counter)
counter /= 8
print(counter)

let height = 172
var heightMultiple = height.isMultiple(of: 100)
print(heightMultiple)


//Como almacenar numeros decimales
var numberFloat = 3.14
var numberDouble: Double = 3.14
print(numberFloat)
print(numberDouble)
var sumaEnteroDecimal = numberFloat + numberDouble
print(sumaEnteroDecimal)


//Mini Proyecto del dia 01

let playerNameM = "Jose"
let playerClass = "Mago de Fuego"

var healthPoints = 100
var scoreM = 0
var attackMultiplier: Double = 1.5

print("El jugador \(playerNameM) es de la clase \(playerClass) y tiene \(healthPoints) de salud")

print("Tesoro Encontrado!")
scoreM += 50
print("El score actual de \(playerNameM) es \(scoreM)")

print("El jugador pelea contra un dragon")
healthPoints -= 35
print("El jugador \(playerNameM) tiene ahora \(healthPoints) de salud")

print("El jugador encuentra una pocion magica y su ataque aumento")
attackMultiplier += 0.2
print("El ataque del jugador es ahora \(attackMultiplier)")

print("El jugador derrota al dragon y gana 120 puntos de score")
scoreM += 120
print("El score actual de \(playerNameM) es \(scoreM)")

let isScoreBonus = scoreM.isMultiple(of: 10)

print("El jugador \(playerNameM) es de la clase \(playerClass) y tiene \(healthPoints) de salud y su score es de \(scoreM)")
print("El jugador consiguio el bonus de puntuacion ? \(isScoreBonus)")


//Mejora del mini-proyecto del dia 01 usando 'struct'
struct Player {
    let name : String
    let platerClass : String
    var healthPoints : Int
    var score : Int
    var attackMultiplier : Double
    
}
var player2 = Player(name: "Rafael", platerClass: "Asesino", healthPoints: 100, score: 0, attackMultiplier: 1.5)
print("El nombre del jugador es \(player2.name) y pertenece a la clase \(player2.platerClass) y tiene \(player2.healthPoints) de salud y un score de \(player2.score)")

print("El jugador \(player2.name) encontro un cofre!")
player2.score += 50
print("El score actual de \(player2.name) es \(player2.score)")
print("El jugador se encontro con un enemigo legendario lo golpeo con 90 de dmg")
player2.healthPoints -= 90
print("El jugador \(player2.name) tiene ahora \(player2.healthPoints) de salud")
print("El jugador encontro una pocion y aumenta su dmg y su vida")
player2.attackMultiplier += 0.2
player2.healthPoints += 20
print("El ataque del jugador es ahora \(player2.attackMultiplier) y tiene \(player2.healthPoints) de salud")
print("El jugador \(player2.name) vencio al enemigo y gano 120 puntos de score")
player2.score += 120
print("El score actual de \(player2.score)")



//Repaso del dia 01 de 100 dias de swift

//Podemos definir varibales y constantes
var timer = 10 //Definimos una variable de nombre timer
let blocks = 5 //Definimos una constante de nombre block

//Las variables pueden mutar de valor pero no mutar de tipo
timer = 20
// timer = "Hola" esto marcara error ya que no se inicializo como tipo cadena
//Las constantes no pueden mutar de valor su valor siempre sera el mismo
// blocks = 10 esto esta mal

//Para crear cadenas,numeros enteros, numeros flotantes usamos

var cadena1 = "Hola Swift" //Creamos una cadena de texto usando ""
var numero1 = 10 //Creamos un numero entero asignando el valor inicial de un numero entero
var numero2 = 10.5 // Creamos un numero decimal asignando un valor inicial de un numero decimal

//Podemos convertir numeros enteros a decimales y decimales a enteros
print(Double(numero1))
print(Int(numero2))

//Podemos usar operadores pero siempre y cuando sean del mismo tipo los numeros
//Enteros con Enteros , Flotantes con Flotantes

var numero11 = 20
var numero22 = 5.3

print(numero1 + numero11)
print(numero2 + numero22)
print(numero1 - numero11)
print(numero2 - numero22)
print(numero1 * numero11)
print(numero2 * numero22)
print(numero1 / numero11)
print(numero2 / numero22)

//Igual podemos usar operadores unarios como += -= *= /=
numero11 += 10
numero22 -= 5.3

print(numero11)
print(numero22)

//Aprendi una forma de agrupar o crear como si fuera una clase o plantilla

struct videojuego {
    let name : String
    let year : Int
    let category : String
    let cost : Double
    
    func mostrarInfo() -> String {
        return "El nombre del videojuego es \(name), fue lanzado en \(year), pertenece a la categoria \(category) y tiene un costo de \(cost)"
    }
}

var videojuego1 = videojuego(name: "The Legend of Zelda: Breath of the Wild", year: 2017, category: "Aventura", cost: 59.99)
var videojuego2 = videojuego(name: "Hollow Knight", year: 2017, category: "Aventura", cost: 20.99)
let videojuego3 = videojuego(name: "s",year: 2012,category: "Aventura",cost: 21.21)
print(videojuego1.mostrarInfo())
print(videojuego2.mostrarInfo())
print(videojuego3.mostrarInfo())


