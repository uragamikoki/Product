//
//  ticketView.swift
//  sample
//
//  Created by Owner on 2024/07/11.
//

import SwiftUI

struct ticketView: View {
    var ticket :TicketData
    var dateFormat: DateFormatter{
        let df = DateFormatter()
        df.locale = Locale(identifier: "ja_JP")
        df.dateFormat = "YYYY/MM/dd"
        return df
    }
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Text(ticket.name)
                    .font(.system(size: 40))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20.0)
                Text(dateFormat.string(from: ticket.eventDate))
                    .font(.title3)
                    .padding(.trailing,30)
            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.black)
                    .frame(width: 310, height: 100)
                Text(ticket.overview)
                    .frame(width: 290, height: 80, alignment: .topLeading)
                    .padding(.all, 10)
            }
            Spacer()
            
        }
        .frame(width: .infinity, height: 200)
        .background(.yellow)
        .cornerRadius(12)
    }
}

struct ticketarea: View {
    var ticket :TicketData
    @State var isShow = false
    @State var isStep = false
    @State var payment = false
    //タイマーの変数
    @State var timerHandler : Timer?
    var dateFormat: DateFormatter{
        let df = DateFormatter()
        df.locale = Locale(identifier: "ja_JP")
        df.dateFormat = "YYYY/MM/dd"
        return df
    }
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Text(ticket.name)
                    .font(.system(size: 40))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20.0)
                Text(dateFormat.string(from: ticket.eventDate))
                    .font(.title3)
                    .padding(.trailing,10)
                Spacer()
                Button(){
                    isShow.toggle()
                    if isShow == false{
                        timer()
                    }
                }label: {
                    if isShow{
                        Text("ー")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 40, height: 30)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }else{
                        Text("＋")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 40, height: 30)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                }
                .padding(.trailing)
                
            }
            if isShow{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.gray)
                        .frame(width: 310, height: 100)
                    VStack{
                        Text(ticket.overview)
                            .frame(width: 290, height: 50, alignment: .topLeading)
                        Button(){
                            payment = true
                        }label: {
                            Text("購入する")
                                .frame(width: 100,height: 30)
                                .background(.white)
                                .cornerRadius(10)
                                .frame(width: 300 ,alignment: .trailing)
                        }
                        .fullScreenCover(isPresented: $payment){
                            Payment(ticket: ticket)
                        }
                    }
                    
                }
            }
            Spacer()
        }
        .frame(width: .infinity, height: isShow ?200 : 70)
        .background(.yellow)
        .cornerRadius(12)
        .animation(.default,value: isShow)
        
        if isStep {
            Rectangle()
                .frame(height: 110)
                .foregroundColor(.white)
                .opacity(0.0)
        }
        
    }
    
    func timer(){
        if let unwrapedTimerHandler = timerHandler{
            if unwrapedTimerHandler.isValid == true{
                return
            }
        }
        
        isStep.toggle()
        //タイマーのスタート
        timerHandler = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true){
            _ in
            isStep.toggle()
            timerHandler?.invalidate()
        }
    }
}

#Preview {
    ticketView(ticket: ticketArray[0])
}
#Preview {
    ticketarea(ticket: ticketArray[0])
}
