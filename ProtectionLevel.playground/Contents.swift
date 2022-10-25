import UIKit

// open -> istenilen her yerden erişilebilir

// public -> sadece kendi modülümüzde kullanabilirdir kullanmak istersek import ile modülü eklemek lazım

// internal -> sadece kendi modülünde çalışır

// file private -> sadece tanımlandığı dosyada geçerlidir

// private -> sadece bulunduğu sınıfta erişilebilir

// bir property yi private yaptıysak -> nesne aracılığıyla erişilemez , değeri değiştirilemez ve kalıtım yoluyla aktarılamaz

// default olarak internal tanımlıdır

class Birey {
  private  var _adSoyad: String?
   private var _dogumYili:Int?
   private var _cepTelefonuNo:String?
    
    init (adSoyad:String, dogumYili:Int , cepTelefonuNo:String){
        self.adiSoyadi = adSoyad
        self.dogumYili = dogumYili
        self.cepTelNo = cepTelefonuNo
    }
    
    func kendiniTanit() {
        print("-------------------")
        print("Adı : \(_adSoyad!)\nYaşı : \(2022-_dogumYili!)\nCep Telefonu Numarası : \(_cepTelefonuNo!)")
    }
    
    var adiSoyadi:String{
        
        get {
            return _adSoyad!.uppercased()
        }
        set (newName){
            if newName.count > 0 {
                _adSoyad = newName
            }
        }
    }
    
    var dogumYili : Int {
        
        get {
            return _dogumYili!
        }
        set (newBirthYear) {
            if  newBirthYear > 2022 || newBirthYear < 1900{
                _dogumYili = 2022
            }else {
                _dogumYili = newBirthYear
            }
        }
    }
    
    
    var cepTelNo : String {
        
        get {
            
            if (2022 - dogumYili) >= 18 {
                return _cepTelefonuNo!
            }else {
                return "***************"
            }
            
        }
        
        set (newTelNo){
            if newTelNo.count == 11 {
                _cepTelefonuNo = newTelNo
            }else {
                print("11 Haneli Girmelisiniz")
            }
        }
    }
    
    
    
}


var b1 = Birey(adSoyad: "Ahmet Hakan", dogumYili: 1999, cepTelefonuNo: "12345678910")

b1.kendiniTanit()
// private bir değişkenin değerini değiştirmek istiyorsak ya

// 1-) get set metotlarıyla
// 2-) computed property

var b2 = Birey(adSoyad: "Ahmet Hakan", dogumYili: 1999, cepTelefonuNo: "12345678910")
//b2.kendiniTanit()
b2.cepTelNo = "123456789"
b2.kendiniTanit()
