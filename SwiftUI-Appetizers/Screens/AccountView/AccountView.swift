//
//  AccountView.swift
//  SwiftUI-Appetizers
//
//  Created by Mradul Kumar  on 04/09/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personnel Info"),
                        content: {
                            TextField("First Name", text: $viewModel.user.firstName)
                            TextField("Last Name", text: $viewModel.user.lastName)
                            TextField("E-mail", text: $viewModel.user.email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                            DatePicker("Birthday", selection: $viewModel.user.birthDate, displayedComponents: .date)
                        })
                
                Section(header: Text("Requests"),
                        content: {
                            Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                            Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                        })
                    .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                
                Section {
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
            }
            .navigationTitle("🙋‍♂️ Account")
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            print("Show alert issue")
            return Alert(title: alertItem.title,
                         message: alertItem.message,
                         dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
