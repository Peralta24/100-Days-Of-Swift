import UIKit

//Dia 11 de 100 dias con Swift

struct BankAccount {
    
    private var funds = 0
    
    mutating func deposit(_ amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(_ amount: Int) -> Bool {
        if amount >= funds {
            funds -= amount
            return true
        }else{
            return false
        }
    }
}

var account = BankAccount()
account.deposit(100)
let succes = account.withdraw(200)

if succes {
    print("Withdrew money succesfully")
}else{
    print("Failed to get the money")
}

//Propiedades y metodos estaticos

struct School {
    nonisolated(unsafe) static var studentCount = 0
    
    static func add (student : String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}
School.add(student: "Taylor Swift")
School.add(student: "Ed Sheeran")
print("Total students: \(School.studentCount)")

//Usar propiedas staticas parea organizar datos comunes en mis aplicaciones
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFileName = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

print(AppData.version)
print(AppData.saveFileName)
print(AppData.homeURL)


//Crear ejemplos de mis estructuras con static

struct EmEmployee {
    let username : String
    let password : String
    
    static let example = EmEmployee(username: "Jim1Poggers", password: "A0r1GLn4IP45sW0RD")
}

print(EmEmployee.example)

struct Unwrap {
    static let appURL = "https://itunes.apple.com/app/id1440611372"
    nonisolated(unsafe)static var entropy = Int.random(in: 1...1000)

    static func getEntropy() -> Int {
        entropy += 1   // ✅ se puede modificar porque entropy es var
        return entropy
    }
}

Unwrap.getEntropy()

struct LegoBrick {
    nonisolated(unsafe)static var numberMade = 0
    var shape : String
    var color : String
    init(shape : String, color: String){
        self.shape = shape
        self.color = color
        LegoBrick.numberMade += 1
    }
}

//Chekpoint 6


struct Car {

    let model: String
    let numberOfSeats: Int

    // Se puede leer desde fuera, pero solo se puede modificar desde dentro
    // de la estructura, gracias a private(set).
    private(set) var currentGear: Int = 1

    // Método para cambiar de marcha (hacia arriba o hacia abajo).
    // Es 'mutating' porque modifica 'currentGear'.
    mutating func changeGear(to newGear: Int) {
        // Validamos la nueva marcha antes de asignarla.
        if newGear >= 1 && newGear <= 10 {
            currentGear = newGear
            print("Cambio de marcha exitoso. Marcha actual: \(currentGear)")
        } else {
            print("Error: La marcha \(newGear) no es válida. Debe estar entre 1 y 10.")
        }
    }
    
    mutating func gearUp() {
        // Reutilizamos la lógica de changeGear para no repetir código
        changeGear(to: currentGear + 1)
    }

    mutating func gearDown() {
        changeGear(to: currentGear - 1)
    }
}

// --- Uso ---
var car1 = Car(model: "Rav4", numberOfSeats: 5)

print("Coche creado: \(car1.model) con \(car1.numberOfSeats) asientos.")
print("Marcha inicial: \(car1.currentGear)")

car1.gearUp()
car1.gearUp()
car1.gearDown()


car1.changeGear(to: 11)
car1.changeGear(to: 0)

print("Marcha final: \(car1.currentGear)")


//Ejercicios de practica


//MiniProyecto 1 : Biblioteca Personal

struct Libro {
    let titulo : String
    let autor : String
    let paginasTotales : Int
    var paginaActual : Int = 0 {
        didSet {
            if paginaActual > paginasTotales {
                paginaActual = paginasTotales
            }
            if paginaActual < 1 {
                paginaActual = 1
            }
            print("Has avanzado a la pagina \(paginaActual) Progeso : \(progreso)")
        }
    }
    
    var progreso: Double {
        guard paginasTotales > 0 else { return 0.0 }
        return Double(paginaActual) / Double(paginasTotales)
    }

