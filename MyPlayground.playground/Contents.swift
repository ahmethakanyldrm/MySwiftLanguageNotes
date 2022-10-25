import UIKit

// Optionals
// ? !

// Gözle görünür ama içi boş olan kutu

var name: String = ""

// Gözle Görünmüyor henüz ama bir gün olacağı biliniyor
var age:Int? // henüz memory de yaşamıyor ama bir gün yaşayabilir yaşamayada bilir

// Nil
// değer olmayışı = nil olma durumudur

var test: String? = nil // memory de yeri yok ve henüz kullanılamaz initializer edilmemiş

// ? -> bir değer olabilir veya olmayabilir (nil)

// ----------------------------------------------------------------------------------------------------------

struct Book {
    var name:String
    var publicationYear:Int
}

let firstBook = Book(name: "Book 1" , publicationYear:1999)
let secondBook = Book(name: "Book 2" , publicationYear:1999)

// henüz yayınlanmamış bir kitap ?
// bu yanlış.Neden? Kitap 0 yılında yayınlanmış ve 2022 yaşında gibi duruyor...
let yayinlanmamisKitap = Book(name: "Book 3" , publicationYear:0)

// ----------------------------------------------------------------------------------------------------------

struct Book2 {
    var name2:String // nil olamaz
    var publicationYear2: Int? // nil olabilir
}

// nil -> değerin olmayışı
let yayinlanmamisBook = Book2(name2: "Book 1" , publicationYear2: nil)

// Optional olanların tipini belirtmek gerek

var serverResponseCode = 404 // değeri nil olamayan bir tanımlama

// var serverResponseCode2 = nil // bir değişkenin tipini belirtmeden değerini nil yapamazsın

var responseCode:Int? = 404 // şuanki değer 404 ama ilerde nil de olabilir

var sC : Int? = nil

// ----------------------------------------------------------------------------------------------------------
// Optional olan değerler ile çalışmak

// bir değerin nil olup olmadığını nasıl kontrol edersiniz? (if)

var publish:Int? = 2012


if publish != nil {
    // nil değilse
    // ! -> force-unrap operator nil olabilecek değerleri zorunlu çıkartır
    // nil değilmiş gibi kullanmak için sonuna ! eklenir. DİKKAT: O an değeri nil ise uygulama çöker
    // bu yüzden değerinin nil olmadığından önce emin olmalısınız.
    
    let actualYear = publish!
    print(actualYear)
    print(publish! + 20)
    
}


// if let

if let actualYear = publish {
    // publish nil değilse onun değerini ! ile unwrap eder ve actualYear olarak sunar
    print(actualYear)
}


if let bookYear = yayinlanmamisBook.publicationYear2 {
    print("\(bookYear)")
}


// if let else

if let year = yayinlanmamisBook.publicationYear2 {
    print
}else {
    
}

// fonksiyonlar & Opsional

let str = "123a"

let possibleNumber = Int(str) // optional sonuç verir.Neden ? Çünkü her yazı bir tam sayı ifade etmeyebilir.

// örnek "123" -> bir tam sayı olabilirken "abc" -> tam sayıya dönüşemez Bu durumda sonuç nil olur

// fonksiyon örneği

func printFullName(firstName:String, middleName:String?,lastName:String){
    // Middle name önce if let ile kontrol edilmeli sonra kullanılmalı
    //if let mid = middleName {
        
    //}
}

// bir web sitesinin içeriğini metin olarak döndürür (websitesi varsa)
func textFromUrl(url:URL) -> String? {
    return nil
}

// failable Initializers (Initializer edilemeyen objeler)

struct Cocuk {
    
    var name:String
    var monthsOld:Int
    
    init?(name:String,monthsOld:Int){
        if monthsOld < 12 || monthsOld > 36 {
            return nil
        }else {
            self.name = name
            self.monthsOld = monthsOld
        }
    }
    
}


let c1 = Cocuk(name: "Ali", monthsOld: 5)

let c2 = Cocuk(name: "Ab", monthsOld: 23)

if let cocuk = c1 {
    // buraya girmez Neden? c1 in değeri nil çünkü
}

if let cocuk2 = c2 {
    // buraya girer Neden ? Çünkü c2 != nil
    print(cocuk2.monthsOld)
}

// Optional Chaining

// xyz?.abc?.123 nil değilse devam et nil değilse devam et nil değilse sonucu ver

struct Person {
    
    var age:Int
    var residence:Residence?
}

struct Residence {
    var address: Address?
}

struct Address {
    var buildingNumber : String
    var streetName: String
    var apartmentNumber:String?
}

let person = Person(age: 24,residence: nil)

// Pek Hoş Değil
if let residence = person.residence {
    if let address = residence.address {
        if let apartmentNumber = address.apartmentNumber{
            print("Kişi \(apartmentNumber) numaralı apartmanda yaşıyor")
        }
    }
}


// Daha iyi çözüm yok mu - var

// Optional Chaining

if let apartmentNumber = person.residence?.address?.apartmentNumber{
    // zincirin kırılmaması için tüm optional değerlerden geçilmesi gerekiyor
    print("Kişi \(apartmentNumber) numaralı apartmanda yaşıyor")
}
