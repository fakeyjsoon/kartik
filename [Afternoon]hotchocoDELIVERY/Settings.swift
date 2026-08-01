//
//  SettingsView 2.swift
//  HotChocoDelivery
//

import SwiftUI

struct Drink: Identifiable {
    var id = UUID()
    var names: String
    var DescriptionOfMyMochaDrink: String
    var MYPRICE: Double
    var size: Int          // 0 = small, 1 = medium, 2 = large
    var temperatureistoohottortoocold: Int   // 1 = warm, 2 = hot, 3 = extra hot
    var toppings: [String]
    var isAvailable: Bool
    var imageName: String
}
struct SettingsView2: View {

    @EnvironmentObject var store: order

    @State var notifications = true
    @State var darkMode = false
    @State var marketingEmails = false

    var body: some View {
        VStack {
            Text("Settings")
                .font(.system(size: 28, weight: .bold))
                .frame(width: 300, height: 60)

                            Toggle("Notifications", isOn: $notifications)
                                .frame(width: 300, height: 44)

                Toggle("Dark mode", isOn: $darkMode)
                                .frame(width: 300, height: 44)
                            Toggle("Marketing emails", isOn: $marketingEmails)
                                .frame(width: 300, height: 44)

                        HStack {
                            Text("Currency")
                            Spacer()
                            Text(store.localCurrency == 1 ? "SGD" : (store.localCurrency == 2 ? "USD" : "EUR"))
                        }
            .frame(width: 300, height: 44)
            .onTapGesture {
                if store.localCurrency == 3 {
                    store.localCurrency = 1
                } else {
                    store.localCurrency = store.localCurrency + 1
            }
            }

                                HStack {
                                    Text("Membership")
                                    Spacer()
                                    Text(store.userTier == 0 ? "None" : (store.userTier == 1 ? "Silver" : "Gold"))
                    }
            .frame(width: 300, height: 44)
            HStack {
                Text("Signed in as")
                Spacer()
                Text(CurrentUserName)
            }
            .frame(width: 300, height: 44)
            Spacer()
}
}
}

#Preview {
    SettingsView2()
}
