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

//Mini Proyecto del dia 03 Analizador de Playlist Musicales
struct Cancion {
    let nombre : String
    let artista : String
    let duracion : Int
}

let playlist = [
    Cancion(nombre: "Shake it Off", artista: "Taylor Swift", duracion: 220),
    Cancion(nombre: "Me Porto Bonito", artista: "Bad Bunny", duracion: 178),
    Cancion(nombre: "Cruel Summer", artista: "Taylor Swift", duracion: 179),
    Cancion(nombre: "La Jumpa", artista: "Bad Bunny", duracion: 256),
    Cancion(nombre: "As It Was", artista: "Harry Styles", duracion: 167),
    Cancion(nombre: "Anti-Hero", artista: "Taylor Swift", duracion: 201)
]

var duracionTotal = 0
duracionTotal += playlist[0].duracion
duracionTotal += playlist[1].duracion
duracionTotal += playlist[2].duracion
duracionTotal += playlist[3].duracion
duracionTotal += playlist[4].duracion
duracionTotal += playlist[5].duracion

var minutosPlaylist = duracionTotal / 60
var segundosPlaylist = duracionTotal % 60

print("Duracion total de la playlist: \(minutosPlaylist) minutos y \(segundosPlaylist) segundos")
 

var artistasUnicos = Set<String>()
artistasUnicos.insert(playlist[0].artista)
artistasUnicos.insert(playlist[1].artista)
artistasUnicos.insert(playlist[2].artista)
artistasUnicos.insert(playlist[3].artista)
artistasUnicos.insert(playlist[4].artista)
artistasUnicos.insert(playlist[5].artista)


print("Reporte de Artistas")
var reporteArtistas = [String : Int]()
reporteArtistas[playlist[0].artista] = 1
reporteArtistas[playlist[1].artista] = 1
reporteArtistas[playlist[2].artista] = 2
reporteArtistas[playlist[3].artista] = 2
reporteArtistas[playlist[4].artista] = 1
reporteArtistas[playlist[5].artista] = 3
print(reporteArtistas)


//Ejercicios para practicar el dia 03

//Ejercicio 1

var listaDeTareas = Array<String>()

listaDeTareas.append("Pasear al perro")
listaDeTareas.append("Estudiar Swift")
listaDeTareas.append("Hacer la compra")
listaDeTareas.append("Llamar a mama")
listaDeTareas.append("Llamar a papa")

print("Tengo \(listaDeTareas.count) tareas pendientes")
print("La segunda tarea es \(listaDeTareas[1])")
print("Haz completo la tarea \(listaDeTareas[0])")
listaDeTareas.remove(at: 0)
print(listaDeTareas)
print("Lista ordenada \(listaDeTareas.sorted())")

//Ejercicio 2

var calificaciones = [String : Int]()
calificaciones["Ana"] = 9
calificaciones["Juan"] = 7
calificaciones["Luisa"] = 10
print("Juan ha repetido su examen y su calificacion mejor 8")
calificaciones["Juan"] = 8
print("La calificacion de Ana es \(calificaciones["Ana",default: 0])")
print("Calificación de Pedro \(calificaciones["Pedro"].map { String($0) } ?? "Calificacion no encontrada")")

print(calificaciones)

//Ejercicio 3
enum DiaDeLaSemana {
    case lunes
    case martes
    case miercoles
    case jueves
    case viernes
    case sabado
    case domingo
}

var diasDeAsistencia = Set<DiaDeLaSemana>()

diasDeAsistencia.insert(DiaDeLaSemana.lunes)
diasDeAsistencia.insert(DiaDeLaSemana.miercoles)
diasDeAsistencia.insert(DiaDeLaSemana.viernes)
diasDeAsistencia.insert(DiaDeLaSemana.lunes)

print("Esta semana el usuario ha entrenado \(diasDeAsistencia.count) dias distintos")
print("El usuario entreno el martes ? \(diasDeAsistencia.contains(DiaDeLaSemana.martes))")

//Mini Proyecto Biblioteca

// --- 1. DEFINICIÓN DEL MODELO ---
// Se crea la "plantilla" o "molde" para todos los futuros objetos de tipo Libro.
struct Libro {
    // --- Propiedades ---
    // Datos que describen un libro.
    let titulo: String
    let autor : String
    var copiasDisponibles : Int
    
    // Un Enum anidado para definir un tipo de dato específico para los géneros.
    enum Genero {
        case ficcion
        case nonFiccion
        case fantasia
        case CienciaFiccion
    }
    var genero : Genero
    
