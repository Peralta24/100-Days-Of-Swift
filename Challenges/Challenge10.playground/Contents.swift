import UIKit

//Challenge 10

//Ejercicio 1: Registro basico de empleados
struct Empleado {
    let nombre : String
    let id : Int
    let puesto : String
    var salarioAnual : Double
    
    
    var salarioMensual : Double {
        salarioAnual / 12
    }
}

let rafael = Empleado(nombre: "Rafael", id: 2021391, puesto: "Desarollador iOS", salarioAnual: 200_000)
let xana = Empleado(nombre: "Xana", id: 2022131, puesto: "Gestor de Administración", salarioAnual: 300_99)
let ricardo = Empleado(nombre: "Ricardo", id: 20192131, puesto: "Administrador de Carga", salarioAnual: 200_0)
var equipo = [Empleado]()
equipo.append(rafael)
equipo.append(xana)
equipo.append(ricardo)

func imprimirSalario(empleados : [Empleado]){
    for empleado in empleados {
        var mensaje = "\(empleado.nombre) (\(empleado.id)), Puesto: \(empleado.puesto), Salario Mensual: $\(String(format: "%.2f", empleado.salarioMensual))"
        
        if empleado.salarioAnual > 50_000 {
            mensaje += " Empleado con bono"
        }
        
        print(mensaje)
    }
}

imprimirSalario(empleados: equipo)

//Ejercicio 2: Sistema de Calificaciones Escolares

enum Materia {
    case matematicas
    case historia
    case ciencias
    case literatura
}

class Estudiante {
    let nombre : String
    private var calificaciones : [Materia : Double] = [:]
    nonisolated(unsafe) static var totalEstudiantes : Int = 0
    
    
    init(nombre : String) {
        self.nombre = nombre
        Estudiante.totalEstudiantes += 1
    }
    
    func agregarCalificacion(materia : Materia, calificacion : Double = 10) {
        calificaciones[materia] = calificacion
    }
    func obtenerPromedio() -> Double {
        guard !calificaciones.isEmpty else {
            return 0.0
        }

        let sumaTotal = calificaciones.values.reduce(0, +)
        return sumaTotal / Double(calificaciones.count)
    }
}
var rafaelE = Estudiante(nombre: "Rafael")
var xanaE = Estudiante(nombre: "Xana")
var victorE = Estudiante(nombre: "Victor")
var ricardoE = Estudiante(nombre: "Ricardo")
rafaelE.agregarCalificacion(materia: .matematicas,calificacion: 9.0)
rafaelE.agregarCalificacion(materia: .historia,calificacion: 6.0)
rafaelE.agregarCalificacion(materia: .ciencias,calificacion: 7.0)

xanaE.agregarCalificacion(materia: .matematicas)
xanaE.agregarCalificacion(materia: .historia)
xanaE.agregarCalificacion(materia: .ciencias)

victorE.agregarCalificacion(materia: .matematicas,calificacion: 6.0)
victorE.agregarCalificacion(materia: .historia,calificacion: 7.4)
victorE.agregarCalificacion(materia: .ciencias)

ricardoE.agregarCalificacion(materia: .matematicas,calificacion: 6.9)
ricardoE.agregarCalificacion(materia: .historia,calificacion: 7.1)
ricardoE.agregarCalificacion(materia: .ciencias,calificacion: 9.2)

var estudiantes : [Estudiante] = []
estudiantes.append(rafaelE)
estudiantes.append(xanaE)
estudiantes.append(victorE)
estudiantes.append(ricardoE)

let ordenados = estudiantes.sorted { $0.nombre < $1.nombre }
for ordenado in ordenados {
    print("\(ordenado.nombre) su promedio es de: \(ordenado.obtenerPromedio())")
}

print(Estudiante.totalEstudiantes)

//Ejercicio 3: Simulador de Tienda de Videojuegos

class Videojuego {
    let titulo : String
    private(set) var precio : Double
    let genero : String
    
    init(titulo: String, precio: Double, genero: String) {
        self.titulo = titulo
        self.precio = precio
        self.genero = genero
    }
    
