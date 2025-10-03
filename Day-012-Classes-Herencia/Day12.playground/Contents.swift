import UIKit

//Day 12 de 100 dias con SwiftUI

class Game {
    var score = 0 {
        didSet {
            print("Score: \(score)")
        }
    }
}

var newGame = Game()
newGame.score = 10
newGame.score = 20 


//Crear clases heredadas de otra clase padre

class Employee {
    let hours: Int
    init(hours: Int) {
        self.hours = hours
    }
    func printSummary() {
        print("I work \(hours) hours a day!")
    }
    
}

class Developer : Employee {
    func work() {
        print("Developer working for \(hours)")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }

}

final class Testers : Employee {
    func test() {
        print("Testers testing for \(hours)")
    }
}

let jose = Developer(hours: 10)
let rafael = Testers(hours: 10)
jose.work()
rafael.test()
jose  .printSummary()
//Como agregar inicialzadores a las clases

class Vehicle {
    let isElectric : Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car : Vehicle {
    let isConvertible : Bool
    
    init(isElectric:Bool,isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric:isElectric)
    }
}

//Crear copias de una clase

class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
user2.username = "Taylor"
print(user1.username)
print(user2.username)

//Desinicializadores de clases
class User2 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}
for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): Im in control!")
}

//Variables de una clase
class User3 {
    var name = "Paul"
}

// 1️⃣ Instancia constante, propiedad variable
let user11 = User3()
user11.name = "Taylor" // ✅ Cambia la propiedad
// user1 = User()      // ❌ Error, no se puede reasignar la instancia

// 2️⃣ Instancia variable, propiedad variable
var user22 = User3()
user22.name = "Taylor"  // ✅ Cambia la propiedad
user22 = User3()          // ✅ Se puede asignar un objeto nuevo

// 3️⃣ Instancia variable, propiedad constante
class User4 {
    let name: String
    init(name: String) { self.name = name }
}

var user3 = User4(name: "Paul")
// user3.name = "Taylor"  // ❌ Error, propiedad constante
user3 = User4(name: "Taylor") // ✅ Se puede apuntar a un objeto nuevo


// MARK: - Clase base
class Animal {
    var legs: Int
    
    init(legs: Int = 4) { // Valor por defecto 4 patas
        self.legs = legs
    }
    
    func speak() {
        // Método genérico, puede dejarse vacío o con un sonido neutral
        print("Animal sound")
    }
}

// MARK: - Subclases de Animal
class Dog: Animal {
    override func speak() {
        print("Woof!")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init()
    }
    
    override func speak() {
        print("Meow!")
    }
}

// MARK: - Subclases de Dog
class Corgi: Dog {
    override func speak() {
        print("A corgi woof!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("A Poodle woof!")
    }
}

// MARK: - Subclases de Cat
class Persian: Cat {
    override func speak() {
        print("A Persian meow!")
    }
}

class Lion: Cat {
    override func speak() {
        print("A Lion meow!")
    }
}

// MARK: - Ejemplos de uso
let myDog = Dog()
myDog.speak() // Woof!

let myCorgi = Corgi()
myCorgi.speak() // A corgi woof!

let myPoodle = Poodle()
myPoodle.speak() // A Poodle woof!

let myCat = Cat(isTame: true)
myCat.speak() // Meow!

let myPersian = Persian(isTame: true)
myPersian.speak() // A Persian meow!

let myLion = Lion(isTame: false)
myLion.speak() // A Lion meow!
myLion.isTame = true // Cambiar propiedad después de crear


//Ejercicios de Practica

//Mini-Proyecto: Gestion de Empleados de una Startup

class Empleado {
    let nombre  : String
    var salario : Double
    
    init(nombre: String, salario: Double) {
        self.nombre = nombre
        self.salario = salario
    }
    
    deinit{
        print("\(nombre) ha dejado la empresa")
    }
    
    func trabajar(){
        print("\(nombre) está cumpliendo sus tareas")
    }
}

class Gerente : Empleado {
    var equipo : [Empleado]
    
    init(nombre: String, salario: Double, equipo: [Empleado]) {
        self.equipo = equipo
        super.init(nombre: nombre, salario: salario)
    }
    
    override func trabajar() {
        print("\(nombre) está supervisando al equipo")
        equipo.forEach { $0.trabajar() }
    }
    
}
enum TipoDeLenguaje {
    case swift
    case Objective
    case js
}
final class Desarollador : Empleado {
    let lenguajeDeProgramacion : TipoDeLenguaje
    
    init(nombre: String, salario: Double,lenguajeDeProgramacion: TipoDeLenguaje) {
        self.lenguajeDeProgramacion = lenguajeDeProgramacion
        super.init(nombre: nombre, salario: salario)
    }
    
