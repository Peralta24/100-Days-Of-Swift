import UIKit

var contadorNumeroPositivos = 0
var listaNumero = [1,2,3,-4,-1,-2,-5,-6,-7,-9,22]
var listaNumerosPositivos = [Int]()
var listanumerosNegativs = [Int]()

for i in 0...listaNumero.count-1 {
    if listaNumero[i] < 0 {
        listanumerosNegativs.append(listaNumero[i])
        continue
    }
    contadorNumeroPositivos += 1
    listaNumerosPositivos.append(listaNumero[i])
}
print(contadorNumeroPositivos)
print(listanumerosNegativs)
print(listaNumerosPositivos)
var numero = 0
var contadorWhile = 0
while numero <= 10 {
    contadorWhile += 1
    listaNumerosPositivos.append(numero)
    numero += 1
}
print(contadorWhile)
print(listaNumerosPositivos)

var capital = 100
var tasa = 10

while tasa <= 20{
    var interes = capital * tasa / 100
    tasa += 1
    print("El interes es \(interes)")
}

var i = 0

while i<6 {
    print(i)
    i += 1
}

//var totalCalificaicones = 0
//var alumnos = 0
//var notas = 50
//while notas != -99 {
//    alumnos += 1
//    totalCalificaicones += notas
//    print(notas)
//    
//}
//
//var media = totalCalificaicones / alumnos
//print(media)

var listaWhile = [1,2,3,4,45,6,7,8,10]

while listaWhile.isEmpty == false{
    listaWhile.removeLast()
    print(listaWhile)
}
        
print(listaWhile)
