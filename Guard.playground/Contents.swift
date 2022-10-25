import UIKit

/* func dogumGunuMuziginiCal() {
 
 if dogumGunuBugunMu {
        if !davetliListesi.isEmpty {
            
            if pastaUzerindekiMumHazirMi {
                    
                    Doğum gÜNÜ Müziği çalma zamanı...
            }
        }
    }

}



func dogumGunuMuziginiCal() {
    guard dogumGunuBugunMu else {
        // doğum günü bugün değilse buraya girer
        return
        // else den sonra return yazmak zorundayız
    }
    
    // bugün ise burdan devam eder
    
    guard !davetListesi.isEmpty else {
        // Kimse Partide değil
    }
    
    guard pastaUzerindekiMumHazirMi else {
        // Mumlar hazır değil
        return
    }
}

 */

// Kötü Kod
func divide(_ number:Double, by divisor: Double){
    if divisor != 0 {
        let result = number / divisor
        print(result)
    }
}


func divide(_ number:Double, by divisor: Double){
    guard divisor != 0 else {return}
}

// guard with Optionals

struct Book {
    var title: String
    var price: Double
    var pages: Int
}

// Kütüphaneye kitap eklemek için kullanılıyor

func processBook(title: String?,price: Double?,pages: Int?){
    if let title = title , let price = price , let pages = pages {
        let book = Book(title: title, price: price , pages: pages)
    }
}

func processBook2(title: String?,price: Double?,pages: Int?){
    guard let theTitle = title , let thePrice = price , let thePages = pages else { return }
    
    let book = Book(title: theTitle, price: thePrice , pages: thePages)
    
}

