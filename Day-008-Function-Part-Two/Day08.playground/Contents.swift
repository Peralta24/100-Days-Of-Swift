import UIKit
import Foundation
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


//Ejercicio de practica
//Sistema de verifaccion de pedidos en linea

enum ProblemasPedidosLinea : Error {
    case vacio, cantidadNoValida, stockInsuficiente
    
    var mensaje : String {
        switch self {
        case . vacio:
            return "El campo esta vacio"
        case .cantidadNoValida:
            return "La cantidad no es valida"
        case .stockInsuficiente:
            return "El stock es insuficiente"
        }
    }
}


func verificarPedido(cantidad : Int, producto : String,stock : Int) throws -> String {
    if producto.isEmpty {
        throw ProblemasPedidosLinea.vacio
    }
    if cantidad  <= 0 {
        throw ProblemasPedidosLinea.cantidadNoValida
    }
    if cantidad > stock {
        throw ProblemasPedidosLinea.stockInsuficiente
    }
    return "Pedido Confirmado: \(cantidad) \(producto) gracias por su compra!"
}


do {
    let pedido = try verificarPedido(cantidad: 20, producto: "Cronometro",stock: 100)
    print(pedido)
}catch let error as ProblemasPedidosLinea{
    print(error.mensaje)
}

do{
    let pedido = try verificarPedido(cantidad: 0, producto: "",stock: 1)
    print(pedido)
}catch let error as ProblemasPedidosLinea{
    print(error.mensaje)
}

do {
    let pedido = try verificarPedido(cantidad: 5, producto: "Reloj", stock: 10)
    print(pedido)
}catch let error as ProblemasPedidosLinea {
    print(error.mensaje)
}

//Ejercicio de Validacion de pagos en linea

enum ErrorPagoEnLinea : Error {
    case tarjetaInvalida, fondosInsuficientes, tarjetaExpirada
    
    var mensaje : String {
        switch self {
        case .tarjetaInvalida:
            return "La tarjeta es invalida"
        case .fondosInsuficientes:
            return "No tienes los fondos suficientes"
        case .tarjetaExpirada:
            return "Tu tarjeta esta expirada"
        }
    }
}


//Funcion que maneja los posibles errores
func validarPagoEnLinea (deTarjeta tarjeta : String, conFondos fondos : Double, conExpiracion expiracion : String, monto : Double) throws -> String {

    let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yy"
    let fechaActual = Date()

    guard let fechaObjeto = dateFormatter.date(from: expiracion)else{
        throw ErrorPagoEnLinea.tarjetaExpirada
    }
    
    if tarjeta.count != 16{
        throw ErrorPagoEnLinea.tarjetaInvalida
    }
    if !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: tarjeta)) {
        throw ErrorPagoEnLinea.tarjetaInvalida
    }
    if fondos < monto {
        throw ErrorPagoEnLinea.fondosInsuficientes
    }
    
    
    if fechaObjeto < fechaActual {
        throw ErrorPagoEnLinea.tarjetaExpirada
    }
    
    return "Pago de $\(monto) realizado con exito con la tarjeta con terminacion en \(tarjeta.suffix(4))"
}


do{
    let pago = try validarPagoEnLinea(deTarjeta: "1234567890123456", conFondos: 1000.0, conExpiracion:  "10/25", monto: 500.0)
    print(pago)
}catch let error as ErrorPagoEnLinea{
    print(error.mensaje)
}

do{
    let pago = try validarPagoEnLinea(deTarjeta: "2121", conFondos: 10, conExpiracion: "12/25", monto: 100)
    print(pago)
}catch let error as ErrorPagoEnLinea{
    print(error.mensaje)
}

do {
    let pago = try validarPagoEnLinea(deTarjeta: "1111111111111111", conFondos: 1000.0, conExpiracion: "11/12", monto: 100)
}catch let error as ErrorPagoEnLinea{
    print(error.mensaje)
}

do {
    let pago = try validarPagoEnLinea(deTarjeta: "2222222222222222", conFondos: 100, conExpiracion: "11/25", monto: 500)
    print(pago)
}catch let error as ErrorPagoEnLinea {
    print(error.mensaje)
}

do {
    let pago = try validarPagoEnLinea(deTarjeta: "asdfghjquil;kiafj", conFondos: 100, conExpiracion: "10/25", monto: 50)
    print(pago)
}catch let error as ErrorPagoEnLinea {
    print(error.mensaje)
}

let escenarios = [
    (tarjeta: "1234567890123456", fondos: 1000.0, expiracion: "10/25", monto: 500.0),
    (tarjeta: "2121", fondos: 10.0, expiracion: "12/25", monto: 100.0),
    (tarjeta: "1111111111111111", fondos: 1000.0, expiracion: "11/12", monto: 100.0),
    (tarjeta: "2222222222222222", fondos: 100.0, expiracion: "11/25", monto: 500.0),
    (tarjeta: "asdfghjquil;kiafj", fondos: 100.0, expiracion: "10/25", monto: 50.0)
]

for escenario in escenarios {
    print("Prueba del escenario \(escenario)")
    
    do {
        let resultado = try validarPagoEnLinea(deTarjeta: escenario.tarjeta, conFondos: escenario.fondos, conExpiracion: escenario.expiracion, monto: escenario.monto)
        print("\(resultado)\n")
    }catch let error as ErrorPagoEnLinea{
        print("\(error.mensaje)\n")
    }
}
