import UIKit

//Challenge 07


//Ejercicios 1 del dia 1
let nombre = "Rafael"
var edad : Int
edad = 21
print("Mi nombre es \(nombre) y tengo \(edad) años")

//Ejercicio 2 del dia 1
let costoComida = 50.0
let porcentajePropina = 18.0
var montoPropina = costoComida * (porcentajePropina / 100)
print("El monto de la propina es \(montoPropina)")

//Ejercicio 3 del dia 1
let temperaturaGradosCelcius = 25.0
var temperaturaGradosFahrenheit  = (temperaturaGradosCelcius * 9.0 / 5.0) + 32.0

print("El resultado de la conversion es \(temperaturaGradosFahrenheit) y en grados celcius es \(temperaturaGradosCelcius)")

//Ejercicio 1 del dia 2
var playlist = Array<String>()
playlist.append("Golden")
playlist.append("Tu sin mi")
playlist.append("Iris")
playlist.append("Kamado")
playlist.append("Kamado")

print(playlist.count)
for cancion in playlist{
    print(cancion)
}

var playlistSinRepetidos = Set<String>(playlist)
print(playlistSinRepetidos.count)
for cancion in playlistSinRepetidos{
    print(cancion)
}

//Ejercicio 2 del dia 2

var contactosEmergencia = [String : Int]()

contactosEmergencia["Ambulancia"] = 2132133
contactosEmergencia["Policia"] = 213102
contactosEmergencia["Fire Brigade"] = 21102101

print("El numero de contacto es : \(contactosEmergencia["Fire Brigade", default: 0])")

//Ejercicio 3 del dia 2
enum talla {
    case chica,mediana,grande,extraGrande
}

var tallaSeleccionada = talla.mediana

print("La talla seleccionada es \(tallaSeleccionada)")

//Ejercicio 1 del dia 3
let edad3 = 21

if edad3 >= 18 {
    print("Puedes votar por que tienes \(edad3) años")
}else{
    print("No puedes votar por que tienes \(edad3) años")
}

//Ejercicio 2 del dia 3

var puntuacion = 20

if puntuacion > 80 && puntuacion <= 100 {
    print("Excelente trabajo.")
}else if puntuacion > 50 && puntuacion <= 80{
    print("No esta mal pero puedes mejorar.")
}else {
    print("Necesitas practicar mas.")
}

//Ejercicio 3 del dia 3
enum climaP {
    case soleado , lluvioso, nublado
}
let clima3 = climaP.soleado
switch clima3 {
case .soleado:
    print("No olvides usar protecto solar.")
case .lluvioso:
    print("No olvides llevar un paraguas.")
case .nublado:
    print("No olvides llevar un sueter.")
}

//Ejercicio 1 del dia 4
let numeroF =  5
for i in 1...10 {
    print("\(numeroF) x \(i) = \(numeroF * i)")
}

//Ejercicio 2 del dia 4
var cuentaRegresiva = 10
print("Despliegue en : ")
while cuentaRegresiva > 0 {
    print(cuentaRegresiva)
    cuentaRegresiva -= 1
}
print("Despliegue!")

//Ejercicio 3 del dia 4
let numerosF = [1,3,5,7,8,9,11]

for numeros in numerosF{
    
    if numeros % 2 != 0{
        print("Numero impar encontrado es : \(numeros) saltando...")
        continue
    }else{
        print("Primer numero par encontrado es : \(numeros)! Saliendo del bucle.")
        break
    }
}
        

//Ejercicio 1 del dia 5
func saludar (a nombre : String) {
    print("Hola \(nombre)! Que tengas un gran dia")
}

saludar(a: "Xana")
saludar(a: "Rafael")

//Ejercicio 2 del dia 5
func calcularAreaCuadrado(lado : Double ) -> Double {
    return lado * lado
}
let area = calcularAreaCuadrado(lado: 5)
print(area)

//Ejercicio 3 del dia 5
func esPar(el numero:Int) -> Bool {
    if numero % 2 == 0{
        return true
    }
    return false
}
print(esPar(el: 10))
print(esPar(el: 3))

//Ejercicio 1 del dia 6
func organizarEvento(nombre : String, numeroDeInvitados: Int = 10) {
    print("Evento organizado por \(nombre) para \(numeroDeInvitados) personas")
}
organizarEvento(nombre: "Rafael")
organizarEvento(nombre: "Xana", numeroDeInvitados: 30)

//Ejercicio 2 del dia 6
enum ErrorDeContrasena : Error {
    case demasiadoCorta, esObvia
    
    var mensaje : String {
        switch self {
        case .demasiadoCorta:
            return "La contrasena es demasiado corta"
        case .esObvia:
            return "La contrasena es demasiado obvia"
        }
    }
}

