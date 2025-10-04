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

func greetUser(name: String?){
    
    guard let name = name else{
        print("Falta el nombre")
        return
    }
    
    print("Hola \(name)")
}

greetUser(name: "Rafael")
greetUser(name: nil)

func printCuadrado(of number: Int?){
    guard let number = number else {
        print("Numero no valido")
        return
    }
    
    print(number * number)
}

printCuadrado(of: 9)
printCuadrado(of: nil)

func safeDivide(_ a: Int?, by b: Int?) {
    
    guard let a = a else{
        print("No ingresaste numero")
        return
    }
    guard let b = b else{
        print("No ingresaste numero")
        return
    }
    if b == 0 {
        print("El division no puede ser 0")
        return
    }
    
    print(a / b)
    
    
}

safeDivide(10, by: 2)
safeDivide(8, by: 0)
safeDivide(nil, by: 3)

func checkAge(_ age : Int?) {
    if let age =  age {
        if age >= 18 {
            print("Acceso permitido")
        }else{
            print("Acceso denegado")
        }
    }else{
        print("Edad desconocida")
    }
}
checkAge(20)
checkAge(15)
checkAge(nil)

func combine(_ first: String?, _ second: String?){
    guard let first = first else{
        print("Faltan datos")
        return
    }
    guard let second = second else{
        print("Faltan datos")
        return
    }
    
    print("\(first) \(second)")
}

combine("Hola", "Mundo")
combine(nil, "Swift")

func getUsername3(from data:[String: String]?) {
    guard let data = data else{
        print("Error")
        return
    }
    
    print(data.values)
    
}
getUsername3(from: ["username": "SwiftCoder"])
getUsername3(from: [:])
getUsername3(from: nil)

//Desenvolver opcional con operador ??

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"


let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)


//Concatenar opciones
let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book1 {
    let title: String
    let author: String?
}

var book1: Book1? = nil
let author1 = book1?.author?.first?.uppercased() ?? "A"
print(author1)

//Como manejar fallas de funciones con opcionales

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user4 = (try? getUser(id: 23)) ?? "Anonymous"
print(user4)


//Checkpoint 9


func array(_ array: [Int]?) -> Int { array?.randomElement() ?? Int.random(in: 1...100) }
print(array([10, 20, 30, 40]))  // → uno de esos números
print(array([]))                // → número aleatorio 1...100
print(array(nil))               // → número aleatorio 1...100


//Nivel 1
//Ejercicio 1 : Conversion de texto a numero

func imprimirDobleSiEsNumero(texto : String?){
    if let texto = texto, let numero = Int(texto) {
        print(numero * 2)
    }else{
        print("Entrada invalida")
    }
}

imprimirDobleSiEsNumero(texto: "20")
imprimirDobleSiEsNumero(texto: "manzana")
imprimirDobleSiEsNumero(texto: nil)

//Nivel2
//Ejercicio 2 : Verificacion de perfil de usuario

func crearPerfilDeUsuario(nombre: String?, edad: String?){
    guard let nombre  = nombre else{
        print("El nombre es requerido")
        return
    }
    
    guard let edad = edad, let edadNum = Int(edad) else {
        print("La edad es obligatoria")
        return
    }
    Int(edad)
    
    print("Perfil creado para \(nombre) de \(edad) anios")
}

// Pruebas
crearPerfilDeUsuario(nombre: "Ana", edad: "25") // Debería crear el perfil
crearPerfilDeUsuario(nombre: nil, edad: "30")   // Debería fallar por el nombre
crearPerfilDeUsuario(nombre: "Luis", edad: "treinta") // Debería fallar por la edad
crearPerfilDeUsuario(nombre: "Pedro", edad: nil) // Debería fallar por la edad


//Nivel 3
//Ejercicio 3 : Configuracion de la aplicacion
let configuracionUsuario: [String: String] = ["nombre": "Carlos", "idioma": "Español"]

let temaActual = configuracionUsuario ["tema"] ?? "Claro"
print("Tema actual: \(temaActual)")

let configuracionUsuario2: [String: String] = ["nombre": "Laura", "tema": "Oscuro"]
let temaActual2 = configuracionUsuario2 ["tema"] ?? "Oscuro"
print("Tema actual: \(temaActual2)")


//Nivel 4
//Ejercicio 4 : Buscando en una libreta de Contactos
struct Contacto {
    let nombre: String
    let email: String?
}

let contactos = [
    Contacto(nombre: "Maria", email: "maria@correo.com"),
    Contacto(nombre: "Juan", email: nil),
    Contacto(nombre: "Pedro", email: "pedro@correo.com")
]

let emailJuan = contactos.first(where: {$0.nombre == "Juan"})?.email ?? "No se encuentra el contacto"
print("Email de Juan: \(emailJuan)") // Imprime "Sin email" porque la propiedad email es nil
let emailAna = contactos.first(where: {$0.nombre == "Ana"})?.email ?? "No se encuentra el contacto"
print("Email de Ana: \(emailAna)")
let emailDePedro = contactos.first(where: {$0.nombre == "Pedro"})?.email ?? "No se encuentra el contacto"
print("Email de Pedro : \(emailDePedro)")


func obtenerCalificacionFinal(datos: [String : String]?){
    guard let datos = datos else{
        print("No hay datos del estudiante sal!")
        return
    }
    if let calificacion = datos["calificacion"], let calificacionD = Double(calificacion){
        print("La calificacion final es: \(calificacionD)")
    }else{
        print("Calificacion no disponible.")
    }
}

let estudiante1: [String: String]? = ["nombre": "Sofia", "calificacion": "9.5"]
let estudiante2: [String: String]? = ["nombre": "Miguel"]
let estudiante3: [String: String]? = ["nombre": "Elena", "calificacion": "diez"]
let estudiante4: [String: String]? = nil

obtenerCalificacionFinal(datos: estudiante1) // Debería imprimir 9.5
obtenerCalificacionFinal(datos: estudiante2) // Debería imprimir "Calificación no disponible."
obtenerCalificacionFinal(datos: estudiante3) // Debería imprimir "Calificación no disponible."
obtenerCalificacionFinal(datos: estudiante4) // Debería imprimir "No hay datos del estudiante."


