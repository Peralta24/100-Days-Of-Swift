import UIKit

//Challengue's numero 09

var peliculas = [String]()
peliculas.append("Harry Potter")
peliculas.append("Star Wars")
peliculas.append("Iron Man")

var diccionarioPeliculas = [String : Int]()
var directoresPeliculas: Set<String> = []

diccionarioPeliculas[peliculas[0]] = 2001
diccionarioPeliculas[peliculas[1]] = 1977
diccionarioPeliculas[peliculas[2]] = 2008

directoresPeliculas.insert("Chris Columbus")
directoresPeliculas.insert("George Lucas")
directoresPeliculas.insert("Jon Favreau")
directoresPeliculas.insert("George Lucas")


print("Una de mis peliculas favoritas es \(peliculas[0]), que se estreno en \(diccionarioPeliculas[peliculas[0],default: 0])")

//Challenge 2 :FizzBuzz Clasico
print("Challenge 2 : FizzBuzz Clasico")
for i in 1...100{
    
    if i % 3 == 0 && i % 5 == 0{
        print("\(i)  = FizzBuz")
    }else if i % 3 == 0{
        print( "\(i) = Fizz")
    }else if i % 5 == 0{
        print("\(i) = Buzz")
    }else{
        print(i)
    }
}


//Challenge 3 : La calculadora de Raices Segura
print("Challenge 3 : La calculadora de Raices Segura")

enum CalculadorError : Error {
    case numeroNegativo
}

func calcularRaizCuadrada(delNumero : Double) throws -> Double {
    if delNumero < 0 {
        print("Error! No se puede ingresar numero negativo")
        throw CalculadorError.numeroNegativo
    }
    return sqrt(delNumero)
}

do {
    print(try calcularRaizCuadrada(delNumero: 25))
    print(try calcularRaizCuadrada(delNumero: 2))
}catch CalculadorError.numeroNegativo{

}

//Challenge 4 : El Super Ordenador de Arreglos

print("Challenge 4 : El Super Ordenador de Arreglos")

func ordenarInteligentemente(arreglo1 : [String] , ordenar : (String,String) -> Bool) -> [String]{
    
    
    return arreglo1.sorted(by: ordenar)
    
}
var nombres = ["Xana", "Jose", "Rafael", "Victor", "Ricardo", "Abraham"]
nombres = ordenarInteligentemente(arreglo1: nombres, ordenar: {$0 < $1})
print(nombres)
nombres = ordenarInteligentemente(arreglo1: nombres, ordenar: {
    $0.count < $1.count
})
print(nombres)

//Challenge 5 : El Simulador de Coche

print("Challenge 5 : El Simulador de Coche")

struct Coche {
    let modelo : String
    let numeroDeAsientos : Int
    private(set) var cambioActual : Int = 0 {
        didSet{
            print("La marcha cambio a \(cambioActual).")
        }
    }
    
    var descripcion : String {
        return "\(modelo) con \(numeroDeAsientos) asientos. Actualmente el cambio es \(cambioActual)."
    }
    
    
    mutating func subirCambio(){
        if cambioActual < 6 {
                cambioActual += 1
            } else {
                print("El cambio no puede ser mayor a 6")
            }
    }
    
    mutating func bajarCambio(){
        if cambioActual > 0 {
            cambioActual -= 1
        } else {
            print("Ya estás en neutral, no puedes bajar más el cambio.")
        }
    }
}

var coche1 = Coche(modelo: "Rav4", numeroDeAsientos: 5)
print(coche1.descripcion)
coche1.subirCambio()
coche1.subirCambio()
coche1.subirCambio()
coche1.subirCambio()
coche1.subirCambio()
coche1.subirCambio()
coche1.subirCambio()
coche1.bajarCambio()

//Challenge 09 mas dificil


//Challenge 1.1 : El Registo de Calificaciones

print("Challenge 1.1 : El Registro de Calificaciones")

