import UIKit


// For döngüleri - for-in
// kaç kez tekrar etmesi gerektiğini bildiğimiz durumlarda kullanılır

for index in 1...10 {
    print("Sayi : \(index)")
}
print("-------------")

// döngüde kaçıncı elemanda olduğunuzu bilmek istemiyorsanız
for _ in 1...20 {
    print("Hello")
}

var names = ["Ahmet","Hakan","Yıldırım"]

// names dizisindeki tüm elemanlar için çalışacak
// her çalıştığında name parametresinin değeri o anki elemana eşit olacak
// bu tür döngüler kaç kez çalışacağını arrayin eleman sayısında kendi hesaplar

for name in names {
   print("Merhaba \(name)")
}

// ek bilgi Stringlerde aslında bir koleksiyondur
// "merhaba" -> ["m","e","r","h","a","b","a"]

for harf in "merhaba" {
    print("Harf : \(harf)")
}

// bir array üstünde çalışan for döngüsünde hem elemanların index,
// hem de kendi değerlerine aynı anda ulaşmak isterseniz
// array.enumerated() -> [(index,değer)]

for (index,harf) in "Merhaba".enumerated() {
    print("\(index).harf : \(harf)")
}


// for-in döngüleri ve dictionaryler

var vehicles = ["Bisiklet":3,"Motor":5,"Araba":1]

for (aracName,miktar) in vehicles {
    print("\(miktar) adet \(aracName) var ")

}
// dictionary'ler asla sıralı değildir


// while döngüsü fazla kullanılmaz

// koşula bağlı olarak çalışır

var numberOfLives = 3

/*
 while numberOfLives > 0 {
    hamleniYap()
    canSayısınıGüncelle()
    
 }
 
 */

var stillAlive = true
while stillAlive {
    // hayatta ise çalışacak...
    numberOfLives -= 1
    
    if numberOfLives == 0 {
        stillAlive = false
    }
    
}

// bazen döngü tamamlanmadan bitirmek istersiniz
// yöntem : break

for index in -3...3 {
    print(index)
    
    if index == 0 {
        break //index 0 olduğu zaman döngü kırılır.Artık index değeri de artmaz
    }
    
}


