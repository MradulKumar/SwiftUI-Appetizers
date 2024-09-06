//
//  User.swift
//  SwiftUI-Appetizers
//
//  Created by Mradul Kumar  on 05/09/24.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthDate: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefills: Bool = false
}
