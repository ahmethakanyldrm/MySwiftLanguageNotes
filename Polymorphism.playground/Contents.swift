import UIKit

class GeometrikSekil {
    var genelAdi:String
    
    init (genelAdi:String){
        self.genelAdi = genelAdi
    }
    
    func alanHesapla() -> Double{
        
        return 0
    }
        func cevreHesapla() -> Double{
        
        return 0
    }
    
    
}


class Dikdortgen : GeometrikSekil{
    var kenar1: Double
    var kenar2: Double
    
    init(kenar1:Double,kenar2:Double) {
        self.kenar1 = kenar1
        self.kenar2 = kenar2
        super.init(genelAdi: "Dikdörtgen")
    }
    
    override func alanHesapla() -> Double {
        return kenar1 * kenar2
    }
    
    override func cevreHesapla() -> Double {
        return 2 * (kenar1 + kenar2)
    }
}


class Kare : Dikdortgen {
     init(kenar: Double) {
        super.init(kenar1: kenar, kenar2: kenar) // genel adı dikdörtgen oldu
        self.genelAdi = "Kare" // genel adı kare olarak güncellendi
    }
}

class Daire : GeometrikSekil {
    var yaricap: Double
    
    init (yaricap:Double){
        self.yaricap = yaricap
        super.init(genelAdi: "Daire")
    }
    
    override func alanHesapla() -> Double {
        return Double.pi * yaricap * yaricap
    }
    
    override func cevreHesapla() -> Double {
        return 2 * Double.pi * yaricap
    }
}

var d1 : Dikdortgen = Dikdortgen(kenar1: 10, kenar2: 20)
print(d1.alanHesapla())
print(d1.cevreHesapla())
print(d1.genelAdi)
print(d1.kenar1)
print(d1.kenar2)

print("-----------------------------------")
var k1 : Kare = Kare(kenar:10)
print(k1.alanHesapla())
print(k1.cevreHesapla())
print(k1.genelAdi)
print(k1.kenar1)
print(k1.kenar2)
