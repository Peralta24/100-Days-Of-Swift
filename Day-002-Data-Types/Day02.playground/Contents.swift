import UIKit

//Como almacenar valores booleanos
let filename = "paris.jpg"
print(filename.hasSuffix("jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodDogs = true
var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)
let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)


//Como unir cadenas

var greeting = "Hello, "
greeting += "world!"
print(greeting)

let people = "Haters"
let action = "hate"
let lyric = people + "gonna" + action
print(lyric)

let luggageCode = "1" + "2" + "3" + "4" + "5"
print(luggageCode)

//Interpolacion de cadenas
let name = "Taylor"
let age = 26
let message = "Hello my name is \(name) and I'm \(age) years old."
print(message)


let numberM = 11
// let missionMessage = "Apollo" + number + "landed on the moon" ERROR no se pueden unir tipos diferentes de datos
var missionMessage = "Apollo " + String(numberM) + " landed on the moon."
print(missionMessage)

missionMessage = "Apollo \(numberM) landed on the moon."
print(missionMessage)

//Agregar operaciones a la interpolacion de cadenas
print("5 x 5 = \(5 * 5)")

//CheckPoint
let gradosCelcius = 20.2

let farenheint = (gradosCelcius * 9.0 / 5.0) + 32.0

print("\(gradosCelcius) grados Celcius es igual a \(farenheint) grados Fahrenheit")


//Mini proyecto del dia 02 : Panel de control de casa inteligente

let livingRoomLightName = "Luz de la Sala"
let thermostatName = "Termostato Principal"

var isLivingRoomLightOn = false
var isThermostatOn = true

var statusReport = ""

print("Alguien entro a la sala y enciende la luz")
isLivingRoomLightOn.toggle()

print("Para ahorrar energia apagamos el termostato")
isThermostatOn = !isThermostatOn

let lightStatusText = isLivingRoomLightOn ? "encendida" : "apagada"
let thermostatStatusText = isThermostatOn ? "encendido" : "apagado"

statusReport += "La \(livingRoomLightName) está \(lightStatusText). \n"
statusReport += "El \(thermostatName) está \(thermostatStatusText)."

print("--- Estado actual del panel de control ---\n'\(statusReport)")
print(statusReport)


//Mini Proyecto del dia 02 : Gestor de Tareas Diarias

let task1Name = "Estudiar Swift por 1 hora"
let task2Name = "Pasear al perro"

var isTask1Completed = false
var isTask2Completed = false

var summaryReport = ""

print("Estudie mas de una hora swift")
isTask1Completed = true
print("Ya llegue a mi casa ahora sacare a pasear a los perros")
isTask2Completed.toggle()

let task1StatusText = isTask1Completed ? "Completada" : "Pendiente"
let task2StatusText = isTask2Completed ? "Completada" : "Pendiente"

print("Resumen de mis actividades del dia de hoy")
print("La tarea \(task1Name) esta \(task1StatusText)")
print("La tarea \(task2Name) esta \(task2StatusText)")


//Mini Proyecto Final (Dia 01 + 02) Perfil de Usuario interactivo

struct UserProfile {
    let userName: String
    var followersCount: Int
    let postsCount: Int
    var isVerified: Bool
    var isActiveNow: Bool
    
}

var user = UserProfile(userName: "Jose", followersCount: 121, postsCount: 21, isVerified: false, isActiveNow: false)

print("El usuario \(user.userName) se ha conectado")
user.isActiveNow = true
print("El post de \(user.userName) se viralizo")
user.followersCount += 50
print("El usuario \(user.userName) ah sido verficado por la red social")
user.isVerified = true

var profileSummary = ""

let activityText = user.isActiveNow ? "En linea" : "Desconectado"
let activityStatusText = user.isVerified ? "Verificado" : "Sin Verificar"

profileSummary = ("El usuario \(user.userName) tiene \(user.followersCount) seguidores, \(user.postsCount) publicaciones y esta \(activityText) (\(activityStatusText))")


print(profileSummary)


//Mejora al mini Proyecto
struct UserProfile2 {
    let userNameN: String
    var followersCountN: Int
    let postsCountN: Int
    var isVerifiedN: Bool
    var isActiveNowN: Bool
    
    mutating func markAsActive() {
        isActiveNowN = true
        print("El usuario \(userNameN) se ha conectado")
    }
    mutating func markAsInactive() {
        isActiveNowN = false
        print("El usuario \(userNameN) se ha desconectado")
    }
    mutating func incrementFollowersCountN(countN: Int) {
        followersCountN += countN
    }
    mutating func decrementFollowersCount(countN: Int) {
        followersCountN -= countN
    }
    mutating func verifyAccount() {
        isVerifiedN = true
        print("El usuario \(userNameN) ah sido verficado por la red social")
    }
    func showProfileSummaryN() {
        var profileSummaryN = ""
        let activityText = isActiveNowN ? "En linea" : "Desconectado"
        let activityStatusText = isVerifiedN ? "Verificado" : "Sin Verificar"
        profileSummaryN = ("El usuario \(userNameN) tiene \(followersCountN) seguidores, \(postsCountN) publicaciones y esta \(activityText) (\(activityStatusText))")
        print(profileSummaryN)
    }
}
var user2 = UserProfile2(userNameN: "Rafael", followersCountN: 200, postsCountN: 210, isVerifiedN: false, isActiveNowN: false)
user2.showProfileSummaryN()
user2.markAsActive()
user2.incrementFollowersCountN(countN: 50)
user2.verifyAccount()
user2.showProfileSummaryN()


//Repaso del dia 01 + 02

//Mi mascota Digital

struct MascotaDigital {
    
    let nombre : String
    var hambre : Int
    var felicidad : Int
    var dormido : Bool
    
    var estadoHambre : String {
        return hambre > 5 ? "Hambrienta 🍖" : "Saciada 😋"
    }
    
    var estadoFelicidad : String {
        return felicidad > 5 ? "Feliz 😊" : "Triste 😟"

    }
    var estadoSuenio : String{
        return dormido ? "Durmiendo 😴" : "Despierta ☀️"

    }
    
    mutating func alimentarla() {
        if hambre > 0 {
            hambre -= 2
        }
        print("Le diste de comer a \(nombre) cantidad actual de hambre \(hambre)")
    }
    mutating func jugarConMascota(){
        print("Estas jugando con tu mascota virtual")
        felicidad += 1
        hambre += 1
    }
    mutating func cambiarEstadoSuenio (){
        dormido.toggle()
    }
    func imprimirReporte() {
            print("""
            --- REPORTE DE ESTADO DE: \(nombre.uppercased()) ---
            Felicidad: \(felicidad)/10 (\(estadoFelicidad))
            Hambre:    \(hambre)/10 (\(estadoHambre))
            Estado:    \(estadoSuenio)
            ------------------------------------
            """)
        }
    
}

var kira = MascotaDigital(nombre: "Kira", hambre: 5, felicidad: 5, dormido: false)

print("--- Estado Inicial ---")
kira.imprimirReporte()
kira.jugarConMascota()
kira.jugarConMascota()
kira.cambiarEstadoSuenio()

print("--- Estado Final ---")
kira.imprimirReporte()
