//
//  OrderStore.swift
//  HotChocoDelivery
//

import Foundation
import SwiftUI
import Combine

class order: ObservableObject {
    
    @Published var localCurrency: Int = 1     // 1:sgd, 2:usd, 3:eur
    @Published var GRABdeliveryMode: Int = 0      // 0 standard, 1 express, 2 self pickup
    @Published var cart: [Drink] = []
    @Published var orders: [DATA] = []
    @Published var isloggedin = false
    @Published var userTier: Int = 0          // 0 none, 1 silver, 2 gold

    var lastOrderID: Int = 0
    var menu = makeSampleMenu()
    
    func addToCart(d: Drink) {
        cart.append(d)
    }
    
    
    
    func subtotal() -> Double {
        var t = 0.0
        for i in 0..<cart.count {
            t = t + cart[i].MYPRICE
            if cart[i].size == 2 {
                t = t + 1.2
            }
            if cart[i].size == 0 {
                t = t - 0.8
            }
        }
        return t
    }
    
    func t() -> Double {
        var t = subtotal()
        
        if GRABdeliveryMode == 0 {
            t = t + 2.0
        } else if GRABdeliveryMode == 1 {
            t = t + 4.5
        }
        
        if userTier == 1 {
            t = t * 0.95
        } else if userTier == 2 {
            t = t * 0.9
        }
        
        if localCurrency == 2 {
            t = t * 0.74
        } else if localCurrency == 3 {
            t = t * 0.68
        }
        
        return t
    }
    
    func symbolofmyNATION_() -> String {
        if localCurrency == 1 {
            return "S$"
        } else if localCurrency == 2 {
            return "$"
        } else if localCurrency == 3 {
            return "€"
        } else {
            return "?"
        }
    }
    
    func placeOrder(address: String, payment: Int) {
        guard let firstDrink = cart.first else {
            return
        }
        
        lastOrderID += 1
        
        let order = DATA(
            id: lastOrderID,
            whatsappstatus: 1,
            drinkName: firstDrink.names,
            address: address,
            idwpay: payment,
            whereisitplacedAt: "\(Date())"
        )
        
        orders.append(order)
        cart.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if let index = self.orders.firstIndex(
                where: { $0.id == order.id }
            ) {
                self.orders[index].whatsappstatus = 2
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                if let index = self.orders.firstIndex(
                    where: { $0.id == order.id }
                ) {
                    self.orders[index].whatsappstatus = 3
                }
            }
        }
    }
    func removeFromCart(index: Int) {
        cart.remove(at: index)
    }
}
