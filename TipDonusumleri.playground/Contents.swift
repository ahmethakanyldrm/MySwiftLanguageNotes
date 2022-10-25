import UIKit

// tipler arası dönüşüm

// func getClientPet() ->  // Cat,Dog,Bird => Animal
// let get = getClientAnimal() ya bird ya cat ya da dog dönecek bilinmiyor

/*
 
 func walk (dog:Dog){
 
 }
 
 func clientLitterBox(cat:Cat) {
 
 }
 
 func cleanCage(bird:Bird){
 
 }
 
 let pets = allClientPets() // tüm evcil hayvanları getirir
 
 for pet in pets {
 
    if let dog = pet as? Dog {   -> as? Dog bir köpek mi demektir.
        walk(dog:dog)
 }else if let cat = pet as? Cat { -> pet bir kedi mi kediyse içeriye gir
        cleanLitterBox(cat:cat)
 }else if let bird = pet as? Bird {
        cleanCage(bird:bird)
 }
 
 as! -> force cast eğer alt sınıf üst sınıftan türemiyorsa sonuç nil olur ve uygulama çöker. tercih edilmemeli
 
 
 }
 */

class Animal{}

class Cat: Animal{}

class Dog: Animal{}

class Bird: Animal{}

// eğer bir arrayde birden fazla veri tipi aynı anda kullanılabiliyorsa o arrayin veri tipi ne ?
// {String} {Bool} {Int} -> Hayır

// ----------------------------------------------------------------------------

// ANY anahtar kelimesi
// Any -> Her tür veri tipi olabilir

var array: [Any] = [5, "Can", 4.78, Dog()]

// arrayin sıfırıncı elemanını bir Int olarak kullanabiliyor muyum ?

if let firstItem = array[0] as? Dog {
    // arrayin sıfırıncı elemanı bir Int türündedir ve değeri firstItem a atanmıştır.
    print(firstItem)
}
