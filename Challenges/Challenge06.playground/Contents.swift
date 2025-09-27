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
