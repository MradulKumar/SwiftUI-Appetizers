//
//  XDismissButton.swift
//  SwiftUI-Frameworks
//
//  Created by Mradul Kumar  on 04/09/24.
//

import SwiftUI

struct XDismissButton: View {
    
    @Binding var isShowingModel: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                isShowingModel = false
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.black)
                        .opacity(0.4)
                    
                    Image(systemName: "xmark")
                        .foregroundColor(Color.white)
                        .imageScale(.large)
                }
                .padding(8)
            }
        }
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton(isShowingModel: .constant(false))
    }
}
