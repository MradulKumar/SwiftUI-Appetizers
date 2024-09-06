//
//  Order.swift
//  SwiftUI-Appetizers
//
//  Created by Mradul Kumar  on 05/09/24.
//

import Foundation
import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    func add(appetizer: Appetizer) {
        items.append(appetizer)
    }

    func remove(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    var totalPrice: Double {
        return items.reduce(0) { $0 + $1.price }
    }
    
    var totalPriceString: String {
        let price = String(format: "%.2f", totalPrice)
        return price
    }
}

