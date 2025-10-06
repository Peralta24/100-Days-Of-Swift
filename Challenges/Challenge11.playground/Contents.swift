import UIKit

//Ejercicio repaso dia 1 - 14
//App de gastos personales Ejercicio 1

// 1.- Crear struct Gasto
struct Gasto {
    let nombre : String
    var monto : Double
    let categoria : String
    var descripcion : String {
        return("El nombre es \(nombre) con el monto de \(monto) y categoria \(categoria)")
    }
}

let gastos = [
    Gasto(nombre: "Café", monto: 45, categoria: "Comida"),
    Gasto(nombre: "Uber", monto: 120, categoria: "Transporte"),
    Gasto(nombre: "Netflix", monto: 139, categoria: "Entretenimiento")
]
var sumaComida = 0.0
var sumaEntretenimiento = 0.0
var sumaTransporte = 0.0
var montosCategorias : [String : Double] = [:]
for gasto in gastos {
    
    if gasto.categoria == "Comida" {
        sumaComida += gasto.monto
        montosCategorias["Comida"] = sumaComida
    }else if gasto.categoria == "Entretenimiento" {
        sumaEntretenimiento += gasto.monto
        montosCategorias["Entretenimiento"] = sumaEntretenimiento
    }else if gasto.categoria == "Transporte" {
        sumaTransporte += gasto.monto
        montosCategorias["Transporte"] = sumaTransporte
    }
}
print("La suma total de comida es \(sumaComida)")
print("La suma total de transporte es \(sumaTransporte)")
print("La suma total de entretenimiento es \(sumaEntretenimiento)")

print(montosCategorias)


//App de fitness

func verificarProgeso(pasos:Int?, objetivo: Int = 10_000) -> String {
    if let pasos = pasos {
        if pasos >= objetivo {
            return "Enhorabuena has cumplido tu objetivo de pasos"
        }else {
            return "Faltan \(objetivo - pasos) pasos para cumplir tu objetivo"
        }
    }else {
        return "No has dado información de pasos"
    }
}

print(verificarProgeso(pasos: 9_000))
print(verificarProgeso(pasos: nil))


//Tienda en linea
protocol Vendible {
    var nombre: String { get }
    var precio: Double { get }
    func descripcion() -> String
}

class Producto: Vendible {
    var nombre: String
    var precio: Double
    
    init(nombre: String, precio: Double) {
        self.nombre = nombre
        self.precio = precio
    }

    func descripcion() -> String {
        "\(nombre) cuesta $\(precio)"
    }
}

class Ropa : Producto {

    var garantia : Int
    var genero : String
    
    init(nombre: String, precio: Double, garantia: Int, genero: String) {
        self.garantia = garantia
        self.genero = genero
        super.init(nombre: nombre, precio: precio)
    }
    
    override func descripcion() -> String {
        return "El nombre es \(nombre) el precio es de \(precio) pesos el genero es de \(genero) y la garantia es hasta el \(garantia)"
    }
}

class Electronico : Producto {

    var garantia : Int
    var genero : String
    
    init(nombre: String, precio: Double, garantia: Int, genero: String) {
        self.garantia = garantia
        self.genero = genero
        super.init(nombre: nombre, precio: precio)
    }
    
    override func descripcion() -> String {
        return "El nombre es \(nombre) el precio es de \(precio) pesos el genero es de \(genero) y la garantia es hasta el \(garantia)"
    }
}

func calcularCompra(productos: [Producto]) -> Double {
    var sumaProductos = 0.0
    for producto in productos {
        sumaProductos += producto.precio
        
    }
    
    return sumaProductos
}

var producto1 = Producto(nombre: "Zapatillas", precio: 15000.0)
var producto2 = Producto(nombre: "Gafas", precio: 2000.0)

var listaProductos: [Producto] = []
listaProductos.append(producto1)
listaProductos.append(producto2)

print("Total de la compra: \(calcularCompra(productos: listaProductos)) pesos")


//Ejercicio 4
//Sistema de trafico
enum Semaforo {
    case rojo, amarillo, verde

    var accion: String {
        switch self {
        case .rojo :
            return("Detente")
        case .amarillo:
            return("Precaucion")
        case .verde:
            return("Avanza")
        }
    }
}

func recibirSemafor(semaforo: Semaforo) -> String {
    return("El semaforo esta \(semaforo.accion) quedan 30 segundos para que cambie")
}

print(recibirSemafor(semaforo: .rojo))


//Ejercicio 5
//App de calendario

struct Eventos {
    let titulo : String
    let fecha : String
    let esImportante : Bool
}
var evento1 = Eventos(titulo: "TheExperience", fecha: "20/12/2025", esImportante: true)
var evento2 = Eventos(titulo: "Fin de Año", fecha: "31/12/2025", esImportante: true)
var evento3 = Eventos(titulo: "Navidad", fecha: "25/12/2025", esImportante: false)

var listaEventos: [Eventos] = []
listaEventos.append(evento1)
listaEventos.append(evento2)
listaEventos.append(evento3)


var eventosImportantes = listaEventos.filter{$0.esImportante}
print(eventosImportantes.map({$0.titulo}))
print(eventosImportantes.count)
print(listaEventos.sorted{$0.fecha < $1.fecha}.map{$0.fecha})


//Ejercicio 6
//Centro de soporte
enum ClienteError: Error {
    case noEncontrado
}

func buscarCliente(id: Int, en clientes: [Int: String]) throws -> String {
   if let nombreCliente = clientes[id] {
        return nombreCliente
    } else {
        throw ClienteError.noEncontrado
    }
}

do {
    let nombreCliente = try buscarCliente(id: 12345, en: [3223: "Juan Pérez"])
    print("Nombre del cliente: \(nombreCliente)")
} catch {
    switch error {
    case ClienteError.noEncontrado:
        print("Cliente no encontrado.")
    default:
        print("Error inesperado: \(error)")
    }
}


//Ejercicio 7
//Redes Sociales
func filtrarUsuarios(_ usuarios: [String], usando filtro: (String) -> Bool) -> [String] {
    return usuarios.filter(filtro)
}

var usuarios = ["ana", "maría", "julia", "clara", "maria"]

// Filtrar los que empiecen con "a" y tengan más de 5 letras
filtrarUsuarios(usuarios, usando: { $0.lowercased().first == "a" && $0.count > 5 })
    .forEach { print($0) }


