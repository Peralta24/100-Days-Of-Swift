import UIKit

//Challenge numero 03

// Enum para las materias
enum Materia {
    case matematicas, historia, ciencias
}

// Struct para cada resultado
struct ResultadoExamen {
    let nombreEstudiante: String
    let materia: Materia
    let calificacion: Int
}

// Array con todos los resultados del trimestre
let resultados = [
    ResultadoExamen(nombreEstudiante: "Ana", materia: .matematicas, calificacion: 8),
    ResultadoExamen(nombreEstudiante: "Juan", materia: .ciencias, calificacion: 9),
    ResultadoExamen(nombreEstudiante: "Ana", materia: .ciencias, calificacion: 10),
    ResultadoExamen(nombreEstudiante: "Pedro", materia: .historia, calificacion: 7),
    ResultadoExamen(nombreEstudiante: "Juan", materia: .matematicas, calificacion: 7),
    ResultadoExamen(nombreEstudiante: "Ana", materia: .historia, calificacion: 9),
    ResultadoExamen(nombreEstudiante: "Pedro", materia: .ciencias, calificacion: 8)
]

//Lista de los alumnos

var alumnos =  Set<String>()
alumnos.insert(resultados[0].nombreEstudiante)
alumnos.insert(resultados[1].nombreEstudiante)
alumnos.insert(resultados[2].nombreEstudiante)
alumnos.insert(resultados[3].nombreEstudiante)
alumnos.insert(resultados[4].nombreEstudiante)
alumnos.insert(resultados[5].nombreEstudiante)
alumnos.insert(resultados[6].nombreEstudiante)

print("La lista de alumnos es \(alumnos)")

var promedioCiencias : Int
promedioCiencias = resultados[1].calificacion
promedioCiencias += resultados[2].calificacion
promedioCiencias += resultados[6].calificacion

promedioCiencias /= 3

print("El promedio de ciencias es \(promedioCiencias)")

var mejoresCalificaciones = [String:Int]()
mejoresCalificaciones["Ana"] = resultados[0].calificacion
mejoresCalificaciones["Juan"] = resultados[1].calificacion
mejoresCalificaciones["Ana"] = resultados[2].calificacion
mejoresCalificaciones["Pedro"] = resultados[3].calificacion
mejoresCalificaciones["Pedro"] = resultados[6].calificacion
print("Mejores Calificaciones")

print("- Ana: \(mejoresCalificaciones["Ana",default: 0])")
print("- Juan: \(mejoresCalificaciones["Juan",default: 0])")
print("- Pedro: \(mejoresCalificaciones["Pedro",default: 0])")
