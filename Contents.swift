import UIKit

// ======================================

//          CASTING - REFRESHER

// ======================================
// Brain teasing this morning :)
//

// EXEMPLE
class MySuperClassAirline {
    // Parent class
    class Airline {
        var  name: String
        init(name: String) {
            self.name = name
        }
    }

    // Child classes
    class Country: Airline {
        var country: String
        init(name: String, country: String) {
            self.country = country
            super.init(name: name)
        }
    }

    class Plane: Airline {
        var airplane_type: String
        init(name: String, airplane_type: String) {
            self.airplane_type = airplane_type
            super.init(name: name)
        }
    }

    // Data
    // Does not reflect reality. This is just an exercise...
    let airlines = [
        Country(name: "Sabena", country: "Belgium"),
        Plane(name: "B737", airplane_type: "Boeing"),
        Country(name: "Air France", country: "France"),
        Plane(name: "A320", airplane_type: "Airbus")
    ]

    /*
     From Swift documentation, transformed for my case.
     Items stored in airlines array are still Country and Type instances behind the scene.
     If I iterate over the contents of the array, items I receive back are typed as Airline (parent class), and not as 'Country' or 'Type' class.
     In order to work with them as their native type, I need to check their type, or downcast them to a different type ==> use as! (force unwrap) or as? (safe way, optional. That's why the 'if let' statement in line 56 and 58) and then the type you want.
     */

    func result() {
        for airline in airlines {
            if let airline = airline as? Country {
                print("Country: \(airline.country), airline: \(airline.name)")
            } else if let airline = airline as? Plane {
                print("Airplane: \(airline.airplane_type), type: \(airline.name)")
            }
        }
    }
    
    // If not casting and I iterate through the array, only one property 'name' is available as defined in the Airline class.
    //for x in airlines {
    //    print(x.name)
    //}
}

// Controller
// Instance
let description = MySuperClassAirline()

// TextField return
description.result()
// Conclusion
print("I have \(description.airlines.count) members in my array which can be of different types!!!\nThat's why you can differentiate them by downcasting with the key word 'as!' or 'as?'")
