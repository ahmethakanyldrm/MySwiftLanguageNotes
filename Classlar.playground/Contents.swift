import UIKit

// Classlar
// struct ile class arasında ki farklar
// kalıtım , subclass , superclass

class Person {
    var name : String
    // structlarda kendi kendine oluşturulan initializer vardı
    // classlarda yok initleri kendimiz yazıyoruz
    
    init(name: String){
        self.name = name
    }
    
    func sayHello (){ // func oluşturmak struct ile aynı
        print("Hello My name is \(name)")
    }
}

// nesne oluşturmak - struct ile aynı

var p1 = Person(name: "Ahmet")
print(p1.name)
p1.sayHello()

// classları structlardan farklı yapan ilk özellik
// Inheritance - kalıtım
// üst sınıf alt sınıf ilişkisi kurmaya yarar
// Canlı -> Memeliler -> İnsan -> Çalışan -> Yazılım Mühendisi -> iOS Geliştirici
// Canlı superClass memeliler canlı sınıfının subclass ı
// insan memelilerin subclassı

// Base Class Oluşturmak yani en üst class

class Vehicle{
    var currentSpeed = 0.0
    
    var description : String {
        return "Araç saatte \(currentSpeed) km hız ile hareket ediyor"
    }
    
    func makeNoise (){
        // herhangi bir aracın ne tür bir sese sahip olduğunu bilemediğimiz için bu fonksiyon boş kaldı
        
    }
}

let someVehicle = Vehicle()

print("Vehicle \(someVehicle.description)")

// subclass (Alt sınıf) oluşturmak

// class someClass : SomeSUperClass {

class Bicycle : Vehicle {
    
    var hasBasket = false // bisikletin ön sepeti var mı yok mu
    
}

let b1 = Bicycle()

b1.hasBasket = true
b1.currentSpeed = 23

print("Bicycle \(b1.description)")

class Tandem : Bicycle {
    var currentNumberOfPassengers = 0
}

var t1 = Tandem()
t1.hasBasket = true
t1.currentSpeed = 12
t1.currentNumberOfPassengers = 2
print("Tandem \(t1.description)")

// override methods and properties
// method ve özelliklerin yeniden yazılması

class Train : Vehicle {
    
    override func makeNoise() {
        print("Çuf Çuf !!!!")
    }
}

let train1 = Train()
train1.makeNoise()

class Car : Vehicle {
    var gear = 1
    
    override var description: String {
        // super üst sınıftaki değişken fonksiyon a erişmeyi sağlar
       return super.description + " Ve vitesi \(gear)"
        
    }
}

let car = Car()
car.currentSpeed = 200
car.gear = 5
print("Car : \(car.description)")


// Override : Initializer

class İnsan {
    var name : String
    
    init (name:String){
        self.name = name
    }
}

class Ogrenci : İnsan {
    
     var enSevdiğiDers:String
     
    init(name : String , enSevdiğiDers:String){
        // ilk başta kendi sınıfımızın propunu doldurmak gerek
        self.enSevdiğiDers = enSevdiğiDers
        super.init(name: name)
    }
    
    
}

let ogr = Ogrenci(name: "Ahmet", enSevdiğiDers: "Swift")


ogr.name
ogr.enSevdiğiDers

let ogr2 = Ogrenci(name: "Hakan", enSevdiğiDers: "Flutter")
let ogr3 = ogr2

ogr3.name = "Deneme"

print(ogr3.name)
print(ogr2.name)

// Structlardan farklı olarak , objenin kendisi değil memory de ki referansı kopyalanır

// class mı yoksa struct mı kullanılmalı

// yeni öğrenen kişiler struct ile başlamalı


