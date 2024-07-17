//
//  Payment.swift
//  Product
//
//  Created by Owner on 2024/07/16.
//

import SwiftUI

struct Payment: View {
    @State private var isShow: Bool = false
    @State private var isBack: Bool = false
    var ticket :TicketData
    var body: some View {
        VStack{
            Rectangle()
                .frame(height: 0)
                .opacity(0)
            Text("支払い方法選択")
                .font(.largeTitle)
                .frame(width: 400,height: 80)
                .background(.gray)
                .foregroundColor(.white)
            Spacer()
            Button(){
                isShow = true
            }label: {
                RoundedRectangle(cornerRadius: 20.0)
                    .foregroundColor(.blue)
                    .frame(width: .infinity, height: 100)
                    .padding(.horizontal)
                    .overlay(Text("Paypal").font(.largeTitle).foregroundColor(.white))
            }
            .fullScreenCover(isPresented: $isShow){
                Paycomplete(ticket: ticket)
            }
            
            Button(){
                isShow = true
            }label: {
                RoundedRectangle(cornerRadius: 20.0)
                    .foregroundColor(.blue)
                    .frame(width: .infinity, height: 100)
                    .padding(.horizontal)
                    .overlay(Text("クレジットカード").font(.largeTitle).foregroundColor(.white))
            }
            .fullScreenCover(isPresented: $isShow){
                Paycomplete(ticket: ticket)
            }
            
            Button(){
                isShow = true
            }label: {
                RoundedRectangle(cornerRadius: 20.0)
                    .foregroundColor(.blue)
                    .frame(width: .infinity, height: 100)
                    .padding(.horizontal)
                    .overlay(Text("コンビニ支払い").font(.largeTitle).foregroundColor(.white))
            }
            .fullScreenCover(isPresented: $isShow){
                Paycomplete(ticket: ticket)
            }
            
            Button(){
                isShow = true
            }label: {
                RoundedRectangle(cornerRadius: 20.0)
                    .foregroundColor(.blue)
                    .frame(width: .infinity, height: 100)
                    .padding(.horizontal)
                    .overlay(Text("Paypay").font(.largeTitle).foregroundColor(.white))
            }
            .fullScreenCover(isPresented: $isShow){
                Paycomplete(ticket: ticket)
            }
            
            Button(){
                isShow = true
            }label: {
                RoundedRectangle(cornerRadius: 20.0)
                    .foregroundColor(.blue)
                    .frame(width: .infinity, height: 100)
                    .padding(.horizontal)
                    .overlay(Text("Apple Pay").font(.largeTitle).foregroundColor(.white))
            }
            .fullScreenCover(isPresented: $isShow){
                Paycomplete(ticket: ticket)
            }
            
            Spacer()
            Button(){
                //back
                isBack = true
            }label: {
                Text("戻る")
                    .font(.title)
            }
            .fullScreenCover(isPresented: $isBack){
                ticketPage()
            }

        }
        
    }
}

#Preview {
    Payment(ticket: ticketArray[0])
}
