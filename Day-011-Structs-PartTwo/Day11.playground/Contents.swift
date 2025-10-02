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

