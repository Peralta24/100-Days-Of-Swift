import UIKit

//Dia 03 de 100 dias con Swift

// Como almacenar datos ordenados en matrices

var beatles = ["John", "Paul", "George", "Ringo"]
let number = [11, 26, 32, 41, 52]
var temperatures = [25.3, 27.8, 24.5, 26.2]

print(beatles)
print(number)
print(temperatures)

print(beatles[0])
print(number[1])
print(temperatures[2])

//Agregando nuevos valores al Array mientras sea "var"
beatles.append("Jose")
beatles.append("Maria")
beatles.append("Pablo")
beatles.append("Xana")
print(beatles)

//temperatures.append("Rafae") Error porque el array solo soporta un tipo de dato a la vez

let firstBeatle = beatles[0]
let firstNumber = number[0]
//let notAllowed = firstBeatle + firstNumber No se pueden mezclar tipos de datos

//Creando un array con constructor
var scores = Array <Int> ()
scores.append(100)
scores.append(90)
scores.append(80)
print(scores)

var albums = Array<String>()
albums.append("Sgt. Pepper")
albums.append("Abbey Road")
albums.append("Revolver")
print(albums)

//Creando un array de manera especial
var alphabet: [Character]=[]
alphabet.append("A")
alphabet.append("B")
alphabet.append("C")
print(alphabet)

//Funciones utiles con arrays
print(beatles.count)


var character = ["Lana","Pam","Ray","Sterling"]
print(character.count)

character.remove(at: 2)
print(character.count)

character.removeAll()
print(character.count)

let bondMovies = ["Casino Royale", "Live and Let Die", "GoldenEye"]
print(bondMovies.contains("Frozen"))

let cities = ["London","Tokyo","Rome","Budapest"]
print(cities.sorted())

var presidents = [String]()
presidents.append("Bush")
presidents.append("Obama")
presidents.append("Trump")
presidents.append("Biden")
presidents.append("AAAA")
let reversePresidents = presidents.reversed()
print(reversePresidents)

//Almacenar datos en un diccionario


let employe = ["name" : "Taylor Swift",
               "job" : "Singer",
               "location" : "Nashville"
]
print(employe)

//Acceder a los valores del diccionario
print(employe["name",default: "Unknow"])
print(employe["job", default: "Unknow"])
print(employe["location", default: "Unknow"])

let hasGraduated = [
    "Eric" : false,
    "Maeve" : true,
    "Otis": false
]

let olympics = [
    2012 : "London",
    2016 : "Rio de Janeiro",
    2021 : "Tokyo"
]
print(olympics[2012, default: "Unknow"])


var heights = [String : Int]()
heights["Yao Ming"] = 229
heights["LeBron James"] = 206
heights["Stephen Curry"] = 215
print(heights)

var archEnemies = [String : String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
print(archEnemies)
archEnemies["Batman"] = "Penguin"
print(archEnemies)

//Como utilizar sets
let people = Set([
    "Rafael",
    "Jose",
    "Xana"
])
print(people)

var persons = Set<String>()

persons.insert("Rafael")
persons.insert("Jose")
persons.insert("Xana")

print(persons)
print(persons.contains("Rafael"))
print(persons.count)

//Como utilizar enums

enum weekDay {
    case monday
    case tuesday
    case thursday
    case friday
    case saturday
    case sunday
}

var today = weekDay.monday
print(today)

today = .tuesday //Sobreescribir la varibale sin el weekday porque swift sabe que el weekday ya lo tiene

print(today)

//Repaso de todo lo visto en el dia 03 Fue un buen jajaj

//Como crear Array
var array = Array<Int>()
var arrayN =  [2,3,4,1,122,1]
var arrayS = Array<String>()
var arrayB = [Bool]()
arrayB.append(true)
arrayB.append(false)
print(arrayB)
//Agregar elementos a un array
array.append(1)
array.append(2)
array.append(3)
array.append(4)
array.append(5)
//Imprimir un array
print(array)
//Imprimir un elemento de un array
print(array[2])
//Imprimir la cantidad de un array
print(array.count)
//Imprimir el array ordenado
print(array.sorted())
//Imprimir si un elemento existe en el array
print(array.contains(2))
//Eliminar un dato de un array
array.remove(at: 2)
print(array)
//Elimiar todos los elementos de un array
array.removeAll()
print(array.count)
//Invertir un array
array.reversed()
print(array)


//Como crear diccionario
var diccionario = [String : Int]()
//Agregar elementos a un diccionario
diccionario["Rafael"] = 21
diccionario["Jose"] = 22
diccionario["Xana"] = 23
print(diccionario)
//Acceder a el valor de un diccionario
print(diccionario["Rafael",default:0])
//Modificar el valor de una key
diccionario["Rafael"] = 24
print(diccionario)
diccionario["Xana"] = nil
print(diccionario)
//Eliminar los elementos del diccionario
diccionario.removeAll()
print(diccionario)

//Como usar Sets
var sets = Set<Int>()
sets.insert(1)
sets.insert(2)
sets.insert(3)
print(sets)
//Agregar elemento duplicado
sets.insert(1)
print(sets)
//Imprimir longitud del set
print(sets.count)
//Verificar si contiene un elemento
print(sets.contains(1))
//Eliminar un elemento
sets.remove(1)
print(sets)
//Borrar todos los elementos del set
sets.removeAll()
print(sets)

//Como usar enums
enum Mascota {
    case perro
    case gato
    case peces
}

var mascota = Mascota.perro
print(mascota)
var mascota2 = Mascota.gato
print(mascota2)
var mascota3 = Mascota.peces
print(mascota3)
