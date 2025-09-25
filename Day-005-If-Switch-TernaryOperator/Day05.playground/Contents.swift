import UIKit

//Dia 05 de 100 dias con swift

//Sintaxis
//if condicion {
//    print("Do something")
//}

let score = 85

if score > 80 {
    print("Great job!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going we don't need roads.")
}
if percentage < 85 {
    print("Sorry, you failded the test.")
}

if age >= 18 {
    print("You're eligible to vote.")
}

let ourName = "Dave Lister"
let friendName = "John Doe"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}
if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

var numbers = [1,2,3]
numbers.append(4)

if numbers.count > 3{
    numbers.remove(at: 0)
}
print(numbers)

let country = "Canada"
if country == "Australia" {
    print("G'day!")
}

var nombre = "Jose"

if nombre.isEmpty {
    nombre = "Anonymus"
}
print(nombre)

let firstName = "Paul"
let secondName = "Sophie"

let firstAge = 40
let secondAge = 10

print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

print(firstAge == secondAge)
print(firstAge != secondAge)
print(firstAge < secondAge)
print(firstAge >= secondAge)


enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)


//Multiples condiciones

let ageM = 16

if ageM >= 18 {
    print("You can vote")
}else{
    print("You cant vote")
}

let a = false
let b = true

if a {
    print("Code run if a is true")
}else if b {
    print("Code to run if a is false but b is true")
}else {
    print("Code to run if a and b are false")
}


//Comparar usando condiciones
var temp = 25

if temp == 25 && temp < 30 {
    print("Is a nice day")
}else{
    print("Maybe is not a nice day")
}


let userAge = 14
let hasParentalConsent = false

if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}else {
    print("You need be older than 18 or has a parental consent")
}


enum TransportOption {
    case airplane,helicopter,car,bicycle,scooter
}

var transportmode = TransportOption.airplane

if transportmode == .airplane || transportmode == .helicopter {
    print("You are flying")
}else if transportmode == .car {
    print("Ready to come later")
}else if transportmode == .bicycle {
    print("I hope there is a bike path")
}else {
    print("The scooter is funny")
}

// Switch statement

enum Weather {
    case sun,rain,wind,snow,unknow
}

let forecast = Weather.sun


switch forecast{
case .sun :
    print("It should be a nice day")
case .rain:
    print("Pack an umbrella")
case .wind :
    print("Wear sometihing warm")
case .snow :
    print("Scholl is canceled")
case .unknow :
    print("Our forecast generator is broken")
}

let place = "Metropolis"

switch place {
case "Gothamn" :
    print("You are batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda" :
    print("You are black panther!")
default :
    print("Who are you")
}

//Operador ternario

let ageT = 18
let canVoteT = ageT >= 18 ? "Yes":"No"
print(canVoteT)

let hour = 23
print(hour < 12 ? "Its before noon":"Its after noon")

let names = ["Jayne","Kaylee","Mal"]
let crewCount = names.isEmpty ? "No crew members":"\(names.count) crew members"
print(crewCount)

enum Theme {
    case dark,light
}

let currentTheme: Theme = .dark

let uiTheme = currentTheme == .dark ? "Dark mode":"Light mode"

print(uiTheme)

//Mini Proyecto del dia 05

let pesoEnKg = 7.0
let esFragil = true

enum TipoDeEnvio {
    case estandar,express,prioritario
}

let tipoDeEnvioSeleccionado = TipoDeEnvio.prioritario


var costoBase : Double

if pesoEnKg < 1.0{
    costoBase = 50
}else if  pesoEnKg <= 5.0 {
    costoBase = 120
}else{
    costoBase = 250
}

let multiplicadorDeUrgencia : Double
let nombreDelServicio : String
switch tipoDeEnvioSeleccionado {
case .estandar:
    multiplicadorDeUrgencia = 1.0
    nombreDelServicio = "Estandar"
case .express :
    multiplicadorDeUrgencia = 1.5
    nombreDelServicio = "Express"
case .prioritario :
    multiplicadorDeUrgencia = 2.0
    nombreDelServicio = "Prioritario"
}

let costoExtraFragil : Double

costoExtraFragil = esFragil ? 75.0 : 0.0

var costoTotal = (costoBase * multiplicadorDeUrgencia) + costoExtraFragil

print("Resumen de Envio Swift Express")
print("Costo Base : $\(costoBase)")
print("Tipo de Envio: \(nombreDelServicio) (Multiplicador: \(multiplicadorDeUrgencia))")
print("Costo Extra por paquete fragil $\(costoExtraFragil)")
print("-----------------------------")
print("Costo Total: \(costoTotal)")


//Codigo de repaso







