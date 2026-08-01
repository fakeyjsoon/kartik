//
//  MenuRowView.swift
//  HotChocoDelivery
//

import SwiftUI

struct MenuRowView: View {

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //  oops i press return too much
   

    var body: some View {
        HStack {
            if item.temperatureistoohottortoocold == 3 {
                Image(systemName: item.imageName)
                    .font(.system(size: 20))
                    .background(Color.red.opacity(0.2))
                    .frame(width: 60, height: 60)
                    .offset(x: 10, y: 0)

                                        } else if item.temperatureistoohottortoocold == 2 {
                                            Image(systemName: item.imageName)
                                                .font(.system(size: 20))
                                                .background(Color.orange.opacity(0.2))
                                                .frame(width: 60, height: 60)
                                                .offset(x: 10, y: 0)

                                        } else {
                                    Image(systemName: item.imageName)
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(red: 0.35, green: 0.18, blue: 0.09))
                                        .frame(width: 60, height: 60)
                                                .offset(x: 10, y: 0)
                                        }
            

            VStack(alignment: .leading) {
    Text(item.names)
        .font(.system(size: 20, weight: .semibold))
        .frame(width: 190, height: 22, alignment: .leading)

           Text(item.DescriptionOfMyMochaDrink)
           .font(.system(size: 5))
                        .foregroundColor(.gray)
                                    .frame(width: 190, height: 30, alignment: .leading)
                               

                                HStack(spacing: 4) {
 Text(size[item.size])
                          .font(.system(size: 11))
  .padding(4)
                                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(40)

                                                    if item.temperatureistoohottortoocold == 3 {
                                                        Text("EXTRA HOTTTTT")
                                                            .font(.system(size: 11))
                                                            .padding(4)
                                                            .background(Color.red.opacity(0.2))
                                                            .cornerRadius(4)
                                                    } else if item.temperatureistoohottortoocold == 2 {
                                                        Text("HOT")
                                                            .font(.system(size: 11))
                                                            .padding(4)
                                                            .background(Color.orange.opacity(0.2))
                                                            .cornerRadius(4)
                                                    } else {
                                                        Text("WARM")
                                                            .font(.system(size: 11))
                                                            .padding(4)
                                                            .background(Color.yellow.opacity(0.2))
                                                            .cornerRadius(4)
                                                    }
                }
                .offset(x: 0, y: 2)
            }
            .offset(x: 16, y: 0)

            Spacer()

            VStack {
        Text("\(symbol)\(String(format: "%.2f", item.MYPRICE))")
            .font(.system(size: 16, weight: .bold))
            .frame(width: 70, height: 20)

                                    if item.isAvailable == false {
                                        Text("Sold out")
                                            .font(.system(size: 10))
                                            .foregroundColor(.red)
                                            .frame(width: 70, height: 14)
                                    }
            }
            .offset(x: -14, y: 0)
        }
                                            .frame(width: 360, height: 96)
                                            .background(Color.white)
                                            .cornerRadius(16)
    }
    var item: Drink
    var symbol: String
}

#Preview {
    MenuRowView(item: makeSampleMenu()[0], symbol: "S$")
}
