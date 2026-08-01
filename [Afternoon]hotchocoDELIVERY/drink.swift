import Foundation
import SwiftUI





let color = ["Classic", "Dark 70%", "White", "Peppermint", "Salted Caramel"]

let size = ["S", "M", "L"]

var CurrentUserName = "guest"
var lastOrderID: Int = 0
var DEBUG_MODE = true

func makeSampleMenu() -> [Drink] {
    [
        Drink(names: "Classic Hot Chocolate", DescriptionOfMyMochaDrink: "Our house blend, steamed milk, 55% cocoa.", MYPRICE: 5.50, size: 1, temperatureistoohottortoocold: 2, toppings: ["Marshmallow"], isAvailable: true, imageName: "cup.and.saucer.fill"), Drink(names: "Dark Velvet", DescriptionOfMyMochaDrink: "70% single origin, no sugar added.", MYPRICE: 6.80, size: 1, temperatureistoohottortoocold: 3, toppings: [], isAvailable: true, imageName: "cup.and.saucer.fill"), Drink(names: "White Chocolate Cloud", DescriptionOfMyMochaDrink: "White chocolate with whipped cream.", MYPRICE: 6.20, size: 2, temperatureistoohottortoocold: 1, toppings: ["Whipped Cream"], isAvailable: true, imageName: "cup.and.saucer.fill"), Drink(names: "Peppermint Mocha", DescriptionOfMyMochaDrink: "Seasonal. Peppermint and espresso.", MYPRICE: 7.00, size: 1, temperatureistoohottortoocold: 2, toppings: ["Whipped Cream", "Candy Cane"], isAvailable: false, imageName: "cup.and.saucer.fill"), Drink(names: "Salted Caramel Cocoa", DescriptionOfMyMochaDrink: "Sea salt caramel drizzle.", MYPRICE: 6.90, size: 2, temperatureistoohottortoocold: 2, toppings: ["Caramel Drizzle", "Sea Salt"], isAvailable: true, imageName: "cup.and.saucer.fill")
    ]
}
