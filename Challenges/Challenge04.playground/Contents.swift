import UIKit

//Challenge numero 04

// Enum para los géneros de los libros
enum Genero {
    case ficcion, ciencia, historia, tecnologia
}

// Struct para cada libro
struct Libro {
    let titulo: String
    let autor: String
    let genero: Genero
    let paginas: Int
    let disponible: Bool
}

// Array con todo el inventario de la biblioteca
let inventario = [
    Libro(titulo: "Dune", autor: "Frank Herbert", genero: .ficcion, paginas: 412, disponible: true),
    Libro(titulo: "Una Breve Historia del Tiempo", autor: "Stephen Hawking", genero: .ciencia, paginas: 256, disponible: false),
    Libro(titulo: "Sapiens: De animales a dioses", autor: "Yuval Noah Harari", genero: .historia, paginas: 443, disponible: true),
    Libro(titulo: "Clean Code", autor: "Robert C. Martin", genero: .tecnologia, paginas: 464, disponible: false),
    Libro(titulo: "El Problema de los Tres Cuerpos", autor: "Cixin Liu", genero: .ficcion, paginas: 400, disponible: true),
    Libro(titulo: "Cosmos", autor: "Carl Sagan", genero: .ciencia, paginas: 384, disponible: true)
]

// Bucle para generar el reporte de cada libro
for libro in inventario {
    // 1. Declaramos variables para guardar los resultados
    let longitud: String
    let descripcion: String

    // 2. Usamos IF/ELSE IF para ASIGNAR el valor a 'longitud'
    if libro.paginas < 300 {
        longitud = "Corto"
    } else if libro.paginas <= 450 {
        longitud = "Mediano"
    } else {
        longitud = "Largo"
    }

    // 3. Usamos SWITCH para ASIGNAR el valor a 'descripcion'
    switch libro.genero {
    case .ficcion:
        descripcion = "Ideal para viajar a otros mundos."
    case .ciencia:
        descripcion = "Para expandir tu conocimiento del universo."
    case .historia:
        descripcion = "Un viaje al pasado para entender el presente."
    case .tecnologia:
        descripcion = "Lectura esencial para desarrolladores."
    }

    // 4. Usamos el OPERADOR TERNARIO para obtener el estado
    let estadoLibre = libro.disponible ? "✅ Disponible" : "❌ Prestado"

    print("📖 Título: \(libro.titulo)")
    print("   - Longitud: \(longitud)")
    print("   - Descripción: \(descripcion)")
    print("   - Estado: \(estadoLibre)")
    print("")
}


//Busqueda Especial

print("Libro recomendado del mes")
var libroDelMes = ""

for libro in inventario {
    if libro.genero == .ciencia && libro.paginas < 400 {
        libroDelMes = libro.titulo
        break
    }
    
    
}

if libroDelMes.isEmpty{
    print("No hay libro recomendado de este mes")
}else{
    print("El libro del mes es \(libroDelMes)")

}

