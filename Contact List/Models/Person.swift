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
        let email = dataManager.email.shuffled()
        let phoneNumber = dataManager.phoneNumber.shuffled()
        let name = dataManager.name.shuffled()
        let surname = dataManager.surName.shuffled()
        
        var persons = [Person]()
        
        for index in 0 ..< name.count {
            let person = Person(
                name: name[index],
                surName: surname[index],
                email: email[index],
                phoneNumber: phoneNumber[index]
            )
            persons.append(person)
        }
        return persons
    }
}
