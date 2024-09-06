//
//  AppetizerListViewModel.swift
//  SwiftUI-Appetizers
//
//  Created by Mradul Kumar  on 04/09/24.
//

import Foundation
import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false

    @Published var selectedAppetizer: Appetizer?
    @Published var isShowingDetail: Bool = false

    func viewAppeared() {
        getAppetizers()
    }
    
    private func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
}
