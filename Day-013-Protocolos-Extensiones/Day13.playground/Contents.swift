import UIKit

//Dia 13 de 100 dias con SwiftUI

protocol Vehicle {
    var name: String {get}
    var currentpassengers: Int {get set}
    func estimateTime(for distance : Int) -> Int
    func travel(distance: Int)
}

struct Car : Vehicle {
    let name = "Car"
    var currentpassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance) km")
    }
    
    func openSunroof(){
        print("It's a nice day!")
    }
}

func commute(distance: Int, usign vehicle : Vehicle){
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    }else{
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 1000, usign: car)
car.openSunroof()

struct Motorcycle : Vehicle {
    var name = "Motorcycle"
    var currentpassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 20
    }
    
    func travel(distance: Int) {
        print("I'm riding \(distance) km")
    }
}

let motorcycle = Motorcycle()
commute(distance: 1000, usign: motorcycle)

func getTravelEstimates(using  vehicles: [Vehicle], distance : Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name) estimated time to travel \(distance) km is \(estimate) minutes")
    }
}

protocol FeedItem {
    //Todos los elementos deber un autor y una fecha
    var author: String {get}
    var timestamp : Date {get}
    
    //Todos los elementos debern poder mostrarse
    func displayContent()
    
}

//Creamos tipo de contenido especifico cda uno cumple con el protocolo feeditem

//Publicad de texto
struct TextPost : FeedItem {
    var author : String
    var timestamp : Date
    var text : String // Propiedad unica
    
    func displayContent() {
        print("Text post by \(author): \(text)")
    }
    
    
}

//Publicacion de texto
struct PhotoPost: FeedItem {
    var author: String
    var timestamp: Date
    var image: String // Propiedad única (nombre de la imagen)
    var caption: String

    func displayContent() {
        print("\(author) publicó una foto [\(image)] con la descripción: \(caption)")
    }
}

// Publicación de video
struct VideoPost: FeedItem {
    var author: String
    var timestamp: Date
    var videoURL: String // Propiedad única
    var views: Int

    func displayContent() {
        print("\(author) publicó un video [\(videoURL)] que tiene \(views) vistas.")
    }
}

let post1 = TextPost(author: "Ana", timestamp: Date(), text: "Que gran dia!")
let post2 = PhotoPost(author: "Luis", timestamp: Date(), image: "plata.jpg", caption: "Descansando en playa!")
let post3 = VideoPost(author: "Carla", timestamp: Date(), videoURL: "concierto.mp4", views: 1500)

//Podemos mezclarlos eun solo array
let myFeed : [FeedItem] = [post1, post2, post3]

for item in myFeed {
    item.displayContent()
}

//
protocol Instrumento {
    func tocar()
}

struct Guitarra: Instrumento {
    func tocar() {
        print("Tocando guitarra")
    }
}
struct Bateria: Instrumento {
    func tocar() {
        print("Tocando batería")
    }
}

var guitarra = Guitarra()
guitarra.tocar()

var bateria = Bateria()
bateria.tocar()

protocol Figura{
    var nombre: String {get}
    
    func calcularArea() -> Double
}

struct Circulo: Figura {
    var nombre: String
    var radio: Double
    
    func calcularArea() -> Double {
        return .pi * radio * radio
    }
}
struct Cuadrado : Figura{
    var nombre: String
    var lado : Double
    
    func calcularArea() -> Double {
        lado * lado
    }
}

func imprimirDetalles(de figura : Figura) {
    print("El nombre de la figura es \(figura.nombre) y su area es \(figura.calcularArea())")
}

var arrayFiguras : [Figura] = []

arrayFiguras.append(Circulo(nombre: "Circulo", radio: 5))
arrayFiguras.append(Cuadrado(nombre: "Cuadrado", lado: 10))

for figura in arrayFiguras {
    imprimirDetalles(de: figura)
}


protocol Prestable {
    var idUnico : String {get}
    var estaPrestado : Bool {get set}
    
    mutating func prestar()
    mutating func devolver()
}

struct Libros : Prestable {
    var titulo : String
    var autor : String
    var  idUnico: String
    var estaPrestado: Bool = false
    
    mutating func prestar() {
        self.estaPrestado = true
    }
    mutating func devolver() {
        self.estaPrestado = false
    }
    
    
}

struct PeliculaDvd : Prestable {
    var titulo : String
    var idUnico: String
    var estaPrestado: Bool = false
    
    mutating func prestar() {
        self.estaPrestado = true
    }
    mutating func devolver() {
        self.estaPrestado = false
    }
}

class Biblioteca {
    var inventario : [Prestable] = []
    
    func agregar(item:Prestable) {
        inventario.append(item)
    }
    func listarInventario() {
        for prestable in inventario {
            print("Item \(prestable.idUnico) está \(prestable.estaPrestado ? "prestado" : "disponible")")

            
        }
    }
}

var biblio = Biblioteca()
var libro = Libros(titulo: "1984", autor: "George Orwell", idUnico: "12345")
var pelicula = PeliculaDvd(titulo: "IronMan", idUnico: "213213")

biblio.agregar(item: libro)
biblio.agregar(item: pelicula)

biblio.listarInventario()

biblio.inventario[0].prestar()
biblio.listarInventario()

//Tipos de retornos opacos

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

protocol Juguete {
    func jugar()
}

struct Carrito: Juguete {
    func jugar() {
        print("🚗 Vroom vroom! Estoy jugando con un carrito")
    }
}

struct Osito: Juguete {
    func jugar() {
        print("🧸 Abrazo suave! Estoy jugando con un osito")
    }
}

// ❌ Función intentando devolver un "cualquier juguete"
// Esto no funciona porque Swift no sabe cuál será en realidad
/*
func obtenerJuguete() -> Juguete {
    // Puede devolver Carrito o Osito
    Bool.random() ? Carrito() : Osito()
}
*/

func obtenerCarrito() -> some Juguete{
    Carrito()
}
func obtenerOsito() -> some Juguete{
    Osito()
}

let miCarrito = obtenerCarrito()
miCarrito.jugar()
let miOsito = obtenerOsito()
miOsito.jugar()

//Como crear y utilizar extenciones de protocolo

extension Collection {
    var isNotEmpty : Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty{
    print("Guest count: \(guests.count)")
}


protocol PersonE {
    var name : String {get}
    func sayHello()
}

extension PersonE {
    func sayHello(){
        print("Hi, I'm\(name)")
    }
}

struct Employee3 : PersonE {
    let name : String
}


protocol Videojuego {
    var titulo : String {get}
    func jugar()
}

extension Videojuego {
    func jugar(){
        print("Estas jugando \(titulo)")
    }
}

struct MarioBros : Videojuego {
    var titulo : String
}

let juego = MarioBros(titulo: "Mario Bros")
juego.jugar()

//CheckPoint 8

