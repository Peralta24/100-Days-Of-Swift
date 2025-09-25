import UIKit

//Dia 06. 100 Dias con Swift

//Recorrer un array
let platforms = ["iOS","macOS","tvOS","watchOS"]

for platform in platforms {
    print("Hello, \(platform)!")
}

//Recorrer un set
let nombres = (["Rafael","Xana","Pablo","Laura"])

for nombre in nombres {
    print("Hola, \(nombre)!")
}
//Recorrer un diccionario
var calificaciones = [String : Int]()
calificaciones["Rafael"] = 90
calificaciones["Xana"] = 85
calificaciones["Pablo"] = 70
calificaciones["Laura"] = 95

for (nombre, calificacion) in calificaciones {
    print("\(nombre) tiene una calificación de \(calificacion)")
}

//Usar ciclo for con numeros fijos
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}
//Bucles anidados
for i in 1...12 {
    print("The \(i) times table:")

    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }

    print()
}


//Usar ciclo for exlcluyendo el ultimo numero

for i in 1...5{
    print("Countng from 1 through 5 is \(i)")
}

print()

for i in 1..<5{
    print("Countng from 1 up to but not including 5 is \(i)")
}

//Usar un ciclo for pero sin querer usar la variable

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)
