import UIKit

//Dia 10 de 100 dias con Swift

struct Album {
    let title : String
    let artis : String
    let year : Int
    
    func printSummary() {
        print("Album: \(title)")
        print("Artista: \(artis)")
        print("Año: \(year)")
    }
}


var album1 = Album(title: "Thriller", artis: "Michael Jackson", year: 1982)
album1.printSummary()
print(album1.title)
print(album1.artis)



struct Employee {
    let name : String
    var vacationRemaining : Int
    
    mutating func takeVacation(days : Int) {
        if vacationRemaining >= days {
            vacationRemaining -= days
            print("Im goin on vacation")
            print("Days remaining : \(vacationRemaining)")
        }else {
            print("Oops! There arent enough days remaining.")
        }
    }
}
var archer = Employee(name : "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 3)
archer.takeVacation(days: 11)
print(archer.vacationRemaining)

//End   primera leccion

//Test primera leccion 10/12
//Test 2 primera leccion mutating methods 10/12



//Teoria Numero dos

struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}
var archer2 = Employee2(name: "Sterling Archer", vacationAllocated:14)
archer2.vacationTaken += 4
archer2.vacationRemaining = 5
print(archer2.vacationAllocated)



//Como actuar cuando una propiedad cambia
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contact = [String](){
        willSet {
            print("Current value is: \(contact)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contact.count) contacts.")
            print("Old value was: \(oldValue)")
        }
    }
}


var app = App()
app.contact.append("Adian E")
app.contact.append("Allen W")
app.contact.append("Ish S")


//Como crear inicializadores personalizados

