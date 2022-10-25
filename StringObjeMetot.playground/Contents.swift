import UIKit

var greeting = "Hello, playground"

let b: Character = "b"

var myString = ""

if myString.isEmpty {
    print("String değeri boş olamaz")
}

// interpolation
// stringleri + sembolü ile birbiri arkasına ekleyebilirsiniz

let str1 = "Hello "
let str2 = "World"
let finalString = str1 + str2

var karsilamaMetni = ""
karsilamaMetni += str1
karsilamaMetni += str2

print(karsilamaMetni)

let password = "12345678"
let count = password.count

print( count<8 ? "Şifreniz en az 8 karakter içermelidir" : "Şifre Uygundur")

let appleEmoji = "🥺"
print(appleEmoji.count)


