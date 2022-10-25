import UIKit

// enums
// enum isimleri Structlarda olduğu gibi büyük harfle başlar
// case isimleri küçük harfle başlar
// Oluşturulan enum objesine yeni caseler eklenemez
// sabit sayıda ve isimdedirler

enum Yon {
    case kuzey
    case guney
    case dogu
    case bati
    
}

// enum kullanımı

var currentYon = Yon.kuzey

let eskiYon: Yon = .guney

print(currentYon)

currentYon = .guney

// kontrol mekanizmaları ile enum kullanımı

// switch ler enumlar için idealdir

switch currentYon {
case .kuzey :
    print("Kuzey Yönünde ilerliyoruz")
    
case .bati:
    print("Batı Yönünde ilerliyoruz")
    
case .dogu:
    print("Doğu Yönünde ilerliyoruz")
    
case .guney:
    print("Güney Yönünde ilerliyoruz")
   
    
}

// tip güvenliği ile enum kullanımı

struct Movie {
    var name:String
    var releaseYear:Int
    var genre:String
}

let movie1 = Movie(name: "Parazit", releaseYear: 2019, genre: "Drama")

// Problem : Genre bir standarda sahip değil Drama drama dram rama olabilir
// Çözüm : Genre bir enum olabilir

enum Kategori {
    case aksiyon
    case drama
    case macera
    case belgesel
    case bilimKurgu
}

struct Film {
    var ad: String
    var cikisYili: Int
    var kategori: Kategori
}


let film1 = Film(ad: "Parazit", cikisYili: 2019, kategori: Kategori.bilimKurgu)

// enumlar çoğunlukla bir şeyin tipini ifade etmek için kullanılır

enum KoltukTipi {
    case camKenari
    case orta
    case koridor
}


enum Cinsiyet {
    case erkek
    case kadin
}
