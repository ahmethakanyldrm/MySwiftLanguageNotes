import UIKit

// Codable protokolü, hem Encodable hem de Decodable anlamına gelir
// NOT: Codable protokolünü destekleyen modelinizde bulunan
// tüm değişken veri tiplerinizin de codable protokolünü desteklemesi gerekir
struct Not : Codable {
    var title:String
    var text:String
    var timestamp: Date // Notun ne zaman oluşturulduğu bilgisi
}

// Bir not nesnesi oluşturma
// date() -> O an
let newNote:Not = Not(title:"Alışverişte Alınacaklar Listesi", text: "Yoğurt, Çay ve Süt Kola Yumurta Çikolata almayı unutma.", timestamp: Date())


// MARK: - ENCODE
// bir note nesnesinin plist (propertyList) formatına encode edilmesi

// elinizde ki bir nesneyi hafızaya kaydetmek istiyorsanız onu data formuna encode etmek zorundayız

// encode dosya formatlarına örnek : JSON , Plist , Mp3, MP4 ...

// PropertyListEncoder Encodable protokolünü destekleyen herhangi bir nesneyi data formuna encode eder.
let propertyListEncoder = PropertyListEncoder()


// bu fonksiyon bir throwing function dolayısıyla çalışma esnasında hata yani error fırlatabilir
// bu tür fonksiyonlar do catch bloğu içerisinde try kelimesi ile kullanılmalıdır.

// YÖNTEM 1: Fonksiyon çalıştığı esnada karşılaşılan hataları yakalamak istersek
do {
    
    let encodedNote = try propertyListEncoder.encode(newNote)
    
    
}catch{
    
    // size error adında bir değişken verir
    // bu error do bloğu içerisinde çalışan kodlarda meydana gelen hataları belirtir
    print(error)
    
}

// YÖNTEM 2: Hatanın bir önemi yok yalnızca nil olmadığı durumu arıyorsanız

if let encodedNote = try? propertyListEncoder.encode(newNote) {
    print("Encoding")
    print(encodedNote)
}



// MARK: - DECODE

if let encodedNote = try? propertyListEncoder.encode(newNote) {
        let propertyListDecoder = PropertyListDecoder()
        
    // type: Hangi Tür modele decode edilmesini istiyorsunuz ?
    // from: Hangi datayı kullanarak bu işlem yapılacak?
    
    if let decodeNote = try? propertyListDecoder.decode(Not.self, from: encodedNote) {
        print("Decoding")
        print(decodeNote)
    }
}

// MARK: - FİLEMANAGER İLE DOCUMENTs DİRECTORY KULLANIMI
// Her uygulamanın kendi Documents Directory'si vardır
// Uygulamalar yalnızca kendi klasörlerine veri yazabilir veya okuyabilir
// Uygulamanın dışında bir veriye ulaşmak istediğimizde bu durum mutlaka alert ile kullanıcıya bildirilir


// bir projenin birden fazla document directory'si olabilir. Fakat varsayılan olarak yalnızca 1 tane oluşturulur
// Bu nedenle documentDirectory bir arraydir ve biz ilk elemanına erişmek isteriz (.first)
let documentDirectory = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!

print(documentDirectory)

// documentDirectory size bir klasör verir
// bu klasör içerisinde yeni bir dosya uzantısı oluşturmanız gerekiyor

// .../Documents/notes.plist
let archiveURL = documentDirectory.appendingPathComponent("singleNote").appendingPathExtension("plist")
print(archiveURL)

// MARK: - DATA YAZMAK (ENCODE EDİLMİŞ DATANIN FİLEMANAGER İLE OLUŞTURULMUŞ URL e KAYDEDİLMESİ)

if let encodedNote = try? propertyListEncoder.encode(newNote) {
    
    // noFileProtection -> var olan dosyanın üzerine yazılmasını sağlar
    
    // datanın belirtilen bir url e yazılmasını sağlar
    print("Writing File")
   try? encodedNote.write(to: archiveURL,options: Data.WritingOptions.noFileProtection)
    
}


// MARK: - DATAYI OKUMAK

// Datan'nın özel bir initi vardır

// Data(contentsOf: ) -> parametre olarak vereceğiniz URL'de bulunan datayı kullanarak initialize edilmesini sağlar

let propertyListDecoder = PropertyListDecoder()

// Adım 1: Dosyayı data formatında okumak
if let retrievedNoteData = try? Data(contentsOf: archiveURL) {
    
    // Adım 2: propertyListDecoder kullanarak Datadan note objesi oluşturmak
    
    if let decodedNote = try? propertyListDecoder.decode(Not.self, from: retrievedNoteData) {
        print("Retrieving Not file")
        print(decodedNote)
    }
}

// MARK: - ARRAY TÜRÜNDEN VERİ KAYDETMEK

let note1 = Not(title: "Bahçe İşleri", text: "Çiçekleri Sulamayı Unutma", timestamp: Date())
let note2 = Not(title: "Kod Yaz", text: "iOS Swift Çalışmayı Unutma", timestamp: Date())
let note3 = Not(title: "Bahçe İşleri", text: "Çiçekleri Sulamayı Unutma", timestamp: Date())

let notes = [note1,note2,note3]

let notesURL = documentDirectory.appending(component: "notes").appendingPathExtension("plist")

if let encodedNotes = try? propertyListEncoder.encode(notes) {
    try? encodedNotes.write(to: notesURL,options: Data.WritingOptions.noFileProtection)
}

// MARK: - ARRAY TÜRÜNDEN VERİ OKUMAK
if let notesData = try? Data(contentsOf: notesURL) {
    if let decodeNotes = try? propertyListDecoder.decode([Not].self, from: notesData){
        print("Retreiving ")
        for not in decodeNotes {
            print(not)
        }
    }
}
