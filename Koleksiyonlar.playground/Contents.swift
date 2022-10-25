import UIKit

// arrayler
// aynı türden verileri bir arada tutabilen yapılardır

// array tanımlama
// [eleman1,eleman2,eleman3....]

var names: [String] = ["Can","Ahmet","Hakan"]
var names2 = ["Can","Ahmet","Hakan"]

var numbers = [1,2,3,4,5,6,7,8,9,25]

var bools = [true,false]

// xyz elemanı bu dizide var mı ?

if numbers.contains(25) {
    print("Bu dizide 25 sayısı bulunuyor")
}

// let ile tanımlanan bir diziye eleman eklenemez veya çıkartılamaz

// array tipleri
// elemanı olmayan bir array tanımlama
var takipciler : [String] = []
var myArray:Array<Int> = [] // sıklıkla kullanılmaz
// tercih edilen kullanım
var yaslar = [Int]()

// arrayler ile çalışmak

var sifirlar = [Int](repeating: 0, count: 100)

// bir array de kaç eleman var

let nameCount = names.count
let ages = numbers.count

// sıfır elemanlı bir array nasıl anlaşılır
// yöntem 1 = count == 0
// yöntem 2 = isEmpty

numbers.isEmpty

names.isEmpty

myArray.isEmpty

if myArray.isEmpty {
    print("myarray dizisinde hiç eleman bulunmuyor")
}

// arraylerde index
// index ile elemanlara ulaşmak

var meyveler = ["Armut","Şeftali","Muz","Elma"]

let ilkMeyve = meyveler[0]

// length -> count
let sonMeyve = meyveler[meyveler.count-1]

meyveler[2] = "Ananas"

print(meyveler)

// arraylere yeni eleman eklemek
//yöntem1: += ile
//yöntem:  array.append(eleman)

meyveler.append("Karpuz")
print(meyveler)

meyveler += ["Kiraz"]
print(meyveler)

// istenilen bir indexe eleman eklemek

var heights = [12.5,23,45.7,56.7]

heights.insert(0.45, at: 2)
print(heights)

// arrayden eleman silmek
// yöntem: remove(at: index)

heights.remove(at: 1)
print(heights)

// sonuncu elemanı silmek
heights.removeLast()
print(heights)

// tüm elemanları silmek
heights.removeAll()
print(heights)

// birden fazla dizinin bir araya gelerek oluşturduğu diziler

let number1 = [1,2,3,4,5,6]
let number2 = [7,8,9]
let allNumbers = number1 + number2


// çok boyutlu diziler

/*
 X O X -> array1
 O O X -> array2
 X X O -> array3
 */



let array1 = ["X","O","X"]
let array2 = ["O","O","X"]
let array3 = ["X","X","O"]

let gameBoard:[[String]] = [array1,array2,array3]

gameBoard[0]
gameBoard[1]
gameBoard[2]

gameBoard[0][0]
gameBoard[1][1]
gameBoard[2][1]

print(gameBoard)

// Dictionary -> Sözlük

// dictionary gösterimi
// [key:value, key2:value2 , key3:value3]

// Her key özel olmalıdır. Yani tekrar edemez (Tc Kimlik No gibi)

// dictionary tanımlaması

var scores = ["Galatasaray":89, "Beşiktaş":88, "Fenerbahçe":87]

scores["Galatasaray"]

// boş dictionary tanımlaması

var myDict = [String:Int]() // tercih edilen yöntem
var myDict2 = Dictionary<String,Int>()
var myDict3 : [String : Int] = [:]

scores["Galatasaray"] = 90

// değeri güncellerken eski değerine ulaşmak









