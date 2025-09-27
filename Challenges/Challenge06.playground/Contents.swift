import UIKit

//Challenge numero 08

enum CalidadServicio : Double {
    case excelente = 0.20
    case buena = 0.10
    case regular = 0.05
    case mala = 0.00
}

struct Cuenta {
    let totalCuenta : Double
    let numeroPersonas : Int
    var calidadServicio : CalidadServicio
    
    //Metodo para cacular la propina y el total por persona
    func calcularPropinaYTotalPorPersona() -> (propina : Double, totalPorPersona : Double) {
        let propina : Double = totalCuenta * calidadServicio.rawValue
        let totalPorPersona : Double = (totalCuenta + propina) / Double(numeroPersonas)
        return (propina, totalPorPersona)
    }
    mutating func cambiarCalidadServicio(_ calidadServicio : CalidadServicio) {
        self.calidadServicio = calidadServicio
    }
}

var cuentas = Array<Cuenta>()

cuentas.append(Cuenta(totalCuenta: 120, numeroPersonas: 4, calidadServicio: .excelente))
cuentas.append(Cuenta(totalCuenta: 200, numeroPersonas: 2, calidadServicio: .mala))


print ("----------- Calculadora de Propinas -----------")

for i in cuentas.indices {
    print("Cuenta : ")
    print()
    print("Cuenta Original : $\(cuentas[i].totalCuenta), \(cuentas[i].numeroPersonas) personas, Calidad del servicio : \(cuentas[i].calidadServicio)")
    
    var resultado = cuentas[i].calcularPropinaYTotalPorPersona()

    print("Resultados: ")
    print("Propina Total \(resultado.propina)")
    print("Total por persona (incluyendo propina): \(resultado.totalPorPersona)")
    
    print("--Cambiando calidad de servicio a Regular --")
    
    cuentas[i].cambiarCalidadServicio(.regular)
    resultado = cuentas[i].calcularPropinaYTotalPorPersona()
    print("--- Resultados con calidad de servicio regular ---")

    print("Resultados: ")
    print("Propina Total \(resultado.propina)")
    print("Total por persona (incluyendo propina): \(resultado.totalPorPersona)")
    
    print("Gracias por usar el sistema")
    
    print()
}


//challenge numero dos

struct Tarea {
    let titulo : String
    var completada : Bool
    let fechaCreacion : String

    mutating func alternarEstado() {
        completada.toggle()
    }
}


struct GestorDeTareas {
    var listaTareas : [Tarea] = []
    
    mutating func agregar(_ titulo : String){
        let nuevaTarea = Tarea(titulo: titulo, completada: false, fechaCreacion: "2025-09-27")
           listaTareas.append(nuevaTarea)
    }
    
    func mostrarTareasPendientes() -> String {
        var resultado = ""
        for tarea in listaTareas {
           
            if !tarea.completada {
                resultado += "Tarea pendiente : \(tarea.titulo)\n"
            }
        }
        if resultado.isEmpty {
            return "No hay tareas pendientes"
        }
        
        return resultado
    }
}


var gestor = GestorDeTareas()

gestor.agregar("Estudiar Swift")
gestor.agregar("Comprar víveres")
gestor.agregar("Hacer ejercicio")

if gestor.listaTareas.count > 1 {
    gestor.listaTareas[1].alternarEstado()
}

print("--Mis tareas pendientes--")
print(gestor.mostrarTareasPendientes())


//Challenge numero tres
enum TipoDado : Int {
    case d4 = 4
    case d6 = 6
    case d8 = 8
    case d10 = 10
    case d12 = 12
    case d20 = 20
}


struct Jugador {
    let nombre : String
    var puntuacionRonda : Int = 0
    
    //Metodo para lanzar un daodo
    mutating func lanzarDados(dado1 : TipoDado , dado2 :TipoDado){
        var numeroRandom1 = Int.random(in: 1...dado1.rawValue)
        var numeroRandom2 = Int.random(in: 1...dado2.rawValue)
       
        puntuacionRonda = numeroRandom1 + numeroRandom2
        print("Lanza \(dado1),\(dado2) y obtuvo puntuacion de \(puntuacionRonda)")
    }
}


var judadores = Array<Jugador>()

var jugador1 = Jugador(nombre: "Jose")
var jugador2 = Jugador(nombre: "Xana")
var jugador3 = Jugador(nombre: "Angel")
judadores.append(jugador1)
judadores.append(jugador2)
judadores.append(jugador3)

for i in judadores.indices {
    judadores[i].lanzarDados(dado1: .d20, dado2: .d4)
    print("Puntuacion de ronda de \(judadores[i].nombre) es de \(judadores[i].puntuacionRonda)")
    
}
var puntuacionMasAlta = 0
var nombreDelGanador = ""

for judadore in judadores {
    if judadore.puntuacionRonda > puntuacionMasAlta{
        nombreDelGanador = judadore.nombre
        puntuacionMasAlta = judadore.puntuacionRonda
    }
}
print("El jugador ganador es \(nombreDelGanador)")
print("Obtuvo puntuacion mas alta de \(puntuacionMasAlta)")
