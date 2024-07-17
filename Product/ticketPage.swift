//
//  ticketPage.swift
//  sample
//
//  Created by Owner on 2024/07/11.
//

import SwiftUI

struct ticketPage: View {
    @State var top = false
    var body: some View {
        VStack{
            Spacer()
            Text("販売チケット一覧")
                .font(.largeTitle)
                .frame(width: 400,height: 80)
                .background(.gray)
                .foregroundColor(.white)
            ScrollView{
                LazyVStack(alignment: .center, spacing: 20){
                    ForEach(ticketArray){ ticket in
                        ticketarea(ticket: ticket)
                    }
                }
            }
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
}

#Preview {
    ticketPage()
}
