//
//  SwiftUIView.swift
//  SwiftUI-Appetizers
//
//  Created by Mradul Kumar  on 05/09/24.
//

import SwiftUI

struct EmptyStateView: View {
    
    let icon: String
    let description: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(description)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .offset(y: -40.0)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(icon: "list", description: "You have no items in your order list")
    }
}