    // Una propiedad computada que calcula el estado basado en las copias.
    var prestado :String {
        return copiasDisponibles > 0 ? "Disponible" : "Agotado"
    }
    
    // --- Métodos (Acciones) ---
    // Un método "mutating" porque cambia el valor de una propiedad (copiasDisponibles).
    mutating func prestamo(){
        copiasDisponibles -= 1
    }
    
    mutating func devolucion(){
        copiasDisponibles += 1
    }
    
    // Un método para imprimir un resumen rápido del estado de un libro.
    func mostrarInfo (){
        print("Titulo : \(titulo), Autor : \(autor), Copias Disponibles : \(copiasDisponibles), Genero : \(genero) esta disponible ? : \(prestado)")
    }
}

// --- 2. CREACIÓN DEL INVENTARIO INICIAL ---

// Se crea un Array vacío que contendrá la colección de la biblioteca.
var coleccionLibros = Array<Libro>()

// Se crean las variables para cada libro individual.
var libro1 = Libro(titulo: "1984", autor: "George Orwell", copiasDisponibles: 2, genero: .ficcion)
// Se añade una COPIA de libro1 al array.
coleccionLibros.append(libro1)

var libro2 = Libro(titulo: "Sapiens", autor: "Yuval Noah Harari", copiasDisponibles: 3, genero: .nonFiccion)
coleccionLibros.append(libro2)

var libro3 = Libro(titulo: "El Hobbit", autor: "J.R.R Tolkien", copiasDisponibles: 4, genero: .fantasia)
coleccionLibros.append(libro3)

var libro4 = Libro(titulo: "Dune", autor: "Frank Herbert", copiasDisponibles: 1, genero: .CienciaFiccion)
coleccionLibros.append(libro4)

var libro5 = Libro(titulo: "El senor de los anillos", autor: "J.R.R Tolkien", copiasDisponibles: 1, genero: .fantasia)
coleccionLibros.append(libro5)


// --- 3. SIMULACIÓN DE EVENTOS DEL DÍA ---

// Se imprime el total de libros inicial en la colección.
print("La biblioteca tiene un total de \(coleccionLibros.count) libros")

// Evento 1: Préstamo de "Dune"
print("Juan pide prestado Dune")
// Se modifica la COPIA del libro que está DENTRO del array en la posición 3.
coleccionLibros[3].prestamo()
// Se revisa el estado de la COPIA DENTRO del array para confirmar el cambio.
print("La cantidad de copias disponibles de Dune es \(coleccionLibros[3].copiasDisponibles)")

// Evento 2: Préstamo de "1984"
print("Ana pide prestado 1984")
coleccionLibros[0].prestamo()
print("La cantidad de copias disponibles de 1984 es \(coleccionLibros[0].copiasDisponibles)")

// Evento 3: Préstamo de "El Hobbit"
print("Carlos pide prestado El Hobbit")
coleccionLibros[2].prestamo()
print("La cantidad de copias disponibles de El Hobbit es \(coleccionLibros[2].copiasDisponibles)")

// Evento 4: Devolución de "1984"
coleccionLibros[0].devolucion()


// --- 4. GENERACIÓN DE REPORTES FINALES ---

// Reporte de Inventario (basado en las variables originales, no en el array actualizado).
print("Todos los libros de la coleccion")
libro1.mostrarInfo()
libro2.mostrarInfo()
libro3.mostrarInfo()
libro4.mostrarInfo()
libro5.mostrarInfo()

// Reporte de Autores Únicos (creado manualmente).
var autoresBiblioteca = Set<String>()
autoresBiblioteca.insert(coleccionLibros[0].autor)
autoresBiblioteca.insert(coleccionLibros[1].autor)
autoresBiblioteca.insert(coleccionLibros[2].autor)
autoresBiblioteca.insert(coleccionLibros[3].autor)
autoresBiblioteca.insert(coleccionLibros[4].autor)
print("Los autores de la biblioteca son: \(autoresBiblioteca)")

// Reporte de Conteo por Género (creado manualmente).
var generosBiblioteca = [String : Int]()
generosBiblioteca["Ficción", default: 0] = 1
generosBiblioteca["Non Ficción", default: 0] = 1
generosBiblioteca["Fantasia", default: 0] = 1
generosBiblioteca["Ciencia Ficción", default: 0] = 1
generosBiblioteca["Fantasia", default: 0] = 2
print("Titulos de cada genero de la biblioteca: \(generosBiblioteca)")
