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


