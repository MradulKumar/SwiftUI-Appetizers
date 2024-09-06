//
//  CustomModifiers.swift
//  SwiftUI-Appetizers
//
//  Created by Mradul Kumar  on 05/09/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(BorderlessButtonStyle())
            .listItemTint(.brandPrimary)
            .background(Color.brandPrimary.opacity(0.4))
            .cornerRadius(4.0)
    }
}
