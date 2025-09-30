
import UIKit

//Challenge numero 08

//Challenge 1 : El contador de vocales y constantes
let bienvenidaChallenge1 = {
    print("Empezamos con el challenge numero 1!")
}
func analizarPalabra (palabra: String) -> (vocales: Int, constantes: Int) {
    var vocales : Int = 0
    var constantes : Int = 0
    //Definir que letras son vocales
    let conjuntoVocales = "aeiouAEIOU"
    for letra in palabra {
        if letra.isLetter {
            if conjuntoVocales.contains(letra){
                vocales += 1
            }else{
                constantes += 1
            }
        }
    }
    return (vocales, constantes)
}
bienvenidaChallenge1()
let palabraPrueba = analizarPalabra(palabra: "Swift es Genial")
print(palabraPrueba)

//Challenge 2 : La calculadora de Propinas

func calcularPropina (deLa cuenta : Double, satisfaccion: String) -> Double? {
    
    switch satisfaccion {
    case "excelente":
        return (1 + 0.20) * cuenta
    case "bueno":
        return (1 + 0.15) * cuenta
    case "regular":
        return (1 + 0.10) * cuenta
    default:
        return nil
    }

}

if let totalPagar = calcularPropina(deLa: 550, satisfaccion: "excelente"){
    print("El total a pagar es : $\(totalPagar)")
}
if let casoFallido = calcularPropina(deLa: 1000, satisfaccion: "malo"){
    print("El total a pagar es : $\(casoFallido)")
}


//Challenge 3 : Gesitionando un Carrito de Compras
struct Producto {
    let nombre: String
    let precio: Double
}

struct CarritoDeCompras {
    var item: [Producto]
    
    // Agregar producto (mutating)
    mutating func agregarProducto(producto: Producto) {
        item.append(producto)
    }
    
    // Eliminar producto por nombre
    mutating func eliminar(nombreDeProducto: String) {
        if let index = item.firstIndex(where: { $0.nombre.lowercased() == nombreDeProducto.lowercased() }) {
            item.remove(at: index)
        }
    }
    
    // Total del carrito
    var total: Double {
        item.map { $0.precio }.reduce(0, +)
    }
}

let manzana = Producto(nombre: "Manzana", precio: 15.0)
let leche   = Producto(nombre: "Leche",   precio: 25.5)
let pan     = Producto(nombre: "Pan",     precio: 26.0)

var miCarrito = CarritoDeCompras(item: [])
miCarrito.agregarProducto(producto: manzana)
miCarrito.agregarProducto(producto: leche)
miCarrito.agregarProducto(producto: pan)

print("Total actual: \(miCarrito.total)")
// Total actual: 66.5

miCarrito.eliminar(nombreDeProducto: "Leche")
print("Total después de eliminar: \(miCarrito.total)")
// Total después de eliminar: 41.0


//Challenge 4 : El Analista de Estudiantes

struct Estudiante {
    let nombre: String
    let calificacion: Int
}

let listaEstudiantes = [
    Estudiante(nombre: "Ana", calificacion: 95),
    Estudiante(nombre: "Luis", calificacion: 65),
    Estudiante(nombre: "Carlos", calificacion: 88),
    Estudiante(nombre: "Sofía", calificacion: 72),
    Estudiante(nombre: "Juan", calificacion: 50),
    Estudiante(nombre: "Elena", calificacion: 100)
]

let cuadroDeHonor = listaEstudiantes
    .filter{$0.calificacion >= 70}
    .sorted {$0.calificacion > $1.calificacion}
    .map{$0.nombre}

print(cuadroDeHonor)


//Challenge 5 : El validador de Formulario

enum EstadoValidacion {
    case valido, errorLongitud, errorSinNumero
    var mensaje : String {
        switch self {
        case .valido: 
            return "El texto es válido"
        case .errorLongitud:
            return "El texto debe tener al menos 6 caracteres"
        case .errorSinNumero:
            return "El texto debe contener al menos un número"
        }
    }
}

func validar (_ texto: String) -> EstadoValidacion {
    if texto.count < 6{
        return .errorLongitud
    } else if texto.range(of: "[0-9]", options: .regularExpression) == nil {
        return .errorSinNumero
    }
    return .valido
}

func imprimirResultado(para texto : String) {
    let resultado = validar(texto)
    switch resultado {
    case .valido:
        print(resultado.mensaje)
    case .errorLongitud:
        print(resultado.mensaje)
    case .errorSinNumero:
        print(resultado.mensaje)
    }
}

imprimirResultado(para: "swift123")   // Válido
imprimirResultado(para: "hola")        // Error de longitud
imprimirResultado(para: "holamundo")   // Error de número

//Challenge 6 : El cajero automatico

var saldoEnCuenta = 1000.0

enum ErrorCajero: Error {
    case montoInvalido
    case fondosInsuficientes
}
@MainActor
func retirarDinero(monto: Double) throws -> Double {
    if monto <= 0 {
        throw ErrorCajero.montoInvalido
    }
    if monto > saldoEnCuenta {
        throw ErrorCajero.fondosInsuficientes
    }
    
    saldoEnCuenta -= monto
    return saldoEnCuenta
}


do {
    let nuevoSaldo1 = try retirarDinero(monto: 500.0)
    print("Retiro Exitoso nuevo saldo : \(nuevoSaldo1)")
    let nuevoSaldo2 = try retirarDinero(monto: 600.0)
    print("Nuevo saldo: $\(nuevoSaldo2)")

}catch ErrorCajero.fondosInsuficientes{
    print("Error: No tienes fondos suficientes")
    
}catch ErrorCajero.montoInvalido{
    print("Error ingrtesa un monto valido")
}catch {
    print("Ocurrio un error inesperado \(error)")
}
print("Saldo final en la cuenta: \(saldoEnCuenta)") // Debería ser 500.0


//Challenge 07 : Figuras Geometricas (Protocolos)

protocol FiguraGeometrica {
    var area: Double { get }
    var perimetro : Double {get}
}

struct Cuadrado : FiguraGeometrica {
    var area: Double {
        return lado * lado
    }
    
    var perimetro: Double {
        return 4 * lado
    }
    
    var lado : Double
    
}
struct Circulo : FiguraGeometrica{
    var radio: Double

    var area: Double {
        return Double.pi * radio * radio
    }
    
    var perimetro : Double{
        return 2 * Double.pi * radio
    }
}


let miCuadrado = Cuadrado(lado: 10)
let miCirculo = Circulo(radio: 5)

// Crea un array que contenga ambas figuras
let misFiguras: [FiguraGeometrica] = [miCuadrado, miCirculo]

for figura in misFiguras {
    // Gracias al protocolo, podemos tratarlas de la misma manera
    print("Área: \(figura.area), Perímetro: \(figura.perimetro)")
}
