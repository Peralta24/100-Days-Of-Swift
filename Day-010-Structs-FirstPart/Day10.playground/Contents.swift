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
