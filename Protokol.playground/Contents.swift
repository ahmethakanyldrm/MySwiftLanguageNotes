import UIKit

// Protokol

// bir dizi fonksiyon ve değişkenlerden oluşan bir şablondur

// Swiftte var olan bazı Protokoller

// Protocol Orianted Programming -> struct veya classların yeni özelliklere sahip olmasını sağlar
// inheritance -> dikey yapılanma
// protokol -> yatay yapılanma

// Swiftteki Protokoller

// CustomStringConvertable
// Equatable
// Comparable
// Codable

// ----------------------------

let str = "hello world"
print(str)

let number = 43
print(number)

struct Ayakkabi {
    var color: String
    var size: Int
}

let ayakkabi1 = Ayakkabi(color: "Siyah", size: 23)
print(ayakkabi1)

// CustomStringConvertible -> Nesneyi cümleye dökebilmeyi sağlar
// description adında bir read-only property ekler
struct Shoe: CustomStringConvertible {
    var color: String
    var size: Int
    var description: String{
        return "color: \(color) , size: \(size)"
    }
}

let shoe1 = Shoe(color: "Siyah", size: 45)
print(shoe1.description)



// Equatable -> Bilgi Kıyaslaması yapmayı sağlar

struct Employee : Equatable {
    var firstName:String
    var lastName:String
    var jobTitle:String
    var phoneNumber:String
    
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        // iki employee objesinin birbirine olan eşitliğini
        // hangi koşullarda sağlanacağını belirtiyoruz
        
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
}

struct Company {
    var name: String
    var employee: [Employee]
}

// uygulamaya giriş yapmış kişi
let currentEmployee = Employee(firstName: "Ahmet", lastName: "Yıldırım", jobTitle: "Software Engineer", phoneNumber: "")

// Üsüne tıklanarak seçilen kişi
let selectedEmployee = Employee(firstName: "Ahmet", lastName: "Yıldırım", jobTitle: "Software Developer", phoneNumber: "")

// iki kişiyi kıyaslamalıyız ve
// eğer birbirlerine eşitse kişi kendi bilgilerini düzenleyebilmeli
// eğer eşit değilse düzenleme özelliği kapatılmalı


// == equatable protokolünden gelir ve equatable pr. ünü desteklemeyen tiplerde çalışmaz o yüzden confirm edilmeli

if currentEmployee == selectedEmployee {
    print("Profil Düzenlenebilir")
}else {
    print("Profil Düzenlenemez başkasına bakılıyor")
}


// Comparable -> Bilgi Sıralaması

struct Employee2 : Comparable,Equatable {
    // MARK: - Properties
    var firstName:String
    var lastName:String
    var jobTitle:String
    var phoneNumber:String
    
    // MARK: - Functions
    static func == (lhs: Employee2, rhs: Employee2) -> Bool {
        // iki employee objesinin birbirine olan eşitliğini
        // hangi koşullarda sağlanacağını belirtiyoruz
        
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
    
    static func < (lhs: Employee2, rhs: Employee2) -> Bool {
        return lhs.lastName < rhs.lastName
    }
    

}

let emp1 = Employee2(firstName: "E1", lastName: "Yıldırım", jobTitle: "JT1", phoneNumber: "")
let emp2 = Employee2(firstName: "E2", lastName: "Can", jobTitle: "JT2", phoneNumber: "")
let emp3 = Employee2(firstName: "E3", lastName: "Ay", jobTitle: "JT3", phoneNumber: "")
let emp4 = Employee2(firstName: "E4", lastName: "Kas", jobTitle: "JT4", phoneNumber: "")
let emp5 = Employee2(firstName: "E5", lastName: "MÖ", jobTitle: "JT5", phoneNumber: "")

let employees = [emp3, emp1, emp5, emp4, emp2]

// SORTED(BY: )
// arrayler üzerinde çalışan bir sıralama fonksiyonu.

let sortedEmployees = employees.sorted(by: >)

for employee in sortedEmployees {
    print(employee)
}
// ---------------------------------------------------------------------------------------
// Codable -> Bilginin Dictionary formuna geçirilmesi (key-value ikilileri)


struct Employee3 : Comparable,Equatable,Codable {
    // MARK: - Properties
    var firstName:String
    var lastName:String
    var jobTitle:String
    var phoneNumber:String
    
    // MARK: - Functions
    static func == (lhs: Employee3, rhs: Employee3) -> Bool {
        // iki employee objesinin birbirine olan eşitliğini
        // hangi koşullarda sağlanacağını belirtiyoruz
        
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
    
    static func < (lhs: Employee3, rhs: Employee3) -> Bool {
        return lhs.lastName < rhs.lastName
    }
}

let bestEmployee = Employee3(firstName: "Ben", lastName: "Yılmaz", jobTitle: "Software", phoneNumber: "")

// codable protokolünü destekleyen bir veri modelinden dictionary formunda veri oluşturabilmek için
// JSONEncoder adını verdiğimiz bir class kullanılır

let encoder = JSONEncoder()

let jsonData = try! encoder.encode(bestEmployee)

let jsonString = String(data: jsonData, encoding: .utf8)

print(jsonString!)

// --------------------------------------------------------------

// kendi protokolümüzü oluşturmak

// bir değişkenin değerini veya fonksiyonun ne yaptığını protokoller belirtmez.
// Yalnızca isim ve tür belirtirler
// var name = "" -> yapılamaz yanlıştr
// String{get} -> sadece değeri okunabilir
// String{get set} -> değeri hem okunabilir hemde yazılabilir

protocol FullyNamed {
    
    var fullName:String{get}
    
    func sayFullName()
    
}
// : kullanımı her zaman inheritance anlamına gelmeyebilir.

struct Student:FullyNamed {
    
    var firstName : String
    var lastName : String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    func sayFullName() {
        print(fullName)
    }
}

let s1 = Student(firstName: "Ahmet", lastName: "Hakan Yıldırım")

s1.sayFullName()

// Design Pattern : Delegete

