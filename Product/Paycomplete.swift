//
//  Paycomplete.swift
//  Product
//
//  Created by Owner on 2024/07/16.
//

import SwiftUI

struct Paycomplete: View {
    var ticket :TicketData
    @State var top = false
    var body: some View {
        Rectangle()
            .frame(height: 0)
            .opacity(0)
        Text("支払い方法選択")
            .font(.largeTitle)
            .frame(width: 400,height: 80)
            .background(.gray)
            .foregroundColor(.white)
        Spacer()
        Text("チケットの購入が完了しました。")
            .font(.title)
            .padding()
        ticketView(ticket: ticket)
            .padding(.horizontal)
        Spacer()
        Button(action: { top = true}){
            RoundedRectangle(cornerRadius: 30)
                .stroke(lineWidth: 3.0)
                .frame(width: 300, height: 50)
                .overlay(Text("トップ画面に戻る").font(.title))
                .foregroundColor(.black)
        }
        .fullScreenCover(isPresented: $top){
            TopPage()
        }
    }
}

#Preview {
    Paycomplete(ticket: ticketArray[0])
}
