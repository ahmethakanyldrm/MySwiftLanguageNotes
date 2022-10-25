import UIKit


// EXTENSİONS

// extension ile computed property eklemek

extension UIColor {
    static var favoriteColor: UIColor {
        return UIColor(red: 0.23, green: 0.12, blue: 0.56, alpha: 1.0)
    }
}

// Instance veya Type Methodları eklemek

// USE CASE: Tekil kelimeleri çoğul hale getirmek istiyorsunuz
// fakat string üzerinde bu işi yapabilecek metod yok

var elma = "elma"
var masa = "masa"
var okul = "okul"


extension String {
    
    mutating func pluralized (name: String) -> String {
        // kompleks bir fonksiyon yaptığı iş ise var olan string değerini çoğul hale getirmek
        return "\(name)lar"
    }
    
}

print(elma.pluralized(name: elma))

// kodunuzu organize etmek için kullanılan extensionslar

class Restaurant {
//    var name: String
//    var menuItems: [MenuItem]
//    var servers: [Employee]
//    var cookingStaff : [Employee]
//    var customers: [Customer]
    
}

// MARK: - Restaurant Method
extension Restaurant {
    // func add(menuItem:MenuItem)
    // func remove()
    // func welcome()
    
}


struct Employee {
    var firstName: String
    var lastName: String
    var jobTitle: String
    var phoneNumber: String
}

extension Employee : Equatable {
    static func == (lhs:Employee, rhs:Employee) -> Bool {
        return lhs.firstName == rhs.firstName &&
        lhs.jobTitle == rhs.jobTitle &&
        lhs.lastName == rhs.lastName &&
        lhs.phoneNumber == rhs.phoneNumber
    }
}
