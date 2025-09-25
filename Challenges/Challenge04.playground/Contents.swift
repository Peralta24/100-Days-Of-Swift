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

for libro in inventario {
    if libro.paginas < 300 {
        print("El libro \(libro.titulo) es Corto tiene \(libro.paginas) paginas")
    }else if libro.paginas <= 450{
        print("El libro \(libro.titulo) es Mediano tiene \(libro.paginas) paginas")
    }else {
        print("El libro \(libro.titulo) es largo tiene \(libro.paginas) paginas")
    }
    
    switch libro.genero {
        case .ficcion:
        print("Ideal para viajar a otros mundos")
    case .ciencia:
        print("Para expandir tu conocimiento del universo")
    case .historia:
        print("Un viaje al pasado para entender el presente")
    case .tecnologia:
        print("Lectura esencial para desarolladores")
    }
    
    var estadoLibre = libro.disponible ?  "✅ Disponible" : "❌ Prestado"
    
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

