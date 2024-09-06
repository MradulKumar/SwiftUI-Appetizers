//
//  OrderViewModel.swift
//  SwiftUI-Appetizers
//
//  Created by Mradul Kumar  on 05/09/24.
//

import Foundation
import SwiftUI

final class OrderViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    
    @Published var selectedAppetizer: Appetizer?
    @Published var isShowingDetail: Bool = false
    
    func loadOrders() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.0) { [self] in
            self.isLoading = false
        }
    }
    
    func orderButtonTapped() {
        alertItem = AlertContext.orderCreated
    }
}
