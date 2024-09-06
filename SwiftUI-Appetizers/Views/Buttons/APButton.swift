//
//  APButton.swift
//  SwiftUI-Appetizers
//
//  Created by Mradul Kumar  on 04/09/24.
//

import SwiftUI

struct APButton: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50, alignment: .center)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(8.0)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Test Title")
    }
}
