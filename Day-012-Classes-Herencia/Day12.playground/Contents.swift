import UIKit

//Day 12 de 100 dias con SwiftUI

class Game {
    var score = 0 {
        didSet {
            print("Score: \(score)")
        }
    }
}

var newGame = Game()
newGame.score = 10
newGame.score = 20 


//Crear clases heredadas de otra clase padre

class Employee {
    let hours: Int
    init(hours: Int) {
        self.hours = hours
    }
    func printSummary() {
        print("I work \(hours) hours a day!")
    }
    
}

class Developer : Employee {
    func work() {
        print("Developer working for \(hours)")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }

}

final class Testers : Employee {
    func test() {
        print("Testers testing for \(hours)")
    }
}

let jose = Developer(hours: 10)
let rafael = Testers(hours: 10)
jose.work()
rafael.test()
jose  .printSummary()
//Como agregar inicialzadores a las clases

class Vehicle {
    let isElectric : Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car : Vehicle {
    let isConvertible : Bool
    
    init(isElectric:Bool,isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric:isElectric)
    }
}

//Crear copias de una clase

class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
user2.username = "Taylor"
print(user1.username)
print(user2.username)

//Desinicializadores de clases
class User2 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}
for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): Im in control!")
}

//Variables de una clase
class User3 {
    var name = "Paul"
}

// 1️⃣ Instancia constante, propiedad variable
let user11 = User3()
user11.name = "Taylor" // ✅ Cambia la propiedad
// user1 = User()      // ❌ Error, no se puede reasignar la instancia

// 2️⃣ Instancia variable, propiedad variable
var user22 = User3()
user22.name = "Taylor"  // ✅ Cambia la propiedad
user22 = User3()          // ✅ Se puede asignar un objeto nuevo

// 3️⃣ Instancia variable, propiedad constante
class User4 {
    let name: String
    init(name: String) { self.name = name }
}

var user3 = User4(name: "Paul")
// user3.name = "Taylor"  // ❌ Error, propiedad constante
user3 = User4(name: "Taylor") // ✅ Se puede apuntar a un objeto nuevo


//CheckPoint Number 7
