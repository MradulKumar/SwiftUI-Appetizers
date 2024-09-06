//
//  AppetizerDetailView.swift
//  SwiftUI-Appetizers
//
//  Created by Mradul Kumar  on 04/09/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let cardWidth = UIScreen.main.bounds.width*0.8
    let cardHeight = UIScreen.main.bounds.height*0.75
    let imageHeight: CGFloat = 200.0
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        ZStack {
            VStack {
                AppetizerRemoteImage(urlString: appetizer.imageURL)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: cardWidth, height: imageHeight, alignment: .center)
                Spacer()
                
                VStack {
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(appetizer.description)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding()
                    
                }
                
                Spacer()
                
                HStack(alignment: .center, spacing: 10) {
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                }
                Spacer()
                
                Button {
                    order.add(appetizer: appetizer)
                } label: {
                    Text("$\(appetizer.priceString) - Add To Order")
                        .padding()
                        .modifier(StandardButtonStyle())
                        
                }
                .padding(.bottom, 10)
            }
        }
        .frame(width: cardWidth, height: cardHeight, alignment: .center)
        .background(Color(.systemBackground))
        .cornerRadius(24.0)
        .shadow(radius: 40)
        .overlay(XDismissButton(isShowingModel: $isShowingDetail), alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
    }
}

struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
            
            Text("\(value)")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .italic()
        }
    }
}
