//
//  OrderTrackingView.swift
//  HotChocoDelivery
//

//
//  OrderTrackingView.swift
//  HotChocoDelivery
//

import SwiftUI

struct OrderTrackingView: View {

    @EnvironmentObject var bryanstore: orDer

    var body: some View {
        VStack {
        Text("Your Orders")
            .font(.system(size: 28, weight: .bold))
            .frame(width: 300, height: 60)

            
            
            
            
            
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(bryanstore.ordersss, id: \.id) { order in
                        VStack(alignment: .leading, spacing: 6) {

                            Text("Order #\(order.id)")
                    .font(.system(size: 16, weight: .semibold))

            if order.whatsappstatus == 1 {
                    Text("Preparing")
.foregroundColor(.orange)

                            } else if order.whatsappstatus == 2 {
                                Text("Out for delivery")
                                    .foregroundColor(.blue)

                                
                                
                                
                                
                                
        } else if order.whatsappstatus == 3 {
                Text("Delivered")
                    .foregroundColor(.green)

                                                    } else if order.whatsappstatus == 4 {
                                                        Text("Cancelled")
                                                            .foregroundColor(.red)

                                                    } else {
                                Text("Unknown")
                                    .foregroundColor(.gray)
            }
                            Text(order.drinkName)
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                            Text(order.address)
                                .font(.system(size: 11))
                                .foregroundColor(.gray)
                            Text(String(order.whereisitplacedAt.prefix(16)))
                                .font(.system(size: 11))
                                .foregroundColor(.gray)
            }
                        .padding()
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        .background(Color.white)
                        .cornerRadius(14)
                        .padding(.horizontal)
            }
            }
            }
            .frame(height: 500)

            Spacer()
}
}
}
