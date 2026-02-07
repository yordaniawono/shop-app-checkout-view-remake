//
//  ContentView.swift
//  ShopAppCheckoutRemake
//
//  Created by Yordani Awono on 2/5/26.
//

import SwiftUI


struct ContentView: View {
    
    @State private var cartTotal: Double = 104.25
    @State private var isPremium = true
    
    var body: some View {
        let discount = getDiscount(isPremium: isPremium, cartTotal: cartTotal)
        let finalTotal = cartTotal - discount
        
        VStack(alignment: .leading) {
            
            
            HStack(){
                
            }
            
            Text("Order summary")
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 24)
            
            HStack() {
                HStack(spacing: 12){
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color(.systemGray5))
                        .frame(width: 56, height: 56)
                        .aspectRatio(1, contentMode: .fit)
                        .overlay {
                            Image(systemName: "photo")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                        }
                    
                    Text("On Men's Cloud 6 Waterproof")
                        .font(.system(size: 15))
                }
                Spacer()
                Text("\(cartTotal, format: .currency(code: "USD"))")
                    .font(.system(size: 15))
            }
            .padding(.bottom, 20)
            
            
            HStack() {
                Text("Subtotal")
                    .font(.system(size: 15))
                Spacer()
                Text("\(cartTotal, format: .currency(code: "USD"))")
                    .font(.system(size: 15))
            }
            .padding(.bottom, 20)
            
            HStack() {
                Text("Discount")
                    .font(.system(size: 15))
                Spacer()
                Text("- \(discount, format: .currency(code: "USD"))")
                    .font(.system(size: 15))
                
            }
            .padding(.bottom, 24)
            
            
            HStack() {
                Text("Total")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                Spacer()
                Text("\(Text("USD ").foregroundStyle(.gray).fontWeight(.regular).font(.system(size: 12))) \(finalTotal, format: .currency(code: "USD"))")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
            }
            
            
            Spacer()
            
            VStack(){
                Button {
                    print("Order confirmed!")
                } label: {
                    
                    Text("Pay now")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 20))
                .tint(.indigo)
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        
    }
    
    private func getDiscount(isPremium: Bool, cartTotal: Double) -> Double {
        if isPremium {
            return cartTotal * 0.2
        } else if cartTotal > 100 {
            return cartTotal * 0.1
        } else {
            return 0
        }
    }
}

#Preview {
    ContentView()
}
