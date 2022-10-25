import UIKit

extension URL {
    
    func withQueries (_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
}


// JSON temelleri

/*
 
 {
     "name": "Emirhan",
     "favorite_movie": {
         "title":"Minions",
         "release_year": "2017"
     }
 }
 
*/

// JSON ve Swift benzerlikleri

// { } -> Dictionary (Key: Value)
// [ ] -> Array
// " " -> String
// sayılar ve bool değerler " " ile belirtilmez . 12 ve true

// JSON ARRAYLERİ
/*
{
    "movies": [
        {
            "title": "Finding Dory",
            "release_year": 2016
        },
        {
            "title": "Finding Dory",
            "release_year": 2016
        }
    ]
}
 */
// JSON -> [String: Any]

// MARK: - JSONDAN SWİFT VERİ MODELLERİNE DÖNÜŞÜM

let baseUrl = URL(string: "https://api.nasa.gov/planetary/apod")!

let query: [String:String] = [
    "api_key":"DEMO_KEY",
    "date":"2021-03-05"
]

let apiUrl = baseUrl.withQueries(query)!

let queryTask = URLSession.shared.dataTask(with: apiUrl) { (data, _ , error) in
    let jsonDecoder = JSONDecoder()
    if let data = data {
        if let dictionary = try? jsonDecoder.decode([String:String].self, from: data) {
//            print(dictionary["date"])
//            print(dictionary["title"])
            print(dictionary)
        }
       
    }
}

//queryTask.resume()

// MARK: - JSON'dan Özel Veri Tiplerine Dönüştürme

// apiden gelen datanın json formatı

/*
 
 "date":"2017-05-03",
 "explanation":"Açıklama Metni"
 "hdurl":"Yüksek Çözünürlükte olan görselin URL'i"
 "media_type":"image"
 "service_version":"Api nin versiyonu"
 "title":"başlık"
 "url":"görselin standart url'i"
 */

struct PhotoInfo : Codable{
    var title: String
    var description : String
    var url: URL
    var copyRight : String?
    
    // eğer tanımlamış olduğumuz değişkenlerin isimleri JSON da ki keylerden farklı ise o zaman Codingkeys enum ını tanımlayarak her bir değişkenimizin JSON karşılığında ki adını belirtmemiz gerekir
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "explanation"
        case url = "url"
        case copyRight = "copyright"
    }
}


let jsonQueryTask = URLSession.shared.dataTask(with: apiUrl) { (data, _ , error) in
    let jsonDecoder = JSONDecoder()
    if let data = data {
        do {
             let photoInfoObject = try jsonDecoder.decode(PhotoInfo.self, from: data)
            let title = photoInfoObject.title
            let url = photoInfoObject.url
            print(title)
            print(url)
        } catch  {
            print(error)
        }
    }
}

// jsonQueryTask.resume()

// network kodlarını fonksiyona taşıma
// Completion Handler :
/*
 // Bu kod background threadle main thread arasında uyumsuzluk çıkardığı için çalışmaz
 func fetchPhotoInfo () -> PhotoInfo  {
     let baseUrl = URL(string: "https://api.nasa.gov/planetary/apod")!

     let query: [String:String] = [
         "api_key":"DEMO_KEY",
         "date":"2021-03-05"
     ]

     let apiUrl = baseUrl.withQueries(query)!
     
     // asenkron çalışan kod bloğundan main threade bir şey dönemeyiz
     
     let dataTask = URLSession.shared.dataTask(with: apiUrl) { (data, _ , error) in
         let jsonDecoder = JSONDecoder()
         if let data = data {
             do {
                 let photoInfoObject = try jsonDecoder.decode(PhotoInfo.self, from: data)
                 print(photoInfoObject)
                 return photoInfoObject
             } catch  {
                 print(error)
             }
         }
     }
     dataTask.resume()
 }
 */
// Completion Handler a sahip bir fonksiyonun kullanımı
// fetchPhotoInfo { (photoInfo) in
//    // T zamanında çalışacak bir kod bloğu
//    print(photoInfo)
//}


// fetchPhotoInfo fonksiyonunu başka bir class içerisine almak

class NetworkController {
    // escaping : closure içinde ki kod senkron değilde asenkron çalışacağını bildirir
    func fetchPhotoInfo (completion: @escaping(PhotoInfo?) -> Void)  {
        let baseUrl = URL(string: "https://api.nasa.gov/planetary/apod")!

        let query: [String:String] = [
            "api_key":"DEMO_KEY",
            "date":"2021-03-05"
        ]
        let apiUrl = baseUrl.withQueries(query)!
        // asenkron çalışan kod bloğundan main threade bir şey dönemeyiz
        let dataTask = URLSession.shared.dataTask(with: apiUrl) { (data, _ , error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let photoInfoObject = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                // print(photoInfoObject)
               completion(photoInfoObject)
            }else {
                completion(nil)
            }
        }
        dataTask.resume()
    }
}
let networkController = NetworkController()
networkController.fetchPhotoInfo { (photoInfo) in
    print(photoInfo)
}
