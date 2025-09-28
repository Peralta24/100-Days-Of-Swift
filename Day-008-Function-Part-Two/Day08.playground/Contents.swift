import UIKit

//Dia 08 de 100 dias con swift

enum PassWordError: Error {
    case short, obvius
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PassWordError.short
    }
    if password == "12345" {
        throw PassWordError.obvius
    }
    
    if password.count < 8 {
        return "Ok"
    }else if password.count < 12 {
        return "Buena"
    }else {
        return "Fuerte"
    }
}

let string = "1234"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
}catch PassWordError.short{
    print("Please use a longer password.")
}catch PassWordError.obvius{
    print("Please use a more complex password.")
}catch {
    print("An error ocurred.")
}


//Checkpoint 4
enum ErrorNumero: Error {
    case saleDelLimite, sinRaiz
}
var numeroInicio = Int.random(in: 1...10_000)


func raizCuadrada (de numero : Int) throws -> Double {
    if numero < 1 || numero > 10_000 {
        throw ErrorNumero.saleDelLimite
    }
    
    for i in 1...100{
        if i * i == numero {
            return Double(i)
        }
    }
    
    throw ErrorNumero.sinRaiz
}

var numeroCuadrado = 10000

do {
    let result = try raizCuadrada(de: numeroCuadrado)
    print("El resultado es \(result)")
}catch ErrorNumero.saleDelLimite{
    print("El numero sale del limite")
}catch ErrorNumero.sinRaiz{
    print("No se puede sacar raiz")
}catch {
    print("Ocurrio un error")
}
//Dia terminado

//Ejercicio numero dos
enum constrasenia : Error {
    case demasiadoCorta,sinMayuscula,sinNumero
}
func verifacarContrasenia(contrasenia: String) throws ->  String {
    
    if contrasenia.count < 8 {
        throw constrasenia.demasiadoCorta
    }
    if contrasenia.allSatisfy({ !$0.isUppercase }) {
        throw constrasenia.sinMayuscula
    }
    if contrasenia.allSatisfy({ !$0.isNumber }) {
        throw constrasenia.sinNumero
    }
    return "Contrasenia aceptada"
    
}

do {
    let result = try verifacarContrasenia(contrasenia: "M12345678")
    print("\(result)")
}catch constrasenia.demasiadoCorta {
    print("Demasiado corta")
}catch constrasenia.sinMayuscula {
    print("Falta mayuscula")
}catch constrasenia.sinNumero {
    print("Falta numero")
}

//Ejercicio numero tres

enum ErrorRegistro : Error {
    case nombreVacio, emailInvalido, menorDeEdad
}


func registratUsuario(nombre : String, email :String, edad : Int) throws -> String {
    if nombre.isEmpty {
        throw ErrorRegistro.nombreVacio
    }
    
    if !email.contains("@") {
        throw ErrorRegistro.emailInvalido
    }
    if edad < 18 {
        throw ErrorRegistro.menorDeEdad
    }
    
    return "Bienvenido , \(nombre)! Tu registro ha sido exitoso."
}


do {
    let usuario = try registratUsuario(nombre: "Rafael", email: "rafa@correo.com", edad: 21)
    print(usuario)
}catch ErrorRegistro.nombreVacio {
    print("El nombre esta vacio")
}catch ErrorRegistro.emailInvalido {
    print("La direccion del correo es invalida")
}catch ErrorRegistro.menorDeEdad {
    print("Eres menor de edad")
}
