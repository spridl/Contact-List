//
//  Person.swift
//  Contact List
//
//  Created by Тимур on 21.03.2022.
//

import UIKit

struct Person {
    
    let name: String
    let surName: String
    let email: String
    let phoneNumber: String
    
    var fullName: String {
        "\(name) \(surName)"
    }
    
    static func getPerson() -> [Person] {
        let dataManager = DataManager()
        dataManager.email.shuffle()
        dataManager.phoneNumber.shuffle()
        dataManager.name.shuffle()
        dataManager.surName.shuffle()
        
        var persons = [Person]()
        
        for index in 0 ..< dataManager.name.count {
            let person = Person(
                name: dataManager.name[index],
                surName: dataManager.surName[index],
                email: dataManager.email[index],
                phoneNumber: dataManager.phoneNumber[index]
            )
            persons.append(person)
        }
        return persons
    }
}
