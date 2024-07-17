//
//  ContentView.swift
//  Product
//
//  Created by Owner on 2024/07/16.
//

import SwiftUI

struct ContentView: View {
    @State var mail: String = ""
    @State var password: String = ""
    
    @State var isAlert = false
    @FocusState var isInputActive : Bool
    
    var body: some View {
        
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack {
                Spacer()
                ZStack{
                    Ellipse()
                        .stroke(lineWidth: 4)
                        .foregroundColor(.purple)
                        .frame(width: 100, height: 300)
                        .rotationEffect(.degrees(30), anchor: .bottom)
                    Ellipse()
                        .stroke(lineWidth: 4)
                        .foregroundColor(.blue)
                        .frame(width: 100, height: 300)
                        .rotationEffect(.degrees(-30), anchor: .bottom)
                    Ellipse()
                        .stroke(lineWidth: 4)
                        .foregroundColor(.pink)
                        .frame(width: 100, height: 300)
                }
                    .frame(width: 300, height: 300)
                Spacer()
                TextField("mail", text: $mail)
                    .frame(width: 300, height: 50)
                    .keyboardType(.alphabet)
                    .focused($isInputActive)
                Divider()
                    .padding(.horizontal)
                
                TextField("password", text: $password)
                    .frame(width: 300, height: 50)
                    .keyboardType(.alphabet)
                    .focused($isInputActive)
                Divider()
                    .padding(.horizontal)
                Spacer()
                Button(action: {
                    isInputActive = false
                    userArray.forEach{ user in
                        if user.mail == mail,
                           user.password == password{
                            isAlert = true
                        }
                    }
                    if !isAlert {
                        password = ""
                    }
                }){
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.blue)
                        .frame(width: 300, height: 50)
                        .overlay(Text("LOG IN").font(.title))
                        .foregroundColor(.white)
                        .padding(.bottom, 10.0)
                }
                .fullScreenCover(isPresented: $isAlert){
                    TopPage()
                }
                
                Button(action: {}){
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(lineWidth: 3.0)
                        .frame(width: 300, height: 50)
                        .overlay(Text("SIGN UP").font(.title))
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
        
    }
}

extension UITextField {
    func setUnderLine() {
        // 枠線を非表示にする
        borderStyle = .none
        let underline = UIView()
        // heightにはアンダーラインの高さを入れる
        underline.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: 0.5)
        // 枠線の色
        underline.backgroundColor = .white
        addSubview(underline)
        // 枠線を最前面に
        bringSubviewToFront(underline)
    }
}


#Preview {
    ContentView()
}
