import UIKit

//Dia 07 de 100 dias con Swift

//Crear funciones
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}
//LLamar a funcion
showWelcome()

//Crear funciones con parametros
func printTimeTables(number : Int,start: Int,end: Int) {
    for i in start...end {
        print("\(i) x \(number) = \(i * number)")
    }
}
//Llamar a la funcion con argumentos
printTimeTables(number: 10, start: -2, end: 12)

//Funcion que retorna un valor

func rollDice() -> Int {
    return Int.random(in: 1...6)
}
let result = rollDice( )
print("You rolled a \(result)")

//Ejercicio uno
func contieneMismo (palabra1:String,palabra2:String) -> Bool {
    if palabra1.sorted() == palabra2.sorted() {
        return true
    }else{
        return false
    }
}
let mismo = contieneMismo(palabra1: "abcd", palabra2: "cba")
print(mismo)

//Ejercicio dos

func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)


//Como devolver multiples valores desde funciones
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")


func juegoFavorito (nombre : String) -> (juego: String,categoria:String){
    (juego: "The Legend of Zelda: Breath of the Wild",categoria:"Aventura")
    
}
let juegoFavorito1 = juegoFavorito(nombre: "Pablo")
print("El juego favorito es \(juegoFavorito1.juego) y pertenece a la categoria de \(juegoFavorito1.categoria)")


//Como personalizar las etiquetas de los parametros

let lyric = "I see a reed door and i know that it's time to go"
print(lyric.hasPrefix("I see"))

func isUpperCase(_ string:String) -> Bool {
    string == string.uppercased()
    
}

let string = "HOLA MUNDO"
print(isUpperCase(string))

func printTimesTable(for number: Int) {
    for i in 1...12{
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTable(for: 5)

//Mini proyecto del dia 07


struct Comentario {
    let autor : String
    let texto : String
}
let palabrasProhibidas = ["oferta", "gratis", "descuento"]
func esSpam(_ cadena : String) -> Bool{
    let cadenaEnMinusculas = cadena.lowercased()
    for palabrasProhibida in palabrasProhibidas {
        if cadenaEnMinusculas.contains(palabrasProhibida){
            return true
        }
    }
    return false
}

var palabra = esSpam("Este es un comentario de prueba ")
print(palabra)


func publicar (el comentario : Comentario) -> String{
    return ("El comentario fue hecho por \(comentario.autor) y dijo \(comentario.texto)")
}

var comentarioj = Comentario(autor: "Rafael", texto: "Buen video del putu")
print(publicar(el: comentarioj))


var comentarios = Array<Comentario>()
comentarios.append(Comentario(autor: "Xana", texto: "Buen video del putupao"))
comentarios.append(Comentario(autor: "Rafael", texto: "Buena oferta putupao"))
comentarios.append(Comentario(autor: "Victor", texto: "Protogemas GRATIS Putupao"))

for comentario in comentarios {
    
    if !esSpam(comentario.texto){
        print(publicar(el: comentario))
    }else{
        print("Comentario de \(comentario.autor) eliminado por ser spam ( \(comentario.texto))")
    }
}


//Segundo mini-proyecto del dia 07

struct Evento {
    let nombre : String
    let capacidad : Int
    var asistentes : [String] = []
    
    //Metodo para verficar si el evento esta lleno
    func estaLleno() -> Bool{
        return asistentes.count >= capacidad
    }
    
    //Un metodo que modifica la struct
    
    mutating func inscribir (_ persona:String) -> Bool{
        if !estaLleno(){
            asistentes.append(persona)
            return true
        }else{
            return false
        }
    }
}


func generarReporte(para evento : Evento) -> String{
    var capacidadRestante = evento.capacidad - evento.asistentes.count
    return "\(evento.nombre) - Plazas : \(evento.asistentes.count)/\(evento.capacidad) (Quedan \(capacidadRestante) disponibles)"
}

var evento1 = Evento(nombre: "Taller de Swift", capacidad: 6)

var nombresInteresados = Array<String>()

nombresInteresados.append("Xana")
nombresInteresados.append("Victor")
nombresInteresados.append("Rafael")
nombresInteresados.append("Ricardo")

for nombre in nombresInteresados{
    if evento1.inscribir(nombre){
        print("Inscripcion exitosa para \(nombre) en \(evento1.nombre)!")
    }else{
        print("Lo sentimos \(nombre) el evento \(evento1.nombre) ya esta lleno.")
    }
}
print("-------------------------------------")
print("REPORTE FINAL : ")
print(generarReporte(para: evento1))

//Tercer mini proyecto

struct Ingrediente {
    let nombre : String
    var cantidad : Double //Usamos var porque esta cantidad cambiara
    let unidad : String // ej: "gramos","tazas","unidades"

}


struct Receta {
    let nombre : String
    let porcionesBase : Int
    var ingredientes : [Ingrediente] // Un array de la struct anterior
    var porcionesActuales : Int
    
    init(nombre: String, porcionesBase: Int, ingredientes: [Ingrediente]) {
            self.nombre = nombre
            self.porcionesBase = porcionesBase
            self.ingredientes = ingredientes
            self.porcionesActuales = porcionesBase
        }
    
    // Aqui ira la funcion para escalar la receta
    mutating func escalar (para porciones : Int){
        var factor = Double(porciones) / Double(porcionesBase)
        
        for i in ingredientes.indices{
            ingredientes[i].cantidad *= factor
        }
        
        self.porcionesActuales = porciones
    }
}


func imprimirReceta(_ receta: Receta) {
    print("--- Receta: \(receta.nombre) (para \(receta.porcionesActuales) porciones) ---")
    for ingrediente in receta.ingredientes {
        // Formateamos el número para que no tenga tantos decimales
        let cantidadFormateada = String(format: "%.2f", ingrediente.cantidad)
        print("- \(cantidadFormateada) \(ingrediente.unidad) de \(ingrediente.nombre)")
    }
}

var recetaHotcakes = Receta(
    nombre: "Hotcakes Clásicos",
    porcionesBase: 4,
    ingredientes: [
        Ingrediente(nombre: "Harina", cantidad: 2, unidad: "tazas"),
        Ingrediente(nombre: "Huevos", cantidad: 2, unidad: "unidades"),
        Ingrediente(nombre: "Leche", cantidad: 1.5, unidad: "tazas"),
        Ingrediente(nombre: "Azúcar", cantidad: 0.25, unidad: "tazas")
    ]
)

imprimirReceta(recetaHotcakes)

print("\n...escalando la receta...\n")
recetaHotcakes.escalar(para: 6)

imprimirReceta(recetaHotcakes)
