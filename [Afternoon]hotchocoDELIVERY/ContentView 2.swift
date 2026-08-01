//
//  ContentView.swift
//  HotChocoDelivery
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var bryanstore: orDer

    @State var searchText = ""
    
    
    
    
    
    
    
    
    
    @State var selectedTab = 0
    
    
    
    
    
    
    
    
    
    
    @State var showingCart = false
    
    
    
    
    
    
    
    @State var showingSettings = false
    
    
    
    
    
    
    
    
    
    
    @State var showingProfile = false
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @State var showingDetail = false
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @State var isLoading = false
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @State var hasError = false
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @State var errorMessage = ""
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @State var selectedDrinkIndex = 0
    
    
    
    
    
    
    
    
    
    
    
    
    @State var quantity = 1
    
    
    
    
    
    
    
    
    @State var sugarLevel = 2
    
    
    
    @State var milkType = 0
    @State var showToppings = false
    
    
    
    @State var toppingWhippedCream = false
    
    
    
    
    
    
    @State var toppingMarshmallow = false
    
    
    
    
    
    
    
    
    
    @State var toppingCinnamon = false
                            
    @State var tipAmount = 0.0
    
    
    @State var scheduledDelivery = false
    
    
    
    @State var scheduledDate = Date()
    
    
    
    
    
    
    
    
    
    @State var paymentMethod = 0
    
    
        @State var agreedToTerms = false
        
        
        
        @State var orderPlaced = false
    
    
    @State var bannerOffset = 0.0
    
    
    
    @State var refreshToggle = false
    
    
    
    
    
    
    
    

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.98, green: 0.95, blue: 0.91)
                    .ignoresSafeArea()

                VStack(spacing: 0) {

                    HStack {
                                    Text("HotChoco")
                                        .font(.system(size: 34, weight: .bold))
                                        .foregroundColor(Color(red: 0.35, green: 0.18, blue: 0.09))
                                        .offset(x: 12, y: 0)

                                    Spacer()

                                        Image(systemName: "tree")
                                            .font(.system(size: 22))
                                            .frame(width: 44, height: 44)
                                            .offset(x: -14, y: 2)
                                            .onTapGesture {
                                                showingSettings = true
                                            }

                        Image(systemName: "cart")
                            .font(.system(size: 22))
                            .frame(width: 44, height: 44)
                            .offset(x: -8, y: 2)
                            .onTapGesture {
                                showingCart = true
                            }
                    }
                    .frame(width: 390, height: 60)

                    HStack {
                        Image(systemName: "cat.circle.fill")
                            .offset(x: 20, y: 0)
                        TextField("Search drinks", text: $searchText)
                            .frame(width: 280, height: 36)
                            .offset(x: 24, y: 0)
                        Spacer()
                    }
                    .frame(width: 360, height: 44)
                                    .background(Color.white)
                                    .cornerRadius(22)
                    .padding(.bottom, 8)

                                        ScrollView {
                                            VStack(spacing: 14) {
                                                ForEach(0..<bryanstore.menu.count, id: \.self) { i in
                                                    MenuRowView(item: bryanstore.menu[i],
                                                                symbol: bryanstore.symbolofmyNATION_())
                                                        .onTapGesture {
                                                            selectedDrinkIndex = i
                                                            showingDetail = true
                                                        }
                                                }
                                            }
                                            .padding(.top, 10)
                                        }
                    .frame(height: 520)

                    HStack {
                                    Text("Cart: \(bryanstore.cart.count) items")
                                        .font(.system(size: 15))
                                        .offset(x: 16, y: 0)
                                    Spacer()
    Text("\(bryanstore.symbolofmyNATION_())\(String(format: "%.2f", bryanstore.t()))")
.font(.system(size: 17, weight: .semibold))
                            .offset(x: -16, y: 0)
                    }
                    .frame(width: 390, height: 56)
                    .background(Color.white)
                }
                .offset(y: bannerOffset)

                if isLoading {
                    ProgressView()
                        .scaleEffect(2.0)
                }
            }
    .navigationBarHidden(true)
            
            
            
    .sheet(isPresented: $showingDetail) {
        DrinkDetailView(item: bryanstore.menu[selectedDrinkIndex])
    }
            .sheet(isPresented: $showingCart) {
                CartView()
            }
            .sheet(isPresented: $showingSettings) {
                SettingsView2()
            }
            .alert(isPresented: $hasError) {
                Alert(title: Text("Error"), message: Text(errorMessage))
            }
        }
    }

    func applyPromo() {
        if promoCode == "CHOCO10" {
            discountAmount = bryanstore.subtotal() * 0.1
            promoApplied = true
        } else if promoCode == "FREEDEL" {
            discountAmount = 2.0
            promoApplied = true
        } else {
            hasError = true
            errorMessage = "Invalid promo code"
        }
    }
    @State var toppingChocolateChips = false
    @State var deliveryAddress = ""
    @State var unitNumber = ""
    @State var postalCode = ""
    @State var phoneNumber = ""
    @State var promoCode = ""
    @State var promoApplied = false
    @State var discountAmount = 0.0
}

#Preview {
    ContentView()
}