func verificar(contrasena: String) throws{
    if contrasena.count < 8{
        throw ErrorDeContrasena.demasiadoCorta
    }
    if contrasena.contains("12345678"){
        throw ErrorDeContrasena.esObvia
    }
    print("La contrasena es segura")
}
do {
    try verificar(contrasena: "dfjsahfhasdjkfs2")
}catch let error as ErrorDeContrasena{
    print(error.mensaje)
}


//Ejercicio 3 del dia 6
enum ErroresRaiz : Error {
    case fueraRango, sinRaizEntera
    
    var mensaje : String {
        switch self {
        case .fueraRango:
            return "El numero esta fuera del rango 1 y 10 000"
        case .sinRaizEntera:
            return "El numero no tiene raiz entera"
        }
    }
}
func raizCuadrada(de numero: Int) throws -> Int {
    if numero < 1 || numero > 10_000 {
        throw ErroresRaiz.fueraRango
    }
    
    for i in 1...100 {
        if i * i == numero {
            return i
        } else if i * i > numero {
            throw ErroresRaiz.sinRaizEntera
        }
    }
    
    throw ErroresRaiz.sinRaizEntera
}
do{
    let raiz = try raizCuadrada(de: -1)
    print(raiz)
}catch let error as ErroresRaiz{
    print(error.mensaje)
}
do{
    let raiz = try raizCuadrada(de: 25)
    print(raiz)
}catch let error as ErroresRaiz{
    print(error.mensaje)
}

do{
    let raiz = try raizCuadrada(de: 8)
    print(raiz)
}catch let error as ErroresRaiz {
    print(error.mensaje)
}

struct Libro {
    let id: String
    let titulo: String
    let autor: String
}

struct Biblioteca {
    var catalogo: [String: Libro]
    var librosPrestados: [String: String] = [:]

    // Presta un libro a una persona
    mutating func prestar(libroId: String, a persona: String) -> String {
        // 1. Asegurarse de que el libro exista en el catálogo
        guard let libro = catalogo[libroId] else {
            return "Error: El libro con ID '\(libroId)' no existe."
        }

        // 2. Asegurarse de que el libro no esté ya prestado
        if let _ = librosPrestados[libroId] {
            return "Lo sentimos, '\(libro.titulo)' ya está prestado."
        }

        // 3. Registrar el préstamo
        librosPrestados[libroId] = persona
        return "'\(libro.titulo)' ha sido prestado a \(persona)."
    }

    // Devuelve un libro que estaba prestado
    mutating func devolver(libroId: String) -> String {
        guard let libro = catalogo[libroId] else {
            return "Error: El libro con ID '\(libroId)' no existe."
        }

        // Verificar si el libro estaba efectivamente prestado
        if librosPrestados.removeValue(forKey: libroId) != nil {
            return "¡Gracias! '\(libro.titulo)' ha sido devuelto."
        } else {
            return "'\(libro.titulo)' no estaba en la lista de libros prestados."
        }
    }

    // Muestra los libros que no están prestados
    func mostrarDisponibles() {
        print("--- Libros Disponibles ---")
        for libro in catalogo.values {
            if librosPrestados[libro.id] == nil {
                print("- \(libro.titulo) por \(libro.autor)")
            }
        }
        print("--------------------------")
    }
    
    // Muestra los libros que están prestados
    func mostrarPrestados() {
        print("--- Libros Prestados ---")
        if librosPrestados.isEmpty {
            print("No hay libros prestados en este momento.")
        } else {
            for (libroId, persona) in librosPrestados {
                if let libro = catalogo[libroId] {
                    print("- '\(libro.titulo)' prestado a \(persona)")
                }
            }
        }
        print("------------------------")
    }
}

// --- Ejemplo de Uso ---

// 1. Crear algunos libros
let libro1 = Libro(id: "L001", titulo: "Cien Años de Soledad", autor: "Gabriel García Márquez")
let libro2 = Libro(id: "L002", titulo: "El Señor de los Anillos", autor: "J.R.R. Tolkien")
let libro3 = Libro(id: "L003", titulo: "1984", autor: "George Orwell")

// 2. Crear el catálogo de la biblioteca
let catalogoInicial = [
    libro1.id: libro1,
    libro2.id: libro2,
    libro3.id: libro3
]

// 3. Crear una instancia de la biblioteca
var miBiblioteca = Biblioteca(catalogo: catalogoInicial)

// 4. Probar las funcionalidades
miBiblioteca.mostrarDisponibles()
print("\n")
print(miBiblioteca.prestar(libroId: "L002", a: "Juan Pérez"))
print(miBiblioteca.prestar(libroId: "L003", a: "Ana Gómez"))
print(miBiblioteca.prestar(libroId: "L002", a: "Pedro Marín")) // Intentar prestar un libro ya prestado
print("\n")
miBiblioteca.mostrarDisponibles()
miBiblioteca.mostrarPrestados()
print("\n")
print(miBiblioteca.devolver(libroId: "L003"))
print("\n")
miBiblioteca.mostrarPrestados()
miBiblioteca.mostrarDisponibles()


