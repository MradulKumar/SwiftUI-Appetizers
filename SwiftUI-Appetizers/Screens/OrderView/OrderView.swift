//
//  OrderView.swift
//  SwiftUI-Appetizers
//
//  Created by Mradul Kumar  on 04/09/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    @StateObject var viewModel = OrderViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                                .onTapGesture {
                                    viewModel.selectedAppetizer = appetizer
                                    viewModel.isShowingDetail = true
                                }
                        }
                        .onDelete { indexSet in
                            order.remove(at: indexSet)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .disabled(viewModel.isShowingDetail)
                    .onAppear {
                        viewModel.loadOrders()
                    }
                    .blur(radius: viewModel.isShowingDetail ? 15 : 0)
                    
                    Button {
                        viewModel.orderButtonTapped()
                    } label: {
                        let title = "$\(order.totalPriceString) - Order Now"
                        Text(title)
                            .padding()
                            .modifier(StandardButtonStyle())
                    }
                    .padding()
                }
                .navigationTitle("🧾 Order")
            }
            
            if order.items.isEmpty {
                EmptyStateView(icon: "empty-order", description: "You have no items in your order list. Please add an appetizer!")
            }
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
