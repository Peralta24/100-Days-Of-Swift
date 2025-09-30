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


//Ejercicios fase dos dia 09

//Ejercicio 1.1 : fase dos

struct Cancion {
    let titulo : String
    let artista : String
    let duracion : Int
}


let bibliotecaMusical = [
    Cancion(titulo: "Bohemian Rhapsody", artista: "Queen", duracion: 355),
    Cancion(titulo: "Don't Stop Me Now", artista: "Queen", duracion: 209),
    Cancion(titulo: "Stairway to Heaven", artista: "Led Zeppelin", duracion: 482),
    Cancion(titulo: "Another One Bites the Dust", artista: "Queen", duracion: 215),
    Cancion(titulo: "Hotel California", artista: "Eagles", duracion: 391)
]

// Tu misión:
// 1. **Filtrar** (`filter`): Obtén un arreglo con solo las canciones de "Queen".
var cancionesQueen = bibliotecaMusical.filter{$0.artista == "Queen"}
// 2. **Ordenar** (`sorted`): Ordena ese arreglo de la canción con mayor duración a la de menor duración.
var cancionesOrdenadas = cancionesQueen.sorted{$0.duracion > $1.duracion}
// 3. **Mapear** (`map`): Convierte el resultado final en un arreglo de Strings con el formato: "Título - Artista (Duración: X segundos)".
var resultadCanciones = cancionesOrdenadas.map{"\($0.titulo) - \($0.artista) (Duración: \($0.duracion) segundos)"}

print(resultadCanciones)


//Ejercicio 1.2 Fase Dos

enum Categoria {
    case electronica, ropa, hogar, libros
}

struct Producto {
    let nombre: String
    let precio : Double
    let categoria : Categoria
}

let catalogo = [
    Producto(nombre: "Laptop Pro", precio: 1200.0, categoria: .electronica),
    Producto(nombre: "Audífonos Inalámbricos", precio: 150.0, categoria: .electronica),
    Producto(nombre: "Camiseta de Algodón", precio: 25.0, categoria: .ropa),
    Producto(nombre: "Monitor 4K", precio: 350.0, categoria: .electronica),
    Producto(nombre: "Sartén Antiadherente", precio: 45.0, categoria: .hogar)
]

// Tu misión:
// 1. **Filtrar** (`filter`): Quédate solo con los productos que cumplan DOS condiciones: ser de la categoría `.electronica` Y tener un precio menor a 400.0.

let ofertasElectronica  = catalogo
    .filter{$0.categoria == .electronica && $0.precio < 400}
// 2. **Ordenar** (`sorted`): Ordena los productos filtrados por su nombre, de la A a la Z.
    .sorted{($0.nombre) < ($1.nombre)}
// 3. **Mapear** (`map`): Extrae únicamente el nombre de cada producto para tener un arreglo de `[String]`.
    .map{($0.nombre)}
// let ofertasElectronica = catalogo.filter { ... }.sorted { ... }.map { ... }
// print(ofertasElectronica)
print(ofertasElectronica)


//.Ejercicio 1.3 Fase Tres
struct Estudiante {
    let nombre : String
    let calificaciones : [Double]
    
    var promedio : Double {
        return calificaciones.reduce(0, +) / Double(calificaciones.count)
    }
}


let listaClase = [
    Estudiante(nombre: "Mariana", calificaciones: [8.0, 9.0, 10.0]), // Promedio 9.0
    Estudiante(nombre: "Fernando", calificaciones: [5.0, 6.0, 7.0]), // Promedio 6.0
    Estudiante(nombre: "Valeria", calificaciones: [7.0, 7.5, 8.0]), // Promedio 7.5
    Estudiante(nombre: "David", calificaciones: [10.0, 9.5, 9.0]) // Promedio 9.5
]

// Tu misión:
// 1. **Filtrar** (`filter`): Conserva solo a los estudiantes cuyo promedio de calificaciones sea 7.0 o mayor.
let cuadroDeHonor = listaClase.filter{$0.promedio >= 7.0}
// 2. **Ordenar** (`sorted`): Ordena a los estudiantes aprobados por su promedio, de mayor a menor.
    .sorted{$0.promedio > $1.promedio}
// 3. **Mapear** (`map`): Crea un arreglo de strings con el formato: "Nombre (Promedio: X.X)".
    .map{"\($0.nombre)  (Promedio :\($0.promedio))"}
// let cuadroDeHonor = listaClase.filter { ... }.sorted { ... }.map { ... }
    .forEach{print ($0)}
// print(cuadroDeHonor)
print(cuadroDeHonor)


//Funciones como parametros

func repetir(veces: Int, accion: () -> Void) {

    for _ in 1...veces{
        accion()
    }
}

repetir(veces:3){
    print("Hola Swift")
}

repetir(veces:5) {
    print("Numero aleatorio: \(Int.random(in: 1...100))")
}


func procesarArreglo<T, U>(arreglo2: [T], operacion: (T) -> U) -> [U] {
    var arrayVacio = Array<U>()
    
    for elemento in arreglo2 {
        var nuevoValor = operacion(elemento)
        arrayVacio.append(nuevoValor)
    }
    return arrayVacio
}

let numerosp = [1, 2, 3, 4, 5]
let numerosComoStrings = procesarArreglo(arreglo2: numerosp) { numero in
    return "Número: \(numero)"
}
print(numerosComoStrings)


let palabras = ["Hola", "Mundo", "Swift"]
let longitudes = procesarArreglo(arreglo2: palabras, operacion: {palabra in return palabra.count})
print(longitudes)
