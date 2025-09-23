import UIKit

//Challenge numero dos
// Tracker de Gimnasio

print("---Tracker de Gimnasio---")
struct Usuario {
    let nombre: String
    var edad: Int
    var cansado: Bool
    
    mutating func cansadoEs() {
        cansado = true
        print("El usuario \(nombre) está cansado")
    }
}

struct Ejercicio {
    let nombre: String
    let numeroDeSeries: Int
    var seriesCompletadas: Int
    var pesoActual : Double
    
    mutating func marcarSerieCompletada(seriesHechas: Int) {
        seriesCompletadas += seriesHechas
        print("Se han completado \(seriesCompletadas) series del ejercicio \(nombre) y el total de series es de \(numeroDeSeries)")
    }
    mutating func actualizarPeso(peso: Double) {
        pesoActual += peso
        print("Se ha actualizado el peso actual a \(pesoActual) kg para la siguiente sesion de entrenamiento del ejercicio \(nombre)")
    }
    func esCompletado (terminado : Bool){
        var completado = terminado ? "Completado":"Incompleto"
        print("El estado final de el ejercicio \(nombre) es \(completado)")
    }
}
var usuario1 = Usuario(nombre: "Jose", edad: 21, cansado: false)

var sentadillas = Ejercicio(nombre: "Sentadillas", numeroDeSeries: 5, seriesCompletadas: 0, pesoActual: 60.5)
var pressBanca = Ejercicio(nombre: "Press de banca", numeroDeSeries: 4, seriesCompletadas: 0, pesoActual: 40.0)
var remoBarra = Ejercicio(nombre: "Remo con barra", numeroDeSeries: 4, seriesCompletadas: 0, pesoActual: 35.5)


sentadillas.marcarSerieCompletada(seriesHechas: 5)
usuario1.cansadoEs()
pressBanca.marcarSerieCompletada(seriesHechas: 3)
remoBarra.marcarSerieCompletada(seriesHechas: 4)
remoBarra.actualizarPeso(peso: 2.5)
sentadillas.esCompletado(terminado: true)
pressBanca.esCompletado(terminado: false)
remoBarra.esCompletado(terminado: true)

//MEJORA DEL CODIGO QUE HICE

/*
 // --- ESTRUCTURAS INTELIGENTES ---
 struct Usuario {
     let nombre: String
     var edad: Int
     var estaCansado: Bool // Un nombre un poco más descriptivo
     
     mutating func seCanso() {
         estaCansado = true
         print("El usuario \(nombre) está cansado.")
     }
 }

 struct Ejercicio {
     let nombre: String
     let seriesObjetivo: Int
     var seriesCompletadas: Int
     var pesoActualKg: Double
     
     // PROPIEDAD COMPUTADA: La struct calcula su propio estado.
     var estado: String {
         return seriesCompletadas >= seriesObjetivo ? "Completado ✅" : "Incompleto 🏃‍♂️"
     }
     
     mutating func completarSeries(_ cantidad: Int) { // Usamos _ para no tener que escribir el nombre del parámetro al llamar
         seriesCompletadas += cantidad
     }
     
     mutating func actualizarPeso(nuevoPeso: Double) {
         pesoActualKg = nuevoPeso
     }
     
     // El reporte ahora usa la propiedad computada
     func imprimirReporte() {
         print("""
         Ejercicio: \(nombre.uppercased())
         \t- Progreso: \(seriesCompletadas) de \(seriesObjetivo) series.
         \t- Peso para la próxima sesión: \(pesoActualKg) kg.
         \t- Estado: \(estado)
         """)
     }
 }

 // --- SIMULACIÓN ---
 var usuario1 = Usuario(nombre: "Jose", edad: 21, estaCansado: false)

 var sentadillas = Ejercicio(nombre: "Sentadillas", seriesObjetivo: 5, seriesCompletadas: 0, pesoActualKg: 60.5)
 var pressBanca = Ejercicio(nombre: "Press de banca", seriesObjetivo: 4, seriesCompletadas: 0, pesoActualKg: 40.0)
 var remoBarra = Ejercicio(nombre: "Remo con barra", seriesObjetivo: 4, seriesCompletadas: 0, pesoActualKg: 35.5)

 // El usuario entrena...
 sentadillas.completarSeries(5)
 usuario1.seCanso()
 pressBanca.completarSeries(3)
 remoBarra.completarSeries(4)
 remoBarra.actualizarPeso(nuevoPeso: remoBarra.pesoActualKg + 2.5) // Hacemos el cálculo fuera

 // --- REPORTE FINAL ---
 print("\n--- RESUMEN DEL ENTRENAMIENTO DE HOY ---")
 sentadillas.imprimirReporte()
 pressBanca.imprimirReporte()
 remoBarra.imprimirReporte()
 
 */
