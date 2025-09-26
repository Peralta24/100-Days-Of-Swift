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



