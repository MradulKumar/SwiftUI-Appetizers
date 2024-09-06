//
//  Alert.swift
//  SwiftUI-Appetizers
//
//  Created by Mradul Kumar  on 04/09/24.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: - Network Alerts
    static let invalidURL = AlertItem(title: Text("URL Error"),
                                      message: Text("There was an issue in contacting the server. Please try again later or contact support."),
                                      dismissButton: Alert.Button.default(Text("Ok")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid response from the server. Please try again later or contact support."),
                                           dismissButton: Alert.Button.default(Text("Ok")))
    
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received is invalid. Please try again later or contact support."),
                                       dismissButton: Alert.Button.default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection or contact support."),
                                            dismissButton: Alert.Button.default(Text("Ok")))
    
    //MARK: - Form/Account Alerts
    static let invalidForm = AlertItem(title: Text("Form Error"),
                                       message: Text("Please fill all the fields"),
                                       dismissButton: Alert.Button.default(Text("Ok")))
    
    static let invalidEmail = AlertItem(title: Text("Form Error"),
                                        message: Text("Email is invalid"),
                                        dismissButton: Alert.Button.default(Text("Ok")))
    
    static let invalidUserData = AlertItem(title: Text("Form Error"),
                                           message: Text("Unable to save/retrieve user. Please check form again."),
                                           dismissButton: Alert.Button.default(Text("Ok")))
    
    static let savedUserData = AlertItem(title: Text("Profile Saved"),
                                         message: Text("Your profile is successfully saved."),
                                         dismissButton: Alert.Button.default(Text("Ok")))
    
    //MARK: - Order Alerts
    static let orderError = AlertItem(title: Text("Order Error"),
                                      message: Text("There is some error in order creation."),
                                      dismissButton: Alert.Button.default(Text("Ok")))
    
    static let orderCreated = AlertItem(title: Text("Order Created"),
                                        message: Text("Order has been created successfully."),
                                        dismissButton: Alert.Button.default(Text("Ok")))
    
}