var calificacionesDiccionario: [String : [String : Double]] = [
    "Juan Pérez": ["Matemáticas": 4.3, "Historia": 4.5, "Ciencias": 1.0],
    "Ana García": ["Matemáticas": 4.6, "Historia": 5.5, "Ciencias": 2.0],
    "Luis Fernández": ["Matemáticas": 4.1, "Historia": 2.5, "Ciencias": 3.0]
]
var mejorAlumno = ""
var mejorPromedio = 0.0
for (alumno, calificaciones) in calificacionesDiccionario {
    print("\nCalificaciones de \(alumno):")
    
    for (materia, nota) in calificaciones {
        print("\(materia): \(nota)")
    }
    
    let promedio = calificaciones.values.reduce(0, +) / Double(calificaciones.count)
    print("Promedio: \(promedio)")
    
    if promedio > mejorPromedio{
        mejorPromedio = promedio
        mejorAlumno = alumno
    }
    
}


print("El alumno con mejor promedio es \(mejorAlumno) con \(mejorPromedio)")


//Challenge 2.1  Validador de Contrasenia Avanzado
enum ErrorDeContrasenia : Error {
    case demasiadaCorta
    case sinMayuscula
    case sinNumero
    
    var mensaje : String {
        switch self {
        case .demasiadaCorta:
            return "Contrasenia demasiado corta!"
        case .sinMayuscula:
            return "La contrasenia debe contener al menos una mayuscula"
        case .sinNumero:
            return "La contrasenia debe contener al menos un numero"
        }
    }
}

func validarContrasenia(_ password: String) throws -> Bool {
    if password.count < 8 {
        throw ErrorDeContrasenia.demasiadaCorta
    }
    
    if password.range(of: "[A-Z]", options: .regularExpression) == nil {
        throw ErrorDeContrasenia.sinMayuscula
    }
    
    if password.range(of: "\\d", options: .regularExpression) == nil {
        throw ErrorDeContrasenia.sinNumero
    }
    
    return true
}

do {
    try validarContrasenia("abc123asdAsdasda")
    print("Contrasenia valida")
}catch let error as ErrorDeContrasenia {
    print(error.mensaje)
}catch {
    print("Error desconocido")
}


//Challenge 3.1

struct Producto {
    let nombre : String
    let id : Int
    var cantidadEnStock : Int
    var precio : Double
    static var ultimoId = 0

    init(nombre: String, id: Int, cantidadEnStock: Int, precio: Double) {
        self.nombre = nombre
        self.id = id
        self.cantidadEnStock = cantidadEnStock
        self.precio = precio
        Producto.ultimoId += 1
    }
    
    mutating func agregarStock(cantidad : Int) {
        cantidadEnStock += cantidad
    }
    mutating func quitarStock(cantidad : Int) {
        if cantidadEnStock <= 0 {
            print("No hay cantidad")
        }else{
            cantidadEnStock -= cantidad
        }
    }
}

struct Inventario {
    private var productos : [Producto] = []
    
    var valorTotalDelInventario : Double {
        return productos.reduce(0) { $0 + $1.precio * Double($1.cantidadEnStock) }
    }
    
    mutating func agregarProducto(_ producto : Producto) {
        productos.append(producto)
    }
    
    func buscarProductos(conFiltro filtro: (Producto) -> Bool) -> [Producto] {
        return productos.filter(filtro)
    }
    
}

var inventario1 = Inventario()
var producto1 = Producto(nombre: "Arroz", id: Producto.ultimoId, cantidadEnStock: 7, precio: 60)
var producto2 = Producto(nombre: "Avena", id: Producto.ultimoId, cantidadEnStock: 20, precio: 30)
var producto3 = Producto(nombre: "Frijoles", id: Producto.ultimoId, cantidadEnStock: 4, precio: 55)

inventario1.agregarProducto(producto1)
inventario1.agregarProducto(producto2)
inventario1.agregarProducto(producto3)

print("Valor total del inventario: \(inventario1.valorTotalDelInventario)")

let productosCaros = inventario1.buscarProductos(conFiltro: {$0.precio > 50})
print("Productos caros", productosCaros.map{$0.nombre})
let stockProductos = inventario1.buscarProductos(conFiltro: {$0.cantidadEnStock < 10})
print("Stock Productos",stockProductos.map({$0.nombre}))
