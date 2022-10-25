import UIKit

// Ürün
    // - var adı : String
    // var stok: Int
    // var fiyat : Double

// kendi veri tiplerimizi struct yardımıyla oluşturabiliriz

// struct ta neler var
// 1- değişkenler ve sabitler (property)
// 2 - initializers
// 3 - fonksiyonlar (method)
// 4 - enumlar başka structlar (Opsiyonel)

struct İnsan {
    var name : String
    
    func merhabaDe(){
        
        print("Merhaba \(name)")
    }
    
}

// insan türünden bir nesne oluşturmak

let insan1 = İnsan(name: "Ahmet")
print(insan1.name)

insan1.merhabaDe()

// nesnelerrr

/*
 
 struct Tshirt {
    var beden : Beden = .small
 
 }
 
 
 enum Beden {
 
 case xsmall
 case small
 case medium
 case large
 
 }
 
 let tshirt1 = Tshirt(beden: .large , renk: .yeşil)
 
 
 */
struct Car {
    var make : String
    var model : String
    var year : Int
    var topSpeed : Int
    
    func startEngine(){
        print("Üreticisi : \(make), modeli : \(model), yılı : \(year) ve maksimum hızı : \(topSpeed) olan arabanın motoru çalıştırıldı")
    }
    
    func drive(){
        print("Üreticisi : \(make), modeli : \(model), yılı : \(year) ve maksimum hızı : \(topSpeed) olan araba hareket ediyor")
    }
    
    func park(){
        print("Üreticisi : \(make), modeli : \(model), yılı : \(year) ve maksimum hızı : \(topSpeed) olan araba park halinde")
    }
}

let car1: Car = Car(make: "Mercedes", model: "E-250", year: 2010, topSpeed: 260)
let car2: Car = Car(make: "BMW", model: "5.20 d", year: 2020, topSpeed: 300)
let car3: Car = Car(make: "Volvo", model: "S90", year: 2022, topSpeed: 320)
let car4: Car = Car(make: "Ferrari", model: "İtaliano", year: 2018, topSpeed: 420)
let car5: Car = Car(make: "Ford", model: "Mustang", year: 2016, topSpeed: 450)


car1.startEngine()
car2.startEngine()
car1.drive()
car2.park()
car5.startEngine()

// initializers
// initializers -> parametreli bir fonksiyon ve compiler tarafından oluşturulur

var string = String.init()

var cr = Int.init()

var bol = Bool.init()

// kısa yöntem

var string2 = String()
var int = Int()

var bool = Bool()

var double = Double()


// initializers -> başlangıç değerleri
struct Odometer {
    var count : Int = 0
}

let odometer = Odometer()

print(odometer.count)

// Memberwise initializers
// swift tarafından tüm özelliklerin içerildiği initializer'lardır

let odometer2 = Odometer(count: 12)
print(odometer2.count)

struct Person{
   // var name : String = ""
    var name : String
}
// hatalı bir varsayılan değer kullanımı. Bu adı "" olan bir insan oluşturmaya neden olabilir !
//let person1 = Person()

let p1 = Person(name: "Ahmet")
print(p1.name)

// Custom initializer

struct Temperature {
    var celcius : Double
    
    init(celcius:Double) {
        self.celcius = celcius
    }
    
    init(fahrenheit: Double) {
        self.celcius = (fahrenheit-32) / 1.8
        
    }
    
    init(kelvin : Double){
        
        self.celcius = (kelvin-273.15)
    }
    
}

let temp1 = Temperature(celcius: 32)

// Problem : Sıcaklık bilgisini verecek kişi fahrenheit türünden anlıyor
let fahrenheit = 98.4 // kullanıcı girdisi

let celciusValue = (fahrenheit-32) / 1.8 // bilginin tür dönüşümü

let temp2 = Temperature(celcius: celciusValue)

// custom init kullanımı

let currentTemp = Temperature(fahrenheit: 98.4)

let boiling = Temperature(celcius: 100)

print(currentTemp.celcius)
print(boiling.celcius)

let freezing = Temperature(kelvin: 280)

print(freezing.celcius)

// instance methods (Nesne Metodları)

struct Size {
    var width : Double
    var height : Double
    
    func area () -> Double {
        return width * height
    }
}

let s1 = Size(width: 12.2, height: 2.78)
let area1 = s1.area()

struct KilometreSayaci {
    
    var deger : Int = 0 // varsayılan deger
    
   mutating func arttir (){
        deger += 1
    }
    
    mutating func arttir (miktar: Int){
        deger += miktar
    }
    
    mutating func reset (){
        deger = 0
    }
}


var sayac = KilometreSayaci()

sayac.arttir() // değer özelliği 1 arttı

print(sayac.deger)

sayac.arttir(miktar: 15)

print(sayac.deger)

sayac.reset()

print(sayac.deger)

// computed Properties - Hesaplanan Özellikler
// read Only - sadece okunabilir

/*
struct Sicaklik {
    var celcius : Double
    var fahrenheit : Double
    var kelvin : Double
    
    
    init(celcius:Double) {
        self.celcius = celcius
        fahrenheit = celcius * 1.8 + 32
        kelvin = celcius + 273.15
    }
    
    init(fahrenheit: Double) {
        self.celcius = (fahrenheit-32) / 1.8
        
    }
    
    init(kelvin : Double){
        
        self.celcius = (kelvin-273.15)
    }
    
    var sc1 = Sicaklik(celcius: 24)
    sc1.celcius = 32
    
}
 
 */

// fahrenheit ve kelvin celcius a bağlı olarak değişen değişken olsun

struct Sicaklik {
    var celcius : Double
    
    // read only
    var fahrenheit:Double {
        
        return celcius * 1.8 + 32
    }
    
    var kelvin : Double {
        return celcius + 273.15
    }
    
}

var s2 = Sicaklik(celcius: 10)

print(s2.fahrenheit)

s2 = Sicaklik(celcius: 12)
print(s2.fahrenheit)


// property observers

// willset = değer değişmek üzere henüz değişmedi
// didSet = değer değişti

struct AdimSayar {
    
    var adimSayisi : Int = 0 {
        willSet {
            // burası willset için olan kod bloğu
            
            // newValue yeni gelecek olan değer
            print("Adım Sayısı birazdan \(newValue) olacak")
        }
        
        didSet {
            // burası da didset kod bloğu
            // oldvalue -> yeni değer gelmeden önceki değer
           if adimSayisi > oldValue {
              // adım atılmış ilerii yönde hareket
               print("\(adimSayisi-oldValue) adım atıldı")
            }
        }
    }
}

var adimSayar1 = AdimSayar()
adimSayar1.adimSayisi = 3 // ilk çalışacak yer willset - newValue 3

adimSayar1.adimSayisi = 178

// Instance -> obje
// type -> Veri tipi (Struct)

// Type Methods and Properties
// anahtar kelimemiz static

struct OndalikliSayi {
    var deger : Double
    static var pi : Double = 3.14
}

OndalikliSayi.pi


// fonksiyonlarda static olabilir

let enKucukSayi = Double.minimum(12, 34.65)
print(enKucukSayi)

// struct ile class arasında ki temel farklar nedir

var someSize = Size(width: 250, height: 1000)
var anotherSize = someSize

someSize.width = 32
print(someSize.width)
print(anotherSize.width)


// struct nesneleri kopyalanarak taşınır birbirlerini etkilemez referans edilemez



