import UIKit

//Anotaciones de tipo

var numero : Int = 10
var numeroV : Int
numeroV = 20

var cadena : String = "Hola"
var cadenaV : String
cadenaV = "Mundo"

var esVerdadero : Bool = true
var esVerdaderoV : Bool
esVerdaderoV = false

var flotante : Float = 3.14
var flotanteV : Float
flotanteV = 1.59

var doble : Double = 3.14159
var dobleV : Double

var array : [Int] = [1,2,3]
var arrayV : [Int] = []
arrayV.append(1)
arrayV.append(2)
arrayV.append(3)
print(arrayV)
var diccionario : [String : Int] = ["a":1,"b":2,"c":3]
var diccionarioV = [String : Int]()
diccionarioV["a"] = 1
diccionarioV["b"] = 2
diccionarioV["c"] = 3
print(diccionarioV)

enum UIStyle {
    case light,dark,system
}

var style = UIStyle.dark

let username : String

username = "jose"
print(username)


//Checkpoint 2
let albums = ["Red", "Fearless", "Red", "Red", "Album3"]
print("La colección de albums de Taylor Swift tiene: \(albums.count) albums")

let albunesUnicos = Set(albums)

print("La colección de albums de Taylor Swift sin duplicados tiene: \(albunesUnicos.count) albums únicos.")
print("Los albums únicos son: \(albunesUnicos)")

