import UIKit

// https://apple.com
// https://appstore.apple.com/us/app/keynote/id4903847584?name=12

// Network Request
// 1- Type
// 2- Headers
// 3-Body

// Request Type
// HTTP METHOD -> GET, POST

//Get -> Sunucudan bilgi almak için kullanılır
// Post -> Sunucuya bilhi göndermek için kullanılır


// Headers
// aslında bir dictionary (Key, Value)
// Body de yer alan bilginin hangi formatta olduğunu belirtir (örn: JSON , XML)
// Tarayıcınız hakkında bilgiler verir

// Body
// Örneğin bir websitesini yüklediğinizde HEADER da veri tipi html olacaktır. Body de ise bir HTML dosyası yer alacaktır.
// Bir iphone uygulamasının atacağı post request ise Body alanında muhtemelen JSON veya XML türünden data içerecektir

// NOT: Body de yer alan bilginin formatı sabit değildir. Sorguya ve sunucuya göre değişkenlik gösterir

// MARK: - URL OLUŞTURMAK
let url = URL(string: "https://apple.com")!
url.scheme
url.host
url.query


// MARK: - NETWORK REQUEST lerin OLUŞTURULMASI VE ÇALIŞTIRILMASI

// Data Task ile Request oluşturmak
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data {
        if let string = String(data:data, encoding: .utf8){
           // print(string)
        }
      //  print(data as NSData)
    }
}

// Oluşturulan request'in çalıştırılması
 //task.resume()


// asenkron kodlar main queue da çalışmaz başka bir queue da çalışır uygulamanın kilitlenmesini engeller

// MARK: - API'ler İle Çalışmak

// dictionary olarak alınan parametrelerin url in sonuna eklenmesini sağlayan fonksiyon
extension URL {
    
    func withQueries (_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
}


let apodUrl = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!

let apiTask = URLSession.shared.dataTask(with: apodUrl) { data, _, error in
    if let data = data {
        if let responseString = String(data:data , encoding: .utf8) {
            print(responseString)
        }
    }
}

apiTask.resume()

// MARK: - QUERY KULLANIMI İLE API SORGULARI

let baseUrl = URL(string: "https://api.nasa.gov/planetary/apod")!

let query: [String:String] = [
    "api_key":"DEMO_KEY",
    "date":"2021-03-05"
]

let apiUrl = baseUrl.withQueries(query)!

let queryTask = URLSession.shared.dataTask(with: apiUrl) { (data, _ , error) in
    if let data = data {
        if let responseString = String(data:data , encoding: .utf8){
            print(responseString)
        }
    }
}

queryTask.resume()
