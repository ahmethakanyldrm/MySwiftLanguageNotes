import UIKit

// var name = "" // global scope her yerden erişilebilir

// Scope : {}

// if for class struct

var age = 24 // global scope

func printMyAge(){
    print(age)
}

printMyAge()

func printBottleCount(){
    let bottleCount = 20
    print(bottleCount)
}

// print(bottleCount) bu sabite ulaşamayız

func printTenNames(){
 var name = "Can" // local değişken
    
    for index in 1...10 {
        print("\(index): \(name)")
    }
    
//    print(index) index yalnızca for içerisinden ulaşılabilen sabittir
}

// variable shadowing

func printComplexScope (){
    let points = 100
    print(points)
    
    for index in 1...3 {
        let points = 200
        // en yakın tanımlanmış olan değişkendir
        print("Loop \(index) : \(points + index)")
    }
    
    print(points)
}

printComplexScope()

// if let kullanımlarında shadowing tercih edin. Kafa karışıklığının önüne geçin

//var name : String? = "Nadin"
//
//if let name = name {
//
//}


struct Person{
    var name:String
    var age : Int
    
    init(name:String , age:Int){
        self.name = name
        self.age = age
    }
}


let emir = Person(name: "Ahmet", age: 23)

print(emir.name)
print(emir.age)
