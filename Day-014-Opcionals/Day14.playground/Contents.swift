import UIKit

//Dia 14 de 100 dias con Swift
//Opcionales

let opposites = [
    "Mario":"Luigi",
    "Luigi" :"Waluigi"
]
let peachOpposite = opposites["Peach"]


if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}


var username : String? = nil
username = "Jose"

if let unwrappedUsername = username {
    print("Hello \(unwrappedUsername)")
} else {
    print("Hello, world!")
}

func square(number: Int) -> Int {
    number * number
}

var number : Int? = nil
number = 5
if let number = number {
    print(square(number: number))
}else{
    print("NO HAY UN NUMERO")
}

func getUsername() -> String? {
    nil
}

if let username = getUsername() {
    print("Username is \(username)")
}else{
    print("No user name")
}
var bestScore: Int? = nil
bestScore = 101

if let bestScore {
    if bestScore > 100 {
        print("You got a high score!")
    } else {
        print("Better luck next time.")
    }
}

//Ejerciicos primera leccion opcionales