    override func trabajar() {
        print("\(nombre) esta programando en \(lenguajeDeProgramacion)")
    }
}


let desarollador1 = Desarollador(nombre: "Rafael", salario: 320, lenguajeDeProgramacion: .swift)
let desarollador2 = Desarollador(nombre: "Jose", salario: 592, lenguajeDeProgramacion:.Objective)
var equipo = [desarollador1,desarollador2]
let gerente1 = Gerente(nombre: "Xana", salario: 201, equipo: equipo)
var liderDeProyecto = gerente1
let desarollador3 = Desarollador(nombre: "Victor",salario: 212,lenguajeDeProgramacion: .js)
liderDeProyecto.equipo.append(desarollador3)
print(gerente1.equipo.count)
print(liderDeProyecto.equipo.count)
//Ahora, imprime el número de miembros en el equipo de carlos. ¿Refleja el cambio que hiciste a través de liderDeProyecto? ¿Por qué? Porque apuntan al mismo data aunque sea una copia este tambien se refleja en el original

let empleadoEstrella = desarollador2
empleadoEstrella.salario = 100000
print(empleadoEstrella.salario)
//Crea una constante (let) para un empleado, por ejemplo, empleadoEstrella y asígnale a "Ana". Intenta cambiar el salario de Ana a través de esta constante. ¿Funciona? En este caso si funciona porque mi atributo salario es var y puedo cambiarlo
//empleadoEstrella = desarollador1 no funciona porque definimos empleadoEstrella como let entonces no permite cambiar su valor

desarollador1.trabajar()
desarollador2.trabajar()
gerente1.trabajar()

//MiniProyecto 2 : Gestion de una Biblioteca Digital

// --- PASO 1: Protocolo ---
// Define un contrato para cualquier cosa que pueda ser prestada.
protocol Prestable {
    var titulo: String { get }
    var estaPrestado: Bool { get set }
    
    mutating func prestar() throws
    mutating func devolver()
}

// -- PASO 2: Error Personalizado ---
enum ErrorBiblioteca: Error {
    case yaEstaPrestado
    case articulONoEncontrado
}

// --PASO 3: Crear tipos concretos ---
struct Libro : Prestable {
    let titulo : String
    let autor : String
    var estaPrestado: Bool = false
    
    mutating func prestar() throws {
        if estaPrestado {
            throw ErrorBiblioteca.yaEstaPrestado
        }
        print("El libro '\(titulo)' ha sido prestado.")
        self.estaPrestado = true
    }
    
    mutating func devolver() {
        print("El libro '\(titulo)' ha sido devuelto.")
        self.estaPrestado = false
    }
}

class Revista : Prestable {
    let titulo: String
    let numeroDeEdicion: Int
    var estaPrestado: Bool
    
    init(titulo: String, numeroDeEdicion: Int, estaPrestado: Bool) {
        self.titulo = titulo
        self.numeroDeEdicion = numeroDeEdicion
        self.estaPrestado = estaPrestado
    }
    
    func prestar() throws {
        if estaPrestado {
            throw ErrorBiblioteca.yaEstaPrestado
        }
        print("La revista '\(titulo)' ha sido prestada.")
        self.estaPrestado = true
    }
    
    func devolver() {
        print("La revista '\(titulo)' ha sido devuelta.")
               self.estaPrestado = false
    }
}
// --- PASO 4: Crear la clase Biblioteca ---

class Biblioteca {
    var catalogo = [Prestable]()
    
    func agregarArticulo(_ articulo: Prestable) {
        catalogo.append(articulo)
    }
    func prestar(titulo: String) {
            guard let indice = catalogo.firstIndex(where: { $0.titulo == titulo }) else {
                print("Error: El artículo '\(titulo)' no se encontró en el catálogo.")
                return
            }
            
            do {
                try catalogo[indice].prestar()
            } catch ErrorBiblioteca.yaEstaPrestado {
                print("Advertencia: '\(titulo)' no se puede prestar porque ya está prestado.")
            } catch {
                print("Ha ocurrido un error inesperado: \(error)")
            }
        }

    
    func buscarArticulo(filtro: (Prestable) -> Bool) -> [Prestable] {
        return catalogo.filter(filtro)
    }
}

var laZona = Biblioteca()
var elCienFuegos = Libro(titulo: "El Cien Fuegos", autor: "Carlos Ruiz Zafón", estaPrestado: false)
var donQuijote = Libro(titulo: "Don Quijote de la Mancha", autor: "Miguel de Cervantes", estaPrestado: true)
var cienAnios = Libro(titulo: "Cien años de soledad", autor: "Gabriel García Márquez", estaPrestado: false)
var laSombra = Libro(titulo: "La sombra del viento", autor: "Carlos Ruiz Zafón", estaPrestado: true)
var elPrincipito = Libro(titulo: "El Principito", autor: "Antoine de Saint-Exupéry", estaPrestado: false)
var rayuela = Libro(titulo: "Rayuela", autor: "Julio Cortázar", estaPrestado: true)

laZona.agregarArticulo(elCienFuegos)
laZona.agregarArticulo(donQuijote)
laZona.agregarArticulo(cienAnios)
laZona.agregarArticulo(laSombra)
laZona.agregarArticulo(elPrincipito)
laZona.agregarArticulo(rayuela)



laZona.prestar(titulo: "El Cien Fuegos")
laZona.prestar(titulo: "El Cien Fuegos")


laZona.prestar(titulo: "asdfsdsa")

let articulosPrestados = laZona.buscarArticulo(filtro: { $0.estaPrestado })
print("Articulos prestados : \(articulosPrestados.map{$0.titulo})")

let librosCarlos = laZona.buscarArticulo { articulo in
        if let libro = articulo as? Libro {
    
            return libro.autor == "Carlos Ruiz Zafón"
    }
    return false
}

print("Libros de Carlos Ruiz Zafron : \(librosCarlos.map{$0.titulo})")
