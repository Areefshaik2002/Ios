import Foundation


struct CartItem {
    let name: String
    let price: Double
    var quantity: Int
    
    var totalPrice: Double {
        return price * Double(quantity)
    }
}


class ShoppingCart {
    private var items: [CartItem] = []
    
    
    func addItem(_ item: CartItem) {
        if let index = items.firstIndex(where: { $0.name.lowercased() == item.name.lowercased() }) {
            items[index].quantity += item.quantity
        } else {
            items.append(item)
        }
        print("\(item.quantity) \(item.name)(s) added to the cart.")
    }
    
   
    func removeItem(named name: String) {
        if let index = items.firstIndex(where: { $0.name.lowercased() == name.lowercased() }) {
            print("\(items[index].name) removed from the cart.")
            items.remove(at: index)
        } else {
            print("Item not found in the cart.")
        }
    }
    

    func displayCart() {
        if items.isEmpty {
            print("The cart is empty.")
        } else {
            print("\nCart Contents:")
            for item in items {
                print("- \(item.name): ₹\(item.price) x \(item.quantity) = ₹\(item.totalPrice)")
            }
            print("Total Cost: ₹\(totalCost())\n")
        }
    }
    
    
    func totalCost() -> Double {
        return items.reduce(0) { $0 + $1.totalPrice }
    }
    
   
    func clearCart() {
        items.removeAll()
        print("The cart has been cleared.")
    }
}


func startShoppingApp() {
    let cart = ShoppingCart()
    
    while true {
        print("""
        \nShopping Cart Application
        1. Add Item
        2. Remove Item
        3. View Cart
        4. Clear Cart
        5. Exit
        Enter your choice:
        """, terminator: " ")
        
        if let choice = readLine() {
            switch choice {
            case "1":
                print("Enter item name:", terminator: " ")
                guard let name = readLine(), !name.isEmpty else {
                    print("Invalid name. Please try again.")
                    continue
                }
                
                print("Enter item price:", terminator: " ")
                guard let priceInput = readLine(), let price = Double(priceInput), price > 0 else {
                    print("Invalid price. Please try again.")
                    continue
                }
                
                print("Enter item quantity:", terminator: " ")
                guard let quantityInput = readLine(), let quantity = Int(quantityInput), quantity > 0 else {
                    print("Invalid quantity. Please try again.")
                    continue
                }
                
                cart.addItem(CartItem(name: name, price: price, quantity: quantity))
                
            case "2":
                print("Enter the name of the item to remove:", terminator: " ")
                guard let name = readLine(), !name.isEmpty else {
                    print("Invalid name. Please try again.")
                    continue
                }
                cart.removeItem(named: name)
                
            case "3":
                cart.displayCart()
                
            case "4":
                cart.clearCart()
                
            case "5":
                print("Exiting the application. Thank you for using the cart!")
                return
                
            default:
                print("Invalid choice. Please try again.")
            }
        }
    }
}
startShoppingApp()
