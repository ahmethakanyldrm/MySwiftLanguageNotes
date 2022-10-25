import UIKit
// willSet ve didSeti kullanabilmek için başlangıç değeri tanımlamak gerek
class Pozitif {
    var pozitifDeger: Int = 0 {
        willSet (yeniDeger){
            // değer atanmadan önce çalışır
            // Bu kod bloğu çalıştıktan sonra değer atanır
            // newValue tutulur
            print("Merhaba 1")
            print("Pozitif değişken değeri :: \(pozitifDeger) inden \(yeniDeger) e güncellenicek")
          
        }
        
        didSet {
            // değer atandıktan sonra çalışır
           // oldValue tutulur
            print("merhaba 2")
            if pozitifDeger < 0 {
                pozitifDeger = oldValue
                print("Negatif değer giremezsiniz")
            }
            print("Pozitif değişken değeri \(pozitifDeger) değerinden \(oldValue) değerine güncellendi")
        }
    }
}

var d1 = Pozitif()
d1.pozitifDeger = -10
print(d1.pozitifDeger)


class Mesaj {
    var gonderilecekMesaj:String = "" {
        
        didSet {
            // hem eski değere erişebiliyoruz hem de yeni değere
            // değişken değerine müdahale edebiliyoruz
            if gonderilecekMesaj.count == 0 {
                gonderilecekMesaj = oldValue
                
                print("!!!!!!!!! mesajınızı boş giremezsiniz.")
            }else{
                mesajKarakterSayisi = gonderilecekMesaj.count
                degismeSayisi += 1
            }
        }
    }
    
    var mesajKarakterSayisi : Int = 0
    var degismeSayisi : Int = 0
    
    func bilgileriGoster() {
        print("-----------------------")
        print("Mesaj Değeri : \(gonderilecekMesaj)\nKarakter Sayısı: \(mesajKarakterSayisi)\nDeğişme Sayısı : \(degismeSayisi)")
    }
}

var message = Mesaj()
message.bilgileriGoster()
message.gonderilecekMesaj = "Yeni bir mesajın var !!"
message.bilgileriGoster()
message.gonderilecekMesaj = ""
message.bilgileriGoster()

var ad: String = "Ahmet" {
    willSet {
        
    }
    didSet {
        
    }
}