    mutating func avanzarPagina(paginas : Int) {
        guard paginas > 0 else { return }
        paginaActual += paginas
    }
    
    
    init(titulo: String, autor: String, paginasTotales: Int) {
        self.titulo = titulo
        self.autor = autor
        if paginasTotales > 0{
            self.paginasTotales = paginasTotales
        }else{
            self.paginasTotales = 1
            print("Ingresa una opcion valida")
        }
    }
}


var miLibro = Libro(titulo: "El Nombre del Viento", autor: "Patrick Rothfuss", paginasTotales: 662)
miLibro.avanzarPagina(paginas: 100)
print(miLibro.progreso)
miLibro.avanzarPagina(paginas: 600)


//MiniProyecto2 2 : Registro de Ejercicio

enum TipoDeActividad  {
    case correr
    case caminar
    case pesas
    case yoga
}

struct Actividad: Equatable {
    let tipo: TipoDeActividad
    let duracionEnMinutos: Int
    let caloriasQuemadas: Int
    var completada: Bool = false {
        didSet {
            if completada {
                print("Has completado tu actividad con éxito ✅")
            } else {
                print("Actividad marcada como no completada ❌")
            }
        }
    }
    
    mutating func marcarComoCompletada() {
        if !completada {
            completada = true
            print("Actividad completada correctamente 🎉")
        } else {
            print("Actividad ya estaba completada")
        }
    }
}

struct RegistroDiario {
    private var actividades : [Actividad] = []
    
    var totalCaloriasQuemadasdia : Int {
        var sumaTotal = 0
        for actividad in actividades {
            sumaTotal += actividad.caloriasQuemadas
        }
        return sumaTotal
    }
    
    var totalMinutos : Int {
        var sumaTotalMinutos = 0
        for actividad in actividades {
            sumaTotalMinutos += actividad.duracionEnMinutos
        }
        return sumaTotalMinutos
    }
    var resumenDelDia : String {
        return "Hoy has entrenado un total de \(totalMinutos) minutos  y has quemado \(totalCaloriasQuemadasdia) calorias"
    }
    
    mutating func agregar(actividad: Actividad) {
        actividades.append(actividad)
    }
    
    mutating func reiniciarDia(){
        actividades.removeAll()
    }
    func imprimirActividades () {
        print("Las actividad a hacer son")
        for actividade in actividades {
            print(actividade.tipo)
        }
    }
    

    
}
var registroDeHoy = RegistroDiario()
var carrera = Actividad(tipo: .correr, duracionEnMinutos: 30, caloriasQuemadas: 300)
let pesas = Actividad(tipo: .pesas, duracionEnMinutos: 45, caloriasQuemadas: 250)

registroDeHoy.agregar(actividad: carrera)
registroDeHoy.agregar(actividad: pesas)

print(registroDeHoy.resumenDelDia)
registroDeHoy.imprimirActividades()
carrera.marcarComoCompletada()

//Mini Proyecto 3 : Configuracion de App

struct ConfiguracionApp {
    
    static let nombreApp : String = "Mi App Increible"
    static let versionApp : String = "1.0.2"
    static let apiUrl : String = "https://api.example.com"
    
    private init() { }

    
    nonisolated(unsafe) static var temaActual : String = "claro"{
        didSet {
            print("El tema de la app ha cambiado a \(temaActual)")
        }
    }
    
    nonisolated(unsafe) private(set) static var sesionesIniciadas: Int = 0
    
    
    static func iniciarNuevaSesion() {
        sesionesIniciadas += 1
    }
    static func mostrarInformacionApp() {
        print("Nombre de la app: \(nombreApp)")
        print("Version de la app: \(versionApp)")
        print("URL de la API: \(apiUrl)")
        print("Tema actual: \(temaActual)")
        print("Número de sesiones iniciadas: \(sesionesIniciadas)")
    }
}

print("Bienvenido a \(ConfiguracionApp.nombreApp)")
ConfiguracionApp.iniciarNuevaSesion()
ConfiguracionApp.iniciarNuevaSesion()

ConfiguracionApp.mostrarInformacionApp()
ConfiguracionApp.temaActual = "oscuro"

