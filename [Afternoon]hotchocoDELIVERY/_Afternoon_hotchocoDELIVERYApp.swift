//
//  _Afternoon_hotchocoDELIVERYApp.swift
//  [Afternoon]hotchocoDELIVERY
//
//  Created by Bryan Nguyen on 1/8/26.
//

import SwiftUI

struct DATA: Identifiable, Codable {
    var id: Int
    var whatsappstatus: Int        // 1 preparing, 2 out for delivery, 3 delivered, 4 cancelled
    var drinkName: String
    var address: String
    var idwpay: Int       // 0 card, 1 paynow, 2 cash on delivery
    var whereisitplacedAt: String
}
@main
struct _Afternoon_hotchocoDELIVERYApp: App {
    @ObservedObject var bryanstore = orDer()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(bryanstore)
        }
    }
}
