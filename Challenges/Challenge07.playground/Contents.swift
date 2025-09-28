import UIKit

//Challenge 07


//Ejercicios 1 del dia 1
let nombre = "Rafael"
var edad : Int
edad = 21
print("Mi nombre es \(nombre) y tengo \(edad) años")

//Ejercicio 2 del dia 1
let costoComida = 50.0
let porcentajePropina = 18.0
var montoPropina = costoComida * (porcentajePropina / 100)
print("El monto de la propina es \(montoPropina)")

//Ejercicio 3 del dia 1
let temperaturaGradosCelcius = 25.0
var temperaturaGradosFahrenheit  = (temperaturaGradosCelcius * 9.0 / 5.0) + 32.0

print("El resultado de la conversion es \(temperaturaGradosFahrenheit) y en grados celcius es \(temperaturaGradosCelcius)")

//Ejercicio 1 del dia 2
var playlist = Array<String>()
playlist.append("Golden")
playlist.append("Tu sin mi")
playlist.append("Iris")
playlist.append("Kamado")
playlist.append("Kamado")

print(playlist.count)
for cancion in playlist{
    print(cancion)
}

var playlistSinRepetidos = Set<String>(playlist)
print(playlistSinRepetidos.count)
for cancion in playlistSinRepetidos{
    print(cancion)
}

//Ejercicio 2 del dia 2

var contactosEmergencia = [String : Int]()

contactosEmergencia["Ambulancia"] = 2132133
contactosEmergencia["Policia"] = 213102
contactosEmergencia["Fire Brigade"] = 21102101

print("El numero de contacto es : \(contactosEmergencia["Fire Brigade", default: 0])")

//Ejercicio 3 del dia 2
enum talla {
    case chica,mediana,grande,extraGrande
}

var tallaSeleccionada = talla.mediana

print("La talla seleccionada es \(tallaSeleccionada)")

//Ejercicio 1 del dia 3
let edad3 = 21

if edad3 >= 18 {
    print("Puedes votar por que tienes \(edad3) años")
}else{
    print("No puedes votar por que tienes \(edad3) años")
}

//Ejercicio 2 del dia 3 
