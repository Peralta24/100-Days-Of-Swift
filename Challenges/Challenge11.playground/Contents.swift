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


//Ejercicio 8
//App de estadisticas
struct Estadisticas {

    nonisolated(unsafe) static var totalUsuarios: Int = 0
    
    private var usuariosActivos: Int
    

    init(usuariosActivos: Int) {
        self.usuariosActivos = usuariosActivos

        Estadisticas.totalUsuarios += 1
    }
    

    private func calcularPorcentaje() -> Double {
        guard Estadisticas.totalUsuarios > 0 else {
            return 0.0
        }
        
        return (Double(self.usuariosActivos) / Double(Estadisticas.totalUsuarios)) * 100
    }
    

    func obtenerPorcentajeActivos() -> String {
        let porcentaje = calcularPorcentaje()
        return "El porcentaje de usuarios activos es del \(String(format: "%.2f", porcentaje))%."
    }
}
let sesion1 = Estadisticas(usuariosActivos: 5)
print("Después de la sesión 1:")
print("Total de usuarios (estático): \(Estadisticas.totalUsuarios)")
print(sesion1.obtenerPorcentajeActivos())
print("--------------------")

let sesion2 = Estadisticas(usuariosActivos: 8)
print("Después de la sesión 2:")
print("Total de usuarios (estático): \(Estadisticas.totalUsuarios)")
print(sesion2.obtenerPorcentajeActivos())
print("--------------------")

let sesion3 = Estadisticas(usuariosActivos: 12)
print("Después de la sesión 3:")
print("Total de usuarios (estático): \(Estadisticas.totalUsuarios)")
print(sesion3.obtenerPorcentajeActivos())
print("--------------------")


// MiniApp ProfesionalJunior

enum NivelDePrioridad: Int, Comparable {
    case baja = 1
    case media = 2
    case alta = 3
    
    var mensaje: String {
        switch self {
        case .baja:
            return "🟢 Prioridad baja"
        case .media:
            return "🟡 Prioridad media"
        case .alta:
            return "🔴 Prioridad alta"
        }
    }
    
    static func < (lhs: NivelDePrioridad, rhs: NivelDePrioridad) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

struct Tarea {
    let titulo : String
    var descripcion : String?
    var prioridad : NivelDePrioridad
    var completada : Bool = false
    var estadoTarea : String {
        completada ? "✅ Completada" : "🕓 Pendiente"
    }
}

struct GestorDeTareas {
    var tareasCreadas : [Tarea] = []
    
    mutating func agregarTarea(tarea: Tarea){
        if !tareasCreadas.contains(where: { $0.titulo == tarea.titulo }) {
            tareasCreadas.append(tarea)
            print("🆕 Tarea '\(tarea.titulo)' agregada con éxito.\n")
        } else {
            print("⚠️ La tarea '\(tarea.titulo)' ya existe.\n")
        }
    }
    
    mutating func marcarComoCompletado(tarea : Tarea){
        if let index = tareasCreadas.firstIndex(where: { $0.titulo == tarea.titulo }) {
            tareasCreadas[index].completada = true
            print("✅ '\(tarea.titulo)' marcada como completada.\n")
        } else {
            print("❌ No se encontró la tarea '\(tarea.titulo)'.\n")
        }
    }
    
    func mostrarInformacion(){
        print("📋 LISTA DE TAREAS:\n")
        for tarea in tareasCreadas {
            print("• Título: \(tarea.titulo)")
            print("  \(tarea.prioridad.mensaje)")
            print("  Estado: \(tarea.estadoTarea)\n")
        }
        print("-------------------------------\n")
    }
    
    func mostrarPendientes(){
        print("🕓 TAREAS PENDIENTES:\n")
        let pendientes = tareasCreadas.filter { !$0.completada }
        if pendientes.isEmpty {
            print("🎉 No hay tareas pendientes.\n")
        } else {
            for tarea in pendientes {
                print("• \(tarea.titulo) (\(tarea.prioridad.mensaje))")
            }
            print("")
        }
    }
    
    mutating func eliminarTareasCompletadas(){
        let eliminadas = tareasCreadas.filter { $0.completada }
        tareasCreadas.removeAll(where: { $0.completada })
        if eliminadas.isEmpty {
            print("⚠️ No había tareas completadas para eliminar.\n")
        } else {
            print("🗑️ Se eliminaron \(eliminadas.count) tarea(s) completada(s).\n")
        }
    }
    
    mutating func ordenarTareasSegunPrioridad() {
        tareasCreadas.sort { $0.prioridad > $1.prioridad }
        print("📊 Tareas ordenadas por prioridad (de alta a baja):")
        for tarea in tareasCreadas {
            print("• \(tarea.titulo) - \(tarea.prioridad.mensaje)")
        }
        print("")
    }
    
    func mostrarCompletasYNo() {
        print("📌 ESTADO GENERAL DE TAREAS:\n")
        for tarea in tareasCreadas {
            if tarea.completada {
                print("✅ \(tarea.titulo) — \(tarea.prioridad.mensaje)")
            } else {
                print("🕓 \(tarea.titulo) — \(tarea.prioridad.mensaje)")
            }
        }
        print("")
    }
    
    func buscarTareaPorTitulo(titulo: String){
        if tareasCreadas.contains(where: { $0.titulo == titulo }){
            print("Tarea : \(titulo)")
        }else {
            print("No se encontro la tarea")
        }
    }
}


// Ejemplo de uso
var tarea1 = Tarea(titulo: "Estudiar Swift", prioridad: .alta)
var tarea2 = Tarea(titulo: "Pasear el perro", prioridad: .baja)
var tarea3 = Tarea(titulo: "Arreglar la habitación", prioridad: .media)

var gestorTareas = GestorDeTareas()

gestorTareas.agregarTarea(tarea: tarea1)
gestorTareas.agregarTarea(tarea: tarea2)
gestorTareas.agregarTarea(tarea: tarea3)

gestorTareas.mostrarInformacion()

gestorTareas.marcarComoCompletado(tarea: tarea2)
gestorTareas.mostrarPendientes()
gestorTareas.mostrarInformacion()

gestorTareas.mostrarCompletasYNo()
gestorTareas.eliminarTareasCompletadas()
gestorTareas.mostrarCompletasYNo()
gestorTareas.ordenarTareasSegunPrioridad()

gestorTareas.buscarTareaPorTitulo(titulo: "Estudiar Swiftdd")









class Contador {
    var numero = 0
}

var n1 = Contador()
n1.numero = 10
var n2 = Contador()
n2.numero = 20
var n3 = Contador()
n3.numero = 30

print(n1.numero) 
print(n2.numero) 
print(n3.numero)
