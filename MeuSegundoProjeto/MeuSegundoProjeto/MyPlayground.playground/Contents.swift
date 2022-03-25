import UIKit
import Darwin

var idade = 15
print(idade)

var nome: String = "augusto"

var altura: Int = 1

var peso: Double = 23.3

var logica: Bool = true

print("Seu nome e: \(nome) e sua altura e: \(altura)")
print("----------------------------------------------------------------------------")
var v = [10, 20, 30, 40]

for num in v{
    print(num)
}
print("----------------------------------------------------------------------------")
v.append(10)
for num in v{
    print(num)
}
v.remove(at: 3)
print(v)
//MARK: - Dicionario
var dicionario: [String : Int] = ["chave1": 142, "chave2": 151]

dicionario["chave3"] = 288

print(dicionario["chave1"])

dicionario.removeValue(forKey: "chave1")
print(dicionario)

dicionario["chave30"] = dicionario["chave2"]

dicionario.removeValue(forKey: "chave2")
print(dicionario)
//MARK: - For
for semana in 1...7 { //utiliza for quando o fim e definido
    print(semana)
}

for (cha,val) in dicionario { //listar o conteudo do dicionario, tanto a chave como o valor
    print("chave : \(cha) - valor: \(val)")
}
//MARK: - While
var contador: Int = 0
while(contador < 5){
    print("Contou \(contador)")
    contador += 1
}
//MARK: - Switch

switch altura {
case 10...20:
    print("Pequeno")
case 21...30:
    print("medio")
case 31...40:
    print("Pesado")
default:
    print("Invalido")
}
//MARK: - Funcao

func somar(num1: Int,_ num2: Int) -> Int{
    let soma = num1 + num2
    print(soma)
    return soma
}

var s = somar(num1: 2, 3) //parametros passados
print(s)

var soma = 0
let array = [1,2,3,4,5,6]

func somaLista (_ lista: [Int]) -> Int{ //funcao retornando um array de Int
    var soma: Int = 0
    for c in lista {
        soma += c
        }
    return soma
}
let somalistaFinal : Int = somaLista(array)
print(somalistaFinal)
