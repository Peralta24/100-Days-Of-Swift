import UIKit

//Challenge numero 05

struct Deposito {
    let dia : Int
    let cantidad : Double
    var recibiBonifiacion : Bool = false
    
    //Metodo para calcular el total del deposito
    func totalDeposito() -> Double {
        if recibiBonifiacion {
            return cantidad * 1.10
        }else {
            return cantidad

        }
    }
    
    
    //Un metodo para aplicar la bonificacion
    mutating func aplicarBonificacion(){
        recibiBonifiacion.toggle()
    }
}

var planDeAhorro = [
    Deposito(dia: 2, cantidad: 150.0),
    Deposito(dia: 5, cantidad: 200.50),
    Deposito(dia: 8, cantidad: 75.0),
    Deposito(dia: 12, cantidad: 300.0),
    Deposito(dia: 15, cantidad: 120.25),
    Deposito(dia: 21, cantidad: 250.0),
    Deposito(dia: 28, cantidad: 50.75)
]

print("Procesando \(planDeAhorro.count) depositos en el plan de ahorro...")
var totalDeBonifiaciones = 0
var totalBase = 0.0
var totalBonificacion = 0.0
for i in planDeAhorro.indices{
    var numeroAleatorio = Int.random(in: 1...5)
    if numeroAleatorio > 2 {
        planDeAhorro[i].aplicarBonificacion()
        totalDeBonifiaciones = totalDeBonifiaciones + 1
        print("Dia \(planDeAhorro[i].dia): Depositaste $\(planDeAhorro[i].cantidad) Recipe la Bonificacion! -> Total $\(planDeAhorro[i].totalDeposito())")
    }else{
        print("Dia \(planDeAhorro[i].dia): Depositaste $\(planDeAhorro[i].cantidad)")

    }
    
    totalBase += planDeAhorro[i].cantidad
    totalBonificacion += planDeAhorro[i].totalDeposito()

}

print("Reporte Final :")

print("Total Base: \(totalBase)")
print("Total Bonificacion: \(totalBonificacion)")
print("Total de Bonificaciones aplicadas : \(totalDeBonifiaciones)")


switch totalBonificacion {
case ..<500 :
    print("Nivel de Ahorrador : Ahorrador Inicial")
case 500...1000 :
    print("Nivel de Ahorrador : Ahorrador Constante")
case 1000...:
    print( "Nivel de Ahorrador : Ahorrador Comprometido")
default :
    print("Nivel de Ahorrador : No se encontro categoria")

}


print("Ejercicio numero 2")
//Challenge Number 2 of Challenge 05

//Gestor de Inventario De Heroe

struct Objeto {
    let nombre : String
    let tipo : String
    let valorEnOro : Double
    var cantidad: Int
    let esMagico : Bool
    
    //Un metodo para simular la ventana de una unidad
    mutating func venderUnaUnidad() {
        if cantidad > 0 {
            cantidad -= 1
        }
    }
}

var inventario = [
    Objeto(nombre: "Espada de Acero", tipo: "Arma", valorEnOro: 150.0, cantidad: 1, esMagico: false),
    Objeto(nombre: "Poción de Vida Menor", tipo: "Poción", valorEnOro: 20.0, cantidad: 10, esMagico: true),
    Objeto(nombre: "Escudo de Roble", tipo: "Armadura", valorEnOro: 80.0, cantidad: 1, esMagico: false),
    Objeto(nombre: "Anillo de Agilidad", tipo: "Joya", valorEnOro: 500.0, cantidad: 1, esMagico: true),
    Objeto(nombre: "Daga Élfica", tipo: "Arma", valorEnOro: 350.0, cantidad: 1, esMagico: true),
    Objeto(nombre: "Elixir Mayor", tipo: "Poción", valorEnOro: 100.0, cantidad: 3, esMagico: true)
]

var oroGanadoEnLaVisita = 0.0
var objetosMagiocsInventarioRestante = 0
var totalRestoInventartio = 0.0
var valorMonton = 0.0
for i in inventario.indices{
    var interesMercader = Int.random(in: 1...10)
    
    if interesMercader > 5 {
        inventario[i].venderUnaUnidad()
        oroGanadoEnLaVisita = oroGanadoEnLaVisita + inventario[i].valorEnOro
        print(" - \(inventario[i].nombre): Venta Exitosa! Se vendio una unidad por \(inventario[i].valorEnOro) quedan \(inventario[i].cantidad)")
    }else {
        print(" - \(inventario[i].nombre): El mercader no esta interesado")
        
    }
    valorMonton = Double(inventario[i].cantidad) * inventario[i].valorEnOro
    totalRestoInventartio += valorMonton
    
}
for j in inventario.indices {
    
    if inventario[j].esMagico == true && inventario[j].cantidad > 0 {
        objetosMagiocsInventarioRestante += 1
    }
}


print("----------------------------------------------------------")

print("Reporte de Riqueza del Heroe")
print(" - Oro ganado en esta visita : \(oroGanadoEnLaVisita) de oro.")
print(" - Valor total del inventario restante : \(totalRestoInventartio) de oro")
print(" - Objetos magicos restantes del inventario : \(objetosMagiocsInventarioRestante)")
switch totalRestoInventartio {
case 0...500:
    print("Clasificacion de Riqueza : Heroe sin dinero")

case 500...1000 :
    print("Clasificacion de Riqueza : Heroe con dinero")
case 1000...:
    print("Clasificacion de Riqueza : Heroe Adinerado")
default:
    print("Cantidad no contemplada")
}

