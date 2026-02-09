//
//  ContentView.swift
//  ShopAppCheckoutRemake
//
//  Created by Yordani Awono on 2/5/26.
//

import SwiftUI


struct ContentView: View {
    
    private func getDiscount(isPremium: Bool, cartTotal: Double) -> Double {
        if isPremium {
            return cartTotal * 0.2
        } else if cartTotal > 100 {
            return cartTotal * 0.1
        } else {
            return 0
        }
    }
    
    @State private var cartTotal: Double = 104.25
    @State private var isPremium = true
    @State private var discountCode = ""
    
    
    
    var body: some View {
        let discount = getDiscount(isPremium: isPremium, cartTotal: cartTotal)
        let finalTotal = cartTotal - discount
        
        VStack(alignment: .leading) {
            
            
            
            ZStack{
                Text("Review & Pay")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                HStack {
                    Image(systemName: "xmark")
                        .padding(.leading, 20)
                        .font(.system(size: 24))
                        
                    Spacer()
                }
            }
            .padding(.vertical, 20)
            
            Text("Order summary")
                .font(.system(size: 24))
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)
            
            HStack() {
                HStack(spacing: 12){
                    RoundedRectangle(cornerRadius: 10
                    )
                        .stroke(Color(.systemGray5))
                        .frame(width: 64, height: 64)
                        .aspectRatio(1, contentMode: .fit)
                        .overlay {
                            Image("oncloud6wpf")
                                .resizable()
                                .scaledToFit()
                                .padding(6)
                        }
                    
                    Text("On Men's Cloud 6 Waterproof")
                        .font(.system(size: 15))
                }
                Spacer()
                Text("\(cartTotal, format: .currency(code: "USD"))")
                    .font(.system(size: 15))
            }
            .padding(.bottom, 20)
            .padding(.horizontal, 20)
            
            
            HStack(spacing: 14){
                TextField("Discount code or gift card", text: $discountCode)
                    .font(.system(size: 15))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .frame(height: 56)
                    .background(Color(.systemBackground))
                    .overlay (
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray.opacity(0.4), lineWidth: 1)
                    )
                
                Button {
                    print("discount applied!")
                } label: {
                    Text("Apply")
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 12)
                        .foregroundColor(.gray)
                        .frame(height: 56)
                        .background(Color(.systemGray6))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(.gray.opacity(0.3), lineWidth: 1)
                        )
                }
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .disabled(true)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
            
            HStack() {
                Text("Subtotal")
                    .font(.system(size: 15))
                Spacer()
                Text("\(cartTotal, format: .currency(code: "USD"))")
                    .font(.system(size: 15))
            }
            .padding(.bottom, 20)
            .padding(.horizontal, 20)
            
            HStack() {
                HStack(){
                    Text("Discount")
                        .font(.system(size: 15))
                    Image(systemName: "questionmark.circle")
                        .font(.system(size: 14))
                }
                
                Spacer()
                Text("- \(discount, format: .currency(code: "USD"))")
                    .font(.system(size: 15))
                
            }
            .padding(.bottom, 24)
            .padding(.horizontal, 20)
            
            
            HStack() {
                Text("Total")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                Spacer()
                Text("\(Text("USD ").foregroundStyle(.gray).fontWeight(.regular).font(.system(size: 12))) \(finalTotal, format: .currency(code: "USD"))")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 20)
            
            
            Spacer()
            Text("Just one more thing")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
            
            HStack(spacing: 8){
                HStack(spacing: 15){
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray5))
                        .frame(width: 64, height: 64)
                        .aspectRatio(1, contentMode: .fit)
                        .overlay {
                            Image("nikemind001")
                                .resizable()
                                .scaledToFit()
//                                .padding(6)
                        }
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("Nike Mind 001 Slide")
                            .font(.system(size: 15, weight: .medium))
                        Text("Black")
                            .font(.system(size: 15))
                        Text("$120.00")
                            .font(.system(size: 15))
                            .foregroundStyle(Color(red: 94/255, green: 50/255, blue: 250/255))
                            
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Size")
                    .font(.system(size: 13))
                    .foregroundStyle(Color(red: 94/255, green: 50/255, blue: 250/255))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(15)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray5), lineWidth: 1)
            )
            .padding(.horizontal, 20)
            
            Spacer()
            
            VStack(){
                Button {
                    print("Order confirmed!")
                } label: {
                    
                    HStack()
                    {
                        Text("Pay now")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Spacer()
                            
                        Rectangle()
                            .fill(.white)
                            .frame(width: 1, height: 20)
                            
                        Text("\(cartTotal, format: .currency(code: "USD"))")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.leading, 4)
                            
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 6)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 10))
                .tint(Color(red: 94/255, green: 50/255, blue: 250/255))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
            .background(Color(.white))
            .overlay(alignment: .top){
                Rectangle()
                    .fill(Color(.systemGray5))
                    .frame(height: 1)
            }
            
        }
        //        .frame(maxWidth: .infinity)
        //        .padding(24)
        
    }
    
    
}

#Preview {
    ContentView()
}
