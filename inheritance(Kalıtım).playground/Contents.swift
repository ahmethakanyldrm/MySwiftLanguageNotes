import UIKit


// Kalıtım - Inheritance

struct DersNot {
    var dersAdi:String
    var harfNot: Character
    var sayisalNot: Int
    var kredi: Int
    
}


class Kisi {
    
    var adi:String
    var soyadi: String
    var dogumYili : Int
    init(adi:String , soyadi: String , dogumYili: Int ) {
        self.adi = adi
        self.soyadi = soyadi
        self.dogumYili = dogumYili
    }
}


class Ogrenci : Kisi{
    var dersler: [DersNot] = []
    func notKaydet(ders:DersNot) {
        dersler.append(ders)
    }
    func dersleriListele() {
        
        for ders in dersler {
            print("Derslerin Adı : \(ders.dersAdi)")
            print("Harf Notu : \(ders.harfNot)")
            print("Sayısal Notu : \(ders.sayisalNot)")
            print("Dersin Kredisi : \(ders.kredi)")
        }
        print("----------------")
    }
    
}

let ahmet : Kisi = Kisi(adi: "Ahmet", soyadi: "Yıldırım", dogumYili: 1999)
let jane : Ogrenci = Ogrenci(adi: "Jane", soyadi: "Brown", dogumYili: 2000)

print(ahmet.adi)
print(jane.adi)

print(jane.dersler)

let programming = DersNot(dersAdi: "Swift ", harfNot: "A", sayisalNot: 3, kredi: 4)

jane.notKaydet(ders: programming)

jane.dersleriListele()


class Personel{
    var adiSoyadi: String
    var yasi: Int
    var departman: String
    var maas: Int
    
    init(adiSoyadi: String,yasi:Int, departman:String, maas:Int) {
        print("Personel init çalıştı")
        self.adiSoyadi = adiSoyadi
        self.yasi = yasi
        self.departman = departman
        self.maas = maas
    }
    
    func bilgileriGoster () {
        print("""
Adı : \(adiSoyadi)
Yaşı : \(yasi)
Departman : \(departman)
Maaşı : \(maas)

""")
    }
}


class Yonetici : Personel{
    var gorevi: String
    
     init(adiSoyadi: String, yasi: Int, departman: String, maas: Int, gorevi:String) {
         print("Yönetici init çalıştı")
        self.gorevi = gorevi
        super.init(adiSoyadi: adiSoyadi, yasi: yasi, departman: departman, maas: maas)
    }
    

    
    override func bilgileriGoster() {
        print("""
Adı : \(adiSoyadi)
Yaşı : \(yasi)
Departman : \(departman)
Maaşı : \(maas)
Görevi : \(gorevi)
""")
    }
}

let personel1: Personel = Personel(adiSoyadi: "ahmet", yasi: 23, departman: "Yazılım", maas: 23000)

let yonetici1: Yonetici = Yonetici(adiSoyadi: "ahmet", yasi: 23, departman: "Yazılım", maas: 23000,gorevi: "Yönetici")

yonetici1.bilgileriGoster()
