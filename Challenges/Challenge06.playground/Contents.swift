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

//Challenge numero cuatro

//Maquina Expendedero

struct MaquinaExpendedora {
    var inventario : [String : Int]
    
    let precios : [String : Double]
    
    var dineroDepositado : Double = 0.0
    
    mutating func depositarDinero (_ cantidad : Double) {
        dineroDepositado += cantidad
        print("Depositaste la cantidad de $\(cantidad)")
    }
    
    mutating func comprar(producto: String ) -> String {
        
            
        guard let precio = precios[producto] else { return "El producto no existe" }
            
        if dineroDepositado < precio {
            return "Dinero insuficiente"
        }
        
        guard let cantidad = inventario[producto] else {return "Producto Agotado"}
        
        if cantidad <= 0 {
           return "Producto agotado"
        }
        
        inventario[producto] = cantidad - 1
        let cambio = dineroDepositado - precio
        
        dineroDepositado = 0.0
    
        return "\(producto) y tu cambio \(cambio)"

    }
    
}


// 1. Asegúrate de que haya stock al crear la máquina
var miMaquina = MaquinaExpendedora(
    inventario: ["Papas Fritas": 4, "Refresco": 3, "Chocolate": 0], // ¡Ahora hay 5 papas!
    precios: ["Papas Fritas": 1.25, "Refresco": 1.50, "Chocolate": 1.00]
)

print("¡Bienvenido!")

// 2. Simula que el usuario deposita dinero
miMaquina.depositarDinero(1.00)

// 3. Ahora intenta la compra
let resultado = miMaquina.comprar(producto: "Papas Fritas")
print("Resultado: \(resultado)")

// 4. Comprueba el estado final
print("Dinero en la máquina: \(miMaquina.dineroDepositado)")
print("Papas restantes: \(miMaquina.inventario["Papas Fritas"] ?? -1)")

//Ejemplo del Cajero

//El plano del cajero

struct CajeroAutomatico {
    //Varibale para el efectivo que tiene el cajero fisicamente
    var efectivoDisponible : Double
    //Diccionario que simula la base de datos de cuentas bancaciras
    //[NumeroDeCuenta:String]
    var cuentasBancarias : [String : Double]
    
    mutating func retirar (cantidad montoARetirar:Double, deLaCuenta numeroDeCuenta: String) -> String {
        
        guard montoARetirar > 0 else{
            return "Error: La cantidad a retirar debe ser positiva"
        }
        
        guard let saldoActual = cuentasBancarias[numeroDeCuenta] else{
            return "Error: El numero de cuenta no existe"
        }
        
        guard saldoActual >= montoARetirar else{
            let faltante = montoARetirar - saldoActual
            return "Error: Saldo Insuficiente. Te falta \(faltante) para realizar esta operacion"
        }
        
        guard efectivoDisponible >= montoARetirar else{
            return "Error : El cajero no dispone de suficiente efectivo este momento"
        }
        
        cuentasBancarias[numeroDeCuenta] = saldoActual - montoARetirar
        
        efectivoDisponible -= montoARetirar
        
    
        return "Retiro exitoso de \(montoARetirar). Tu nuevo saldo es: \(cuentasBancarias[numeroDeCuenta]!)."
    }
}

// --- CONFIGURACIÓN Y PRUEBAS ---

// Creamos nuestro cajero con $10,000 de efectivo y dos cuentas de prueba
var miCajero = CajeroAutomatico(
    efectivoDisponible: 10000.0,
    cuentasBancarias: ["12345": 500.0, "67890": 2500.0]
)

print("--- Intento 1: Retiro Exitoso ---")
var resultadoC = miCajero.retirar(cantidad: 100.0, deLaCuenta: "12345")
print(resultadoC)
print("Efectivo restante en el cajero: \(miCajero.efectivoDisponible)\n")

print("--- Intento 2: Saldo Insuficiente ---")
resultadoC = miCajero.retirar(cantidad: 500.0, deLaCuenta: "12345") // El saldo ahora es 400
print(resultadoC)
print("Efectivo restante en el cajero: \(miCajero.efectivoDisponible)\n")

print("--- Intento 3: Cuenta No Existe ---")
resultadoC = miCajero.retirar(cantidad: 100.0, deLaCuenta: "00000")
print(resultadoC)

print("--- Intento 4: Cajero sin Fondos ---")
resultadoC = miCajero.retirar(cantidad: 20000.0, deLaCuenta: "67890")
print(resultadoC)
print("Efectivo restante en el cajero: \(miCajero.efectivoDisponible)\n")


//Ejercico

enum Categoria {
    case lacteos, carnes, panaderia, limpieza
}

struct Producto {
    let nombre : String
    let precio : Double
    let categoria : Categoria
}

struct Tienda {
    var catalogo : [String : Producto]
    var inventario : [String : Int]
    var ingresos : Double = 0.0
    
    
    mutating func vender (_ producto: String, cantidad : Int) -> (exito : Bool , mensaje : String){
        guard let productoE = catalogo[producto]else {
            return (false,"Error: El producto no esta en el catalogo")
        }
        
        guard var cantidadActual = inventario[producto] else{
            return (false,"Error: no hay ese producto")
        }
        if cantidadActual < cantidad{
            return (false,"Error: no hay suficientes unidades en stock")
        }
        
        var costoTotalVenta = productoE.precio * Double(cantidad)
        
        ingresos += costoTotalVenta
        
        cantidadActual -= cantidad
        
        inventario[producto] = cantidadActual
        
        return (true,"Venta realiza. Se vendieron \(cantidad) unidades de \(productoE.nombre). Ingreso total: \(costoTotalVenta)")
    }
}
var producto1 = Producto(nombre: "Arrachera", precio: 200, categoria: .carnes)
var tienda1 = Tienda(catalogo: ["arrachera":producto1], inventario: ["arrachera":10])


print(tienda1.vender( "arrachera", cantidad: 5))
print(tienda1.vender( "tacos",cantidad: 10))
print(tienda1.vender("arrachera", cantidad: 20))
print(tienda1.vender( "arrachera", cantidad: 5))
print(tienda1.ingresos)



//Ejercicio Propio Sobre Musica

