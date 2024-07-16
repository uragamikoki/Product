//
//  ticketPage.swift
//  sample
//
//  Created by Owner on 2024/07/11.
//

import SwiftUI

struct ticketPage: View {
    var body: some View {
        VStack{
            Spacer()
            Text("チケット一覧")
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
        }
    }
}

#Preview {
    ticketPage()
}
