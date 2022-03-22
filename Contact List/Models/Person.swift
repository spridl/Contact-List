//
//  Person.swift
//  Contact List
//
//  Created by Тимур on 21.03.2022.
//

import Foundation

struct Person {
    
    let name: String
    let surName: String
    let email: String
    let phoneNumber: String
    
    var fullName: String {
        "\(name) \(surName)"
    }
    
    static func getPerson(for index: Int, in data: DataManager) -> Person {
        Person(
            name: data.name[index],
            surName: data.surName[index],
            email: data.email[index],
            phoneNumber: data.phoneNumber[index]
        )
    }
}
