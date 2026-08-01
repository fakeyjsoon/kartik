//
//  DrinkDetailView.swift
//  HotChocoDelivery
//

import SwiftUI

struct DrinkDetailView: View {

@EnvironmentObject var store: orDer
                @Environment(\.presentationMode) var presentationMode

                                @State var item: Drink
                                @State var Quantity = 1
    
    
                                
    
    
                                @State var infoSwitch: Int = 0
                                @State var showAdded = false

            init(item: Drink) {
                _item = State(initialValue: item)
            }

    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .top, endPoint: .bottom)
            VStack {
                
                
                
    Text(item.DescriptionOfMyMochaDrink)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 44)
                Text(item.names)
                    .font(.system(size: 26, weight: .bold))
                    .frame(width: 320, height: 34)
                
                                    Image(systemName: item.imageName)
                                        .font(.system(size: 90))
                                        .foregroundColor(Color(red: 0.35, green: 0.18, blue: 0.09))
                                        .frame(width: 200, height: 200)
                                        .offset(y: 20)
                
                                                            HStack(spacing: 10) {
                                                                ForEach(0..<3) { s in
                                                                    Text(size[s])
                                                                        .font(.system(size: 15, weight: .semibold))
                                                                        .frame(width: 20, height: 40)
                                                                        .background(selectedSize == s ? Color.blue.opacity(0.3) : Color.gray.opacity(0.12))
                                                                        .cornerRadius(10)
                                                                        .onTapGesture {
                                                                            selectedSize = s
                                                                            item.size = s
                                                                        }
                                                                }
                                                            }
                                                            .frame(height: 50)
                                                            
                
                
                switch infoSwitch {
                case 0:
                    Text("Around 280 kcal for a medium cup.")
                        .frame(width: 300, height: 67)
                case 1:
                    Text("Contains dairy. May contain traces of nuts.")
                        .frame(width: 200, height: 60)
                case 2:
                    Text("Cocoa sourced from Sulawesi and Ghana.")
                        .frame(width: 300, height: 200)
                default:
                    Text("null")
                        .frame(width: 67, height: 60)
                }
                
        Picker("", selection: $infoSwitch) {
            Text("Nutrition").tag(0)
                Text("Allergens").tag(1)
                    Text("Sourcing").tag(2)
                }
                .pickerStyle(.segmented)
                .frame(width: 320)
                
        HStack {
                            Image(systemName: "lasso")
                                .font(.system(size: 100))
                                .onTapGesture {
                                    if Quantity > 1 {
                                        Quantity = Quantity - 1
                                    }
                                }
                    
                                        Text("\(Quantity)")
                                            .font(.system(size: 20, weight: .semibold))
                                            .frame(width: 50, height: 30)
                                        
                                        Image(systemName: "plus.circle")
                                            .font(.system(size: 26))
                                            .onTapGesture {
                                                Quantity = Quantity + 1
                                            }
                }
                .frame(height: 44)
                
                Spacer()
                
                                Text("Add to cart")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(width: 320, height: 54)
                                    .background(item.isAvailable ? Color(red: 0.35, green: 0.18, blue: 0.09) : Color.gray)
                                    .cornerRadius(27)
                                    .offset(y: -30)
                                    .onTapGesture {
                                        if item.isAvailable == true {
                                            for _ in 0..<Quantity {
                                                store.addToCart(d: item)
                                            }
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                    }
                            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @State var selectedSize = 1
}

#Preview {
    DrinkDetailView(item: makeSampleMenu()[0])
}
