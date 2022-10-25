import UIKit

var greeting = "Hello, playground"

var yas : String = "Hello"

print(yas)

var x : Int = 10

print(x)

// mantıksal operatörler

// == eşit mi
// != eşit değil mi
// && ve
// || veya
// ! değil


// if yapıları

let kaynamaNoktasi = 100

if(kaynamaNoktasi>=100){
    print("Su kaynıyor")
}

print("Burası devam ediyor")

let kaynamaNoktasi2 = 78
if(kaynamaNoktasi2>=100){
    print("Su Kaynıyor")
}else{
    print("Su kaynamıyor")
}

let isiklarAcikMi = true

// dakika cinsinden
let acikKalmaSuresi = 12

// Işıklar açıksa ve açık kalma süresi 5 dk nın üstündeyse....

if (isiklarAcikMi == true && acikKalmaSuresi > 5){
    print("Işıkları kapatmalısın")
}

if (isiklarAcikMi && acikKalmaSuresi > 5){
    print("Işıkları kapatmalısın")
}else{
    print("Işıklar 5 dk dan kısa bir süredir açık veya ışıklar kapalı")
}

// If - Else If

var yarisiBitirmeSirasi = 3

if yarisiBitirmeSirasi == 1{
    print("Tebrikler yarışı birincilikle bitirdiniz. Altın madalya Sizin")
}else if yarisiBitirmeSirasi == 2{
    print("Tebrikler yarışı ikincilikle bitirdiniz. Gümüş madalya Sizin")
}else{
    print("Üzgünüm Birinci veya İkinci olamadınız")
}

// Boolean değerler

let number = 1000

let isSmallNumber = number < 1000


let hizLimiti = 120
let benimHizim = 89
let limitiAstimMi = benimHizim > hizLimiti

var karYagiyorMu = false

if karYagiyorMu {
    
}else {
    print("Kar Yağmıyor")
}

if !karYagiyorMu {
    
    
}

let sicaklik = 26

// sıcaklık 20 dereceden büyük eşit veya 25 dereceden küçük eşit mi ?
// [20,25]

if sicaklik >= 20 && sicaklik <= 25{
    print("Sıcaklık güzel")
}else if sicaklik < 20{
    print("Hava Soğuk")
}else {
    print("Cehennemi yaşıyoğğğ")
}


var telefonSarjdaMi = false

var bataryaGucuVarMi = true

// || -> true , true -> true
// || -> true , false -> true
// || -> false , true -> true
// || -> false , false -> false

if telefonSarjdaMi || bataryaGucuVarMi {
    print("Telefonu Kullanabilirsin")
}else {
    
    print("Kullanamazsın")
    
}


// -----------------------------

// Switch Yapıları

let tekerlekSayisi = 2

switch tekerlekSayisi {
case 1:
    print("Tek tekerlekli")
    break
case 2:
    print("2 tekerlekli")
case 3:
    print("3 tekerlek")
case 4:
    print("4 tekerlek")

default:
    print("Fazla tekerlek")
    break
    
}
let karakter = "z"
switch karakter {
    
case "a","e","i","o","ö","u","ü":
    print("karakter sesli")
default:
    print("karakter sessiz")
}

// aralık tanımlama
// x...y -> x ve y dahil
// x..<y -> x dahil y dahil değil

let mesafe = 15

switch mesafe {
    
case 0...10:
    break
case 11..<20:
    break
default:
    break
}


// ternary operator

var largest:Int

let a = 15
let b = 5


largest = a > b ? a : b

