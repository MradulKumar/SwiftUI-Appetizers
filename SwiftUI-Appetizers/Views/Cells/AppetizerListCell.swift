//
//  AppetizerListCell.swift
//  SwiftUI-Appetizers
//
//  Created by Mradul Kumar  on 04/09/24.
//

import SwiftUI

struct AppetizerListCell: View {
    var appetizer: Appetizer
    
    var body: some View {
        HStack {
            
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90, alignment: .center)
                .cornerRadius(8.0)
            
            VStack(alignment: .leading, spacing: 10, content: {
                
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .fontWeight(.semibold)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .font(.title2)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            })
            .padding(.leading, 10)
        }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.sampleAppetizer)
    }
}
