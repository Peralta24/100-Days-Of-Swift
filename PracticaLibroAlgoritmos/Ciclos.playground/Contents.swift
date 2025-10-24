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





var numerosA = [-1,-2,-3,0,1,2,3,4,5,6]
var numerosAPositivos = [Int]()

for numero in 0...numerosA.count-1 {
    if numerosA[numero] < 0 {
        continue
    }
    numerosAPositivos.append(numerosA[numero])
}

print(numerosAPositivos)

var documentos = ["word.jpg", "ppt.jpg", "excel.jpg", "swift.swift"]
var documentosJpg = 0

for documento in documentos {
    if documento.hasSuffix(".swift") {
        break
    }
    documentosJpg += 1
}

print(documentosJpg)



//Valor maximo de una serie de 100 nyumeros

let numeros = (1...100).map { _ in Int.random(in: 1...100) }
print(numeros)
var maximo = 0
var minimo = 0
for numero in numeros {
    if numero > maximo {
        maximo = numero
    }
    if numero < minimo {
        minimo = numero
    }
}


print(maximo)
print(minimo)

var numeroFactorial = 5
var resultadoFactorial = 1
for i in 1...numeroFactorial {
    resultadoFactorial *= i
}
print(resultadoFactorial)

//Subfunciones

//Entrada de altura y base

func alturaRectangulo(altura: Int) -> Int{
    var alturaRectangulo = altura
    return alturaRectangulo
}
func baseRectangulo(base:Int) -> Int{
    var baseRectangulo = base
    return baseRectangulo
}

//Calculo de la superficie
func calcularSuperficie(altura:Int,base:Int) -> Int{
    print(altura * base)
   return  altura * base
}
var altura = alturaRectangulo(altura: 20)
var base = baseRectangulo(base: 3)

calcularSuperficie(altura: altura, base: base
)


