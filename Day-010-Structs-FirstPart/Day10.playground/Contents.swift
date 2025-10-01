import UIKit

//Dia 10 de 100 dias con Swift

struct Album {
    let title : String
    let artis : String
    let year : Int
    
    func printSummary() {
        print("Album: \(title)")
        print("Artista: \(artis)")
        print("Año: \(year)")
    }
}


var album1 = Album(title: "Thriller", artis: "Michael Jackson", year: 1982)
album1.printSummary()
print(album1.title)
print(album1.artis)



struct Employee {
    let name : String
    var vacationRemaining : Int
    
    mutating func takeVacation(days : Int) {
        if vacationRemaining >= days {
            vacationRemaining -= days
            print("Im goin on vacation")
            print("Days remaining : \(vacationRemaining)")
        }else {
            print("Oops! There arent enough days remaining.")
        }
    }
}
var archer = Employee(name : "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 3)
archer.takeVacation(days: 11)
print(archer.vacationRemaining)

//End   primera leccion

//Test primera leccion 10/12
//Test 2 primera leccion mutating methods 10/12



//Teoria Numero dos

struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}
var archer2 = Employee2(name: "Sterling Archer", vacationAllocated:14)
archer2.vacationTaken += 4
archer2.vacationRemaining = 5
print(archer2.vacationAllocated)



//Como actuar cuando una propiedad cambia
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contact = [String](){
        willSet {
            print("Current value is: \(contact)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contact.count) contacts.")
            print("Old value was: \(oldValue)")
        }
    }
}


var app = App()
app.contact.append("Adian E")
app.contact.append("Allen W")
app.contact.append("Ish S")


//Como crear inicializadores personalizados

struct Player {
    let name : String
    var number : Int {
        willSet {
            print("El numero es \(name)")
            print("El nuevo numero sera \(newValue)")
        }
        
        didSet{
            print("El nuevo numero de \(name) es ")
            print("El antiguo numero de \(name) fue \(oldValue)")
        }
    }
    init(name: String) {
        self.name = name
        self.number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Adian E")
print(player.number)
print(player.number)
player.number
print(player.number)

 
struct Employee3 {
    var name: String
    var yearsActive = 0
}

extension Employee3 {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin = Employee3(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee3()
