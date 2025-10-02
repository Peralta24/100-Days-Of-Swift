import UIKit

//Dia 11 de 100 dias con Swift

struct BankAccount {
    
    private var funds = 0
    
    mutating func deposit(_ amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(_ amount: Int) -> Bool {
        if amount >= funds {
            funds -= amount
            return true
        }else{
            return false
        }
    }
}

var account = BankAccount()
account.deposit(100)
let succes = account.withdraw(200)

if succes {
    print("Withdrew money succesfully")
}else{
    print("Failed to get the money")
}

//Propiedades y metodos estaticos

struct School {
    static var studentCount = 0
    
    static func add (student : String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}
School.add(student: "Taylor Swift")
School.add(student: "Ed Sheeran")
print("Total students: \(School.studentCount)")

//Usar propiedas staticas parea organizar datos comunes en mis aplicaciones
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFileName = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

print(AppData.version)
print(AppData.saveFileName)
print(AppData.homeURL)


//Crear ejemplos de mis estructuras con static

struct EmEmployee {
    let username : String
    let password : String
    
    static let example = EmEmployee(username: "Jim1Poggers", password: "A0r1GLn4IP45sW0RD")
}

print(EmEmployee.example)

struct Unwrap {
    static let appURL = "https://itunes.apple.com/app/id1440611372"
    nonisolated(unsafe)static var entropy = Int.random(in: 1...1000)

    static func getEntropy() -> Int {
        entropy += 1   // ✅ se puede modificar porque entropy es var
        return entropy
    }
}

Unwrap.getEntropy()

struct LegoBrick {
    nonisolated(unsafe)static var numberMade = 0
    var shape : String
    var color : String
    init(shape : String, color: String){
        self.shape = shape
        self.color = color
        LegoBrick.numberMade += 1
    }
}

//Chekpoint 6


struct Car {

    let model: String
    let numberOfSeats: Int

    // Se puede leer desde fuera, pero solo se puede modificar desde dentro
    // de la estructura, gracias a private(set).
    private(set) var currentGear: Int = 1

    // Método para cambiar de marcha (hacia arriba o hacia abajo).
    // Es 'mutating' porque modifica 'currentGear'.
    mutating func changeGear(to newGear: Int) {
        // Validamos la nueva marcha antes de asignarla.
        if newGear >= 1 && newGear <= 10 {
            currentGear = newGear
            print("Cambio de marcha exitoso. Marcha actual: \(currentGear)")
        } else {
            print("Error: La marcha \(newGear) no es válida. Debe estar entre 1 y 10.")
        }
    }
    
    mutating func gearUp() {
        // Reutilizamos la lógica de changeGear para no repetir código
        changeGear(to: currentGear + 1)
    }

    mutating func gearDown() {
        changeGear(to: currentGear - 1)
    }
}

// --- Uso ---
var car1 = Car(model: "Rav4", numberOfSeats: 5)

print("Coche creado: \(car1.model) con \(car1.numberOfSeats) asientos.")
print("Marcha inicial: \(car1.currentGear)")

car1.gearUp()
car1.gearUp()
car1.gearDown()


car1.changeGear(to: 11)
car1.changeGear(to: 0)

print("Marcha final: \(car1.currentGear)")
