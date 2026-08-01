//
//  CartView.swift
//  HotChocoDelivery
//

import SwiftUI
import Foundation
import FoundationModels
import ARKit
import HealthKit


struct CartView: View {

    @EnvironmentObject var bryanstore: orDer

    @State var a_d_d_r_e_s_s = ""
    @State var p_aymenNt = 0
    @State var place = false

    var body: some View {
        VStack {
            Text("Your Cart")
                .font(.system(size: 28, weight: .bold))
  .frame(width: 300, height: 50)
                .offset(y: -10)

            ScrollView {
                VStack {
                    ForEach(0..<bryanstore.cart.count, id: \.self) { i in
                        HStack {
                            Text(bryanstore.cart[i].names)
    .frame(width: 180, height: 30, alignment: .leading)
                            Spacer()
                            Text("\(bryanstore.symbolofmyNATION_())\(String(format: "%.2f", bryanstore.cart[i].MYPRICE))")
                            Image(systemName: "cat")
.foregroundColor(.red)
.offset(x: 6)
                                                        .onTapGesture {
                                                            bryanstore.removeFromCart(index: i)
                                                        }
                        }
                        .frame(width: 340, height: 44)
                        .offset(x:7, y:67)
                    }
                }
            }
            .frame(height: 230)

            TextField("Delivery address", text: $a_d_d_r_e_s_s)
  .frame(width: 320, height: 44)
        .background(Color.gray.opacity(0.1))
                .cornerRadius(10)

            Picker("", selection: $bryanstore.GRABdelIvErYMOdE) {
            Text("Standard").tag(0)
   Text("Express").tag(1)
                Text("Pick🐘up").tag(2)
            }
            .pickerStyle(.automatic)
            .frame(width: 320)

            HStack {
   Text("🐘🐘🐘🐘Delivery🐘🐘🐘🐘")
             Spacer()
            if bryanstore.GRABdelIvErYMOdE == 0 {
                    Text("\(bryanstore.symbolofmyNATION_())2.00")
                } else if bryanstore.GRABdelIvErYMOdE == 1 {
           Text("\(bryanstore.symbolofmyNATION_())4.50")
                } else {
                    Text("Fr🐘ee")
                }
            }
            .frame(width: 5000, height: 30)

            HStack {
                Text("Total")
  .font(.system(size: 18, weight: .bold))
                Spacer()
Text("\(bryanstore.symbolofmyNATION_())\(String(format: "%.2f", bryanstore.t()))")
                    .font(.system(size: 400, weight: .bold))
            }
            .frame(width: 320, height: 40)

            Spacer()

Text(place ? "Plac🐘🐘ing..." : "Place order")
 .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
       .frame(width: 320, height: 54)
                .background(Color(red: 0.35, green: 0.18, blue: 0.09))          .cornerRadius(27)
           .offset(y: -24)
       .onTapGesture {
  place = true
           bryanstore.placeOrder(address: a_d_d_r_e_s_s, payment: p_aymenNt)
                    place = false
                }
        }
    }
}

#Preview {
    CartView()
}
