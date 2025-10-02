import UIKit

//Challengue's numero 09

var peliculas = [String]()
peliculas.append("Harry Potter")
peliculas.append("Star Wars")
peliculas.append("Iron Man")

var diccionarioPeliculas = [String : Int]()
var directoresPeliculas: Set<String> = []

diccionarioPeliculas[peliculas[0]] = 2001
diccionarioPeliculas[peliculas[1]] = 1977
diccionarioPeliculas[peliculas[2]] = 2008

directoresPeliculas.insert("Chris Columbus")
directoresPeliculas.insert("George Lucas")
directoresPeliculas.insert("Jon Favreau")
directoresPeliculas.insert("George Lucas")


print("Una de mis peliculas favoritas es \(peliculas[0]), que se estreno en \(diccionarioPeliculas[peliculas[0],default: 0])")

//Challenge 2 :FizzBuzz Clasico
print("Challenge 2 : FizzBuzz Clasico")
for i in 1...100{
    
    if i % 3 == 0 && i % 5 == 0{
        print("\(i)  = FizzBuz")
    }else if i % 3 == 0{
        print( "\(i) = Fizz")
    }else if i % 5 == 0{
        print("\(i) = Buzz")
    }else{
        print(i)
    }
}


//Challenge 3 : La calculadora de Raices Segura
print("Challenge 3 : La calculadora de Raices Segura")

enum CalculadorError : Error {
    case numeroNegativo
}

func calcularRaizCuadrada(delNumero : Double) throws -> Double {
    if delNumero < 0 {
        print("Error! No se puede ingresar numero negativo")
        throw CalculadorError.numeroNegativo
    }
    return sqrt(delNumero)
}

do {
    print(try calcularRaizCuadrada(delNumero: 25))
    print(try calcularRaizCuadrada(delNumero: 2))
}catch CalculadorError.numeroNegativo{

}

//Challenge 4 : El Super Ordenador de Arreglos

print("Challenge 4 : El Super Ordenador de Arreglos")

func ordenarInteligentemente(arreglo1 : [String] , ordenar : (String,String) -> Bool) -> [String]{
    
    
    return arreglo1.sorted(by: ordenar)
    
}
var nombres = ["Xana", "Jose", "Rafael", "Victor", "Ricardo", "Abraham"]
nombres = ordenarInteligentemente(arreglo1: nombres, ordenar: {$0 < $1})
print(nombres)
nombres = ordenarInteligentemente(arreglo1: nombres, ordenar: {
    $0.count < $1.count
})
print(nombres)

//Challenge 5 : El Simulador de Coche

print("Challenge 5 : El Simulador de Coche")

struct Coche {
    let modelo : String
    let numeroDeAsientos : Int
    private(set) var cambioActual : Int = 0 {
        didSet{
            print("La marcha cambio a \(cambioActual).")
        }
    }
    
    var descripcion : String {
        return "\(modelo) con \(numeroDeAsientos) asientos. Actualmente el cambio es \(cambioActual)."
    }
    
    
    mutating func subirCambio(){
        if cambioActual < 6 {
                cambioActual += 1
            } else {
                print("El cambio no puede ser mayor a 6")
            }
    }
    
    mutating func bajarCambio(){
        if cambioActual > 0 {
            cambioActual -= 1
        } else {
            print("Ya estás en neutral, no puedes bajar más el cambio.")
        }
    }
}

var coche1 = Coche(modelo: "Rav4", numeroDeAsientos: 5)
print(coche1.descripcion)
coche1.subirCambio()
coche1.subirCambio()
coche1.subirCambio()
coche1.subirCambio()
coche1.subirCambio()
coche1.subirCambio()
coche1.subirCambio()
coche1.bajarCambio()

//Challenge 09 mas dificil


//Challenge 1 : El Registo de Calificaciones 