    func descripcion() -> String{
        return "Titulo: \(titulo)\nPrecio: \(precio)\nGenero: \(genero)"
    }
}

class JuegoFisico : Videojuego {
    var numeroDeDiscos : Int
    
    init(titulo: String, precio: Double, genero: String, numeroDeDiscos: Int) {
        self.numeroDeDiscos = numeroDeDiscos
        super.init(titulo: titulo, precio: precio, genero: genero)
    }
    
    override func descripcion() -> String {
        var descripcionCompleta = super.descripcion()
        descripcionCompleta += "\nNumero de Discos: \(numeroDeDiscos)"
        return descripcionCompleta
    }
     
}

class JuegoDigital : Videojuego {
    let urlDescarga : String
    
    init(titulo: String, precio: Double, genero: String, urlDescarga: String) {
        self.urlDescarga = urlDescarga
        super.init(titulo: titulo, precio: precio, genero: genero)
    }
    
    override func descripcion() -> String {
        var descripcionCompleta = super.descripcion()
        descripcionCompleta += "\nURL de Descarga: \(urlDescarga)"
        return descripcionCompleta
    }
}
enum ErrorDeVenta : Error{
    case juegoNoEncontrado
    case fondosInsuficientes
    
}
class Tienda {
    
    var inventario : [Videojuego] = [] {
        didSet {
            print("El inventario ha sido actualizado. Ahora hay \(inventario.count) videojuegos en stock.")
        }
    }
    
    func vender(titulo: String,dineroCliente:Double) throws -> Double {
        guard let index = inventario.firstIndex(where: { $0.titulo == titulo }) else {
            print("No existe el Juego")
            throw ErrorDeVenta.juegoNoEncontrado
        }
        let juego = inventario[index]
        
        if inventario.isEmpty {
            print("No hay stock Suficiente de videojuegos 😢")
        }
        if dineroCliente >= juego.precio{
            print("Venta exitosa de \(juego.titulo) por \(juego.precio) 💸")
            inventario.remove(at: index)
            
            let cambio = dineroCliente - juego.precio
            return cambio

        }else {
            print("No cuentas con los fondos suficientes")
            throw ErrorDeVenta.fondosInsuficientes
        }
        
        
    }
    
    
}


var TiendaGamer = Tienda()
var juego1 = Videojuego(titulo: "The Legend of Zelda: Breath of the Wild", precio: 59.99, genero: "Aventura")
var juego2 = Videojuego(titulo: "Super Mario Odyssey", precio: 49.99, genero: "Plataformas")
var juego3 = Videojuego(titulo: "Elden Ring", precio: 69.99, genero: "RPG")
var juego4 = Videojuego(titulo: "Call of Duty: Modern Warfare II", precio: 59.99, genero: "Shooter")
var juego5 = Videojuego(titulo: "Minecraft", precio: 29.99, genero: "Sandbox")
var juego6 = Videojuego(titulo: "FIFA 24", precio: 69.99, genero: "Deportes")
var juego7 = Videojuego(titulo: "Cyberpunk 2077", precio: 39.99, genero: "RPG")
var juego8 = Videojuego(titulo: "Animal Crossing: New Horizons", precio: 49.99, genero: "Simulación")
var juego9 = Videojuego(titulo: "Hollow Knight", precio: 14.99, genero: "Metroidvania")
var juego10 = Videojuego(titulo: "God of War Ragnarök", precio: 69.99, genero: "Acción")
TiendaGamer.inventario.append(contentsOf: [juego1,juego2,juego3,juego4,juego5,juego6,juego7,juego8,juego9,juego10])


do {
    try TiendaGamer.vender(titulo: "The Legend of Zelda: Breath of the Wild", dineroCliente: 100.21)
    try TiendaGamer.vender(titulo: "Minecraft", dineroCliente: 210.0)
}catch ErrorDeVenta.juegoNoEncontrado{
    
}catch ErrorDeVenta.fondosInsuficientes{
    
}
//Test de Conocimiento

