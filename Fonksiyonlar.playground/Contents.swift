import UIKit

var greeting = "Hello, playground"

print(greeting)

// func Name (parametreler) -> Dönüş Tipi

// makeBreakfast(food: ["eggs","orange juice"])
// makeBreakfast(food: ["cereal","toast"])

// parametresiz ve dönüşsüz fonksiyon

func displayPi() {
    
    print("3.14")
    
}

func sayMyName() {
    
    print("Merhaba, Ben Ahmet Hakan")
}

// fonksiyonu çağırmak - çalıştırmak

displayPi()
sayMyName()

// parametreli ve dönüşsüz fonksiyonlar

func triple (value:Int){
    let result = value * 3
    print(result)
}
// fonksiyonu çağırmak - çalıştırmak

triple(value: 10)
triple(value: 4)
triple(value: 23)
triple(value: 4815)

// Çoklu Parametreli ve dönüşsüz fonksiyon

func multiply(firstNumber : Int, secondNumber: Int){
    
    let result = firstNumber * secondNumber
    print(result)
}

multiply(firstNumber: 12, secondNumber: 4)

func introduceYourself(firstName: String, lastName: String, height:Double){
    
    let fullName = firstName + " " + lastName
    let text = "Merhaba, ben " + fullName + " ve boyum " + String(height)
    print(text)
    
}

introduceYourself(firstName: "Ahmet Hakan", lastName: "Yıldırım", height: 185)

// Argument Labels

func sayHello(firstName: String){
    let text = "Merhaba, " + firstName
    
    print(text)
}

sayHello(firstName: "Ahmet")

func sayHello(to firstName:String){
    let text = "Merhaba, " + firstName
    
    print(text)
}


sayHello(to: "Ahmet Hakan")


func sayHello(to person : String,and anotherPerson : String){
    let text = "Merhaba, " + person + " ve " + anotherPerson
    
    print(text)
}

sayHello(to: "Ahmet", and: "Hakan")

func sayHello(_ person: String){
    let text = "Merhaba, " + person
    
    print(text)
}


sayHello("Ahmet")


// default değer

func display(teamName:String,score:Int = 0){
    
    let text = teamName + ": " + String(score) // Galatasaray: 10
    print(text)
    
}

display(teamName: "Galatasaray")
display(teamName: "Galatasaray 2" , score: 10)



// Dönüş tipi ve parametreli fonksiyonlar

func carpma(firstNumber:Int,secondNumber:Int) -> Int {
    let result = firstNumber * secondNumber
    return result
}

let carpmaIslemi = carpma(firstNumber: 10, secondNumber: 7)

print(carpmaIslemi)

let diyalog = """
Soru : Bu benim sorum
Cevap : bu da call center cevabı
"""

print(diyalog)







