
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