struct Player {
    let name : String
    var number : Int {
        willSet {
            print("El numero es \(name)")
            print("El nuevo numero sera \(newValue)")
        }
        
        didSet{
            print("El nuevo numero de \(name) es ")
            print("El antiguo numero de \(name) fue \(oldValue)")
        }
    }
    init(name: String) {
        self.name = name
        self.number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Adian E")
print(player.number)
print(player.number)
player.number
print(player.number)

 
struct Employee3 {
    var name: String
    var yearsActive = 0
}

extension Employee3 {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin = Employee3(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee3()

//Empezar a hacer ejercicios

enum StockError: Error {
    case precioInvalido
    case cantidadInsuficiente(disponible: Int)
    case valorNegativo
    

}
struct Producto {
    let nombre : String
    let precioUnitario : Decimal
    var cantidadEnStock : Int {
        willSet{
            print("Preparando para cambiar el stock de \(nombre) de \(cantidadEnStock) a \(newValue)")
        }
        didSet {
            if cantidadEnStock > oldValue {
                print("Stock de \(nombre) actualizado! Aumento en \(cantidadEnStock - oldValue) unidades")
            }else {
                print("Stock de \(nombre) actualizado! Disminuyo en \(oldValue - cantidadEnStock)")
            }
        }
    }
    
    mutating func agregarProductos (cantidad : Int) throws {
        guard cantidad > 0 else{
            throw StockError.valorNegativo
        }
        cantidadEnStock += cantidad
    }
    mutating func reducirProductos(cantidad : Int) throws {
        guard cantidad > 0 else {
            throw StockError.valorNegativo
        }
        guard cantidadEnStock >= cantidad else {
            throw StockError.cantidadInsuficiente(disponible: self.cantidadEnStock)
        }
        cantidadEnStock -= cantidad
    }
    func imprimirInformacion(){
        print("El nombre del producto es \(nombre)\nel precio es \(precioUnitario)\nel stock es de \(cantidadEnStock)")
    }
    
    var valorTotalEnStock: Decimal {
        get {
            return precioUnitario * Decimal(cantidadEnStock)
        }
        set {
            guard precioUnitario > 0 else {
             print("No se puede ajustar el stock para un producto con precio cero.")
                return
            }
            let nuevoStock = newValue / precioUnitario
            cantidadEnStock = (nuevoStock as NSDecimalNumber).intValue

        }
    }
    
    init(nombre: String, precioUnitario: Decimal) {
        self.nombre = nombre
        self.precioUnitario = precioUnitario
        cantidadEnStock = 0
    }

    
}

extension Producto {
    init(nombre : String, precioUnitario: Decimal, cantidadEnStock: Int) {
        self.nombre = nombre
        self.precioUnitario = precioUnitario
        self.cantidadEnStock = cantidadEnStock
    }
}


var leche = Producto(nombre: "Leche", precioUnitario: 32.5)
var carne = Producto(nombre: "Carne de Cerdo", precioUnitario: 54.3, cantidadEnStock: 20)
print(leche)
do {
    try leche.agregarProductos(cantidad: 20)
    try leche.reducirProductos(cantidad: 20)
}catch StockError.cantidadInsuficiente(let disponible) {
    print("Error no se puede completar la operacion Cantidad disponible \(disponible) ")
}catch {
    print("Ocurrio un error inesperado \(error)")
}
leche.imprimirInformacion()


//Mini Proyecto numero dos

enum CuentaError : Error {
    case montoInvalido
    case saldoInsuficiente(Decimal)
    case cuentaInactiva
}

struct CuentaBancaria {
    let titular: String
    let numeroDeCuenta: String
    var estaActiva : Bool = true
    
    var saldo : Decimal = 0 {
        didSet {
                print("✅ Saldo actualizado. Valor anterior: \(oldValue), Nuevo valor: \(saldo)")
            }
    }
    var descripcion: String {
        return "Cuenta N° \(numeroDeCuenta) de \(titular) con saldo $\(saldo)."
    }
    mutating func depositar(monto: Decimal) throws {
        guard monto > 0 else {
            throw CuentaError.montoInvalido
        }
        guard estaActiva else {
            throw CuentaError.cuentaInactiva
        }
        
        saldo += monto
    }
    
    mutating func retirar(monto: Decimal) throws {
        guard monto > 0 else {
            throw CuentaError.montoInvalido
        }
        guard saldo >= monto else {
            throw CuentaError.saldoInsuficiente(monto)
        }
        guard estaActiva else {
            throw CuentaError.cuentaInactiva
        }
        
        saldo -= monto
    }
    
    init(titular :String, numeroDeCuenta:String) {
        self.titular = titular
        self.numeroDeCuenta = numeroDeCuenta
        
        self.saldo = 0
    }
}

var cuenta1 = CuentaBancaria(titular: "Rafael", numeroDeCuenta: "21131231")
do{
    try cuenta1.depositar(monto: 1000)
    try cuenta1.retirar(monto: 12221)
}catch CuentaError.cuentaInactiva{
    print("Ocurrio un error")
}catch CuentaError.saldoInsuficiente(let disponible) {
    print("No tienes el saldo suficiente tu saldo es \(disponible)")
}catch CuentaError.montoInvalido{
    print("Ingresa un monto valido")
}


print("\n// --- Estado Final de la Cuenta --- //")
print("Saldo final \(cuenta1.saldo)")


//Nuevo Reto
//Mini-Proyecto 3 : Gestor de Tareas

enum Prioridad {
    case alta
    case media
    case baja
}
struct Tarea {
    let descripcion : String
    var completada : Bool = false {
        willSet {
            print("El estado de la tarea cambiara")
            print("Por el nuevo valor \(newValue)")
        }
        didSet{
            print("La tarea cambio de estado era: \(oldValue)")
            print("La tarea cambio de estado a: \(completada)")
        }
    }
    var prioridad : Prioridad {
        willSet{
            print("La prioridad de \(descripcion) cambiara a \(newValue)")
        }
        didSet{
            print("La propiedad de \(descripcion) se cambio de \(oldValue) a \(prioridad)")
        }
    }
    var cantidadDeTareasCompletadas = [Int]()
    mutating func completarTarea() {
        if completada {
            print("La tarea ya esta completada")
        }else{
            completada = true
            print("Tarea completa con exito!")
            cantidadDeTareasCompletadas += [1]
        }
    }
    
}
struct GestorDeTareas {
    var tareas = [Tarea]()
    
    mutating func agregarTarea(tarea : Tarea) {
        if tareas.contains(where: { $0.descripcion == tarea.descripcion }) {
            print("La tarea ya fue agregada el gestor de tareas")
        }else{
            tareas.append(tarea)
        }
    }
    mutating func eliminarTarea(enIndice: Int) {
        if tareas.indices.contains(enIndice) {
            tareas.remove(at: enIndice)
            print("Tarea removida con exito de la lista\nlista actual \(tareas)")
        }else{
            print("No se encontro la tarea en esa posicion")
        }
    }
    mutating func cambiarPrioridad(deTarea descripcion: String, a nuevaPrioridad: Prioridad) {
        for i in 0..<tareas.count {
            if tareas[i].descripcion.uppercased() == descripcion.uppercased() {
                print("La tarea fue encontrada")
                tareas[i].prioridad = nuevaPrioridad
                return
            }
        }
        print("La tarea no fue encontrada")
    }

    
    func buscarTarea(porDescripcion descripcion: String) -> Tarea? {
        for tarea in tareas {
            if tarea.descripcion.uppercased() == descripcion.uppercased() {
                print("La tarea fue encontrada!")
                return tarea
            }
            
        }
        return nil
    }
    
    func mostrarTareas(){
        for tarea in tareas {
            print("Tarea: \(tarea.descripcion)")
        }
    }
}
var tarea1 = Tarea(descripcion: "Estudiar Swift", prioridad: .baja)
var tarea2 = Tarea(descripcion: "Practicar Swift", prioridad: .alta)
var gestorDeTareas = GestorDeTareas()
gestorDeTareas.agregarTarea(tarea: tarea1)
gestorDeTareas.agregarTarea(tarea: tarea2)
gestorDeTareas.mostrarTareas()
gestorDeTareas.buscarTarea(porDescripcion: "PracTicar Swift")
gestorDeTareas.eliminarTarea(enIndice: 0)
gestorDeTareas.mostrarTareas()
gestorDeTareas.cambiarPrioridad(deTarea: "Practicar Swift", a: .media)


