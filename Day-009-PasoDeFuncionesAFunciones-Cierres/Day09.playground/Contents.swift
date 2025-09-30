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

//Ejercicio 1 : Ordenando Palabras

let nombres = ["Carlos","Ana","Beatriz","Daniela","Federico","Pau"]
let nombresOrdenado = nombres.sorted{$0.count < $1.count}
print(nombresOrdenado)

//Ejercicio 2 : Filtrando Numeros
let calificaciones = [5, 8, 10, 3, 7, 9, 6, 4]
let calificacionFiltradas = calificaciones.filter{$0 >= 7}
    .sorted()
print(calificacionFiltradas)

//Ejercicio 3  : Transformando Datos
let temperaturasCelsius = [0.0, 10.0, 25.5, 32.0, -5.0]
let temperaturaFarenheint = temperaturasCelsius.map{ ($0 * 9 / 5 ) + 32}
print(temperaturaFarenheint)


//Nivel 2 Intermedio (Encadenamiento y Datos Complejos)

//Ejercicio 4 : Cadena de Compras
let precios = [120.5, 88.0, 25.2, 99.9, 150.0, 45.7]

let preciosFiltrados = precios.filter{$0 < 100}
print(preciosFiltrados)
let preciosFinal = preciosFiltrados.map{$0 * 1.6}
print(preciosFinal)

//Ejercicio 5 : Biblioteca Virtual
struct Libro {
    let titulo : String
    let autor : String
    let anioPublicacion : Int
}

let biblioteca = [
    Libro(titulo: "Cien Años de Soledad", autor: "Gabriel García Márquez", anioPublicacion: 1967),
    Libro(titulo: "La Sombra del Viento", autor: "Carlos Ruiz Zafón", anioPublicacion: 2001),
    Libro(titulo: "El Código Da Vinci", autor: "Dan Brown", anioPublicacion: 2003),
    Libro(titulo: "1984", autor: "George Orwell", anioPublicacion: 1949)
]

let librosAnio2000 = biblioteca.filter{$0.anioPublicacion > 2000}
let librosmap = librosAnio2000.map{"El libo \($0.titulo) es despues del anio 200"}
print(librosmap)

//Ejercicio 6 : Reporte de Estudiantes
let estudiantes = [
    (nombre: "Luisa", calificacion: 8),
    (nombre: "Andrés", calificacion: 5),
    (nombre: "Sofía", calificacion: 10),
    (nombre: "Pedro", calificacion: 4),
    (nombre: "Ana", calificacion: 9)
]

let filtrarEstudiantes = estudiantes.filter{$0.calificacion > 5}
let estudiantesOrdenadosPorNombre = filtrarEstudiantes.sorted{$0.nombre < $1.nombre}
let estudiantesCalificacion = estudiantesOrdenadosPorNombre.map{"[\($0.nombre)] - Califacion : [\($0.calificacion)]"}
print(estudiantesCalificacion.forEach{print($0)})

//Nivel 3 : Avanzado (Creando tus Propias Funciones)

func operar (num1 : Int, num2 :Int, usando operacion : (Int, Int) ->Int) -> Int {
    return operacion (num1,num2)
}
let suma = operar(num1: 5, num2: 10) {$0 + $1}
print("Suma: \(suma)")
let resta = operar(num1: 10, num2: 3) {$0 - $1}
print("Resta: \(resta)")
let multiplicacion = operar(num1: 20, num2:10){$0 * $1}
print("Multiplicacion: \(multiplicacion)")

//Ejercicio 8 : (Reto) Mi propio filter
func miFiltro<T>(en arreglo : [T], con condicion : (T) -> Bool) -> [T] {
    var nuevoArreglo = Array<T>()
    for element in arreglo{
        if condicion(element)  {
            nuevoArreglo.append(element)
        }
    }
    return nuevoArreglo
}
let calificaciones8 = [5, 8, 10, 3, 7, 9, 6, 4]
let aprobatoriasConMiFiltro = miFiltro(en: calificaciones) {calificacion in calificacion >= 7}
print(aprobatoriasConMiFiltro)

