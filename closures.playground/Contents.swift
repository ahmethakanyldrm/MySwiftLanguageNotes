import UIKit

// klasik fonksiyon

func sum (numbers: [Int]) -> Int {
    return 100
}

// Closure

let sumClosure = { (numbers: [Int]) -> Int in
    return 100
}

let result = sumClosure([1,2,3])

print(result)

// Swiftte tüm değerlerin bir tipi vardır
// Örn: Int Bool String
// Closure Tipi -> aldığı parametreler ve geriye döndürdüğü değerle belirtilir

// sumClosure için veri tipi : (numbers: [Int]) -> Int

// MARK: - CLOSURE 1
// parametresiz ve dönüşsüz

let printClosure = { () -> Void in
    print("Parametresiz ve Dönüş tipsiz Closure")
    
}

printClosure()

// MARK: - CLOSURE 2
// parametreli dönüşsüz

let complexPrintClosure = { (string:String) -> Void in
    print(string)
}

complexPrintClosure("Hello")

// MARK: - CLOSURE 3
// parametresiz dönüşlü

let randomNumber = { () -> Int in
    return Int.random(in: 1...100)
}

randomNumber()

// MARK: - CLOSURE 4
// parametreli dönüşlü

let complexRandomNumber = {
    (minValue: Int , maxValue:Int) -> Int in
    
    return Int.random(in: minValue...maxValue)
}

complexRandomNumber(10,45)
complexRandomNumber(10,45)

// MARK: - Argüman Olarak Kullanmak
// Closure ların argüman olarak kullanılması

let playList = ["Track 3","Track 1","Track 2"]

let sortedPlayList = playList.sorted { (left , right) in
    return left < right
}
print(sortedPlayList)

let sortedClosure = { (left: String, right: String) -> Bool in
    return left < right
}

let foo = playList.sorted(by: sortedClosure)
print(foo)


// Closure ların kısa kullanımı
// parametre isimleri $ işareti kullanılabilir

// ("str1", "str2") -> $0 - str1, $1 - str2

let sortedPlaylist2 = playList.sorted { return $1 < $0 }
print(sortedPlaylist2)

// Koleksiyonlar üzerinde tanımlı olan diğer closure örnekleri

// map , filter , sorted , reduce

// MARK: - MAP
// arrayler üzerinde tanımlı olan bir method
// array de bulunan her bir elemanın ne şekilde değişeceğini belirtir

let names = ["Ali","Veli","Ahmet","Hakan","Yağız"]

// Closure olmadan...
// boş bir array oluşturulur . Bu array ad + soyad bilgilerini tutucak

var fullNames = [String]()

for name in names {
    let fullName = name + " " + "Kabak"
    fullNames.append(fullName)
}


// Closure ile
let fullNames2 = names.map { (name) -> String in
    return name + " " + "Kabak"
}

// sadeleştirilmiş closure
let fullNames3 = names.map{ $0 + " Kabak" }
print(fullNames3)

// MARK: - FİLTER
// Bu fonksiyon belirtmiş olduğumuz kritere göre yeni bir array oluşturur
let nums = [4,8,12,56,34,78]

// closure olmadan.....

var numbersLessThan20 = [Int]()
for i in nums {
    if i < 20 {
        numbersLessThan20.append(i)
    }
}

print(numbersLessThan20)

// closure ile

let lessThan20 = nums.filter { (number) -> Bool in
    // number arrayin o anki elemanı
    // return edilmesi gereken bilgi ise o elemanın yeni oluşturulacak arrayde olup olmamsı bilgisi
    return number < 20
}

print(lessThan20)

// sadeleştirilmiş closure
let lt20 = nums.filter{ $0 < 20 }
print("Sadeleştirilmiş closure : \(lt20)")

// MARK: - REDUCE
// arrayde bulunan tüm elemanları kullanarak tek bir eleman oluşturur

let nums2 = [1,6,3,5,4,8]

let reduceClosure = nums2.reduce(0) { (currentTotal , newValue) -> Int in
    return currentTotal + newValue
}

print(reduceClosure)

// sadeleştirilmişş closure

let total3 = nums2.reduce ( 0 , {$0 + $1} )
print(total3)
