//
//  TopPage.swift
//  Product
//
//  Created by Owner on 2024/07/17.
//

import SwiftUI

struct TopPage: View {
    @State var buy = false
    var body: some View {
        Spacer()
        Text("所持チケット一覧")
            .font(.largeTitle)
            .frame(width: 400,height: 80)
            .background(.gray)
            .foregroundColor(.white)
            .padding(.bottom)
        Spacer()
        
        NavigationView{
            ScrollView{
                LazyVStack(alignment: .center, spacing: 20){
                    ForEach(ticketArray){ ticket in
                        NavigationLink(destination: ContentView()){
                            ticketView(ticket: ticket)
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        Spacer()
        Button(action: {
            buy = true
        }){
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.blue)
                .frame(width: 300, height: 50)
                .overlay(Text("チケット購入").font(.title))
                .foregroundColor(.white)
                .padding(.bottom, 10.0)
                .padding(.top)
        }
        .fullScreenCover(isPresented: $buy){
            ticketPage()
        }
        
    }
}

#Preview {
    TopPage()
}
