//
//  regist.swift
//  Product
//
//  Created by Owner on 2024/07/16.
//

import SwiftUI

struct regist: View {
    @State var name: String = "田中太郎"
    @State var address: String = "東京都内"
    @State var birthday = Date()
    @State var gender: Int = 2
    @State var mail: String = ""
    @State var password: String = ""
    
    @State var isError = false
    
    var dateFormat: DateFormatter{
        let df = DateFormatter()
        df.locale = Locale(identifier: "ja_JP")
        df.dateFormat = " 西暦YYYY年　MM月　dd日"
        return df
    }
    var body: some View {
        Spacer()
        Text("会員情報登録")
            .font(.largeTitle)
            .padding()
        Spacer()
        GroupBox{
            Grid(alignment: .leading, horizontalSpacing: 10, verticalSpacing: 20){
                GridRow{
                    Text("メール")
                        .padding(.leading, 5.0)
                    TextField("mail", text: $mail)
                        .textFieldStyle(.roundedBorder)
                }
                GridRow{
                    Text("パスワード")
                        .padding(.leading, 5.0)
                    TextField("password", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                Divider()
                    .gridCellUnsizedAxes([.horizontal, .vertical])
                
                Text("-マイナンバー読み取り情報-")
                    .font(.title3)
                GridRow{
                    Text("名前")
                        .padding(.leading, 5.0)
                    TextField("name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .disabled(true)
                }
                GridRow{
                    Text("住所")
                        .padding(.leading, 5.0)
                    TextField("address", text: $address)
                        .textFieldStyle(.roundedBorder)
                        .disabled(true)
                }
                
                GridRow{
                    Text("生年月日")
                        .padding(.leading, 5.0)
                    Text(dateFormat.string(from: birthday))
                        .frame(width: 280, height: 30, alignment: .leading)
                        .background(.white)
                }
                GridRow{
                    Text("性別")
                        .padding(.leading, 5.0)
                    HStack{
                        HStack{
                            Image(systemName: gender==1
                                  ? "checkmark.circle.fill"
                                  : "circle")
                            Spacer()
                            Text("男性")
                                .frame(width: 100,height: 30)
                                .background(.white)
                            Spacer()
                        }
                        
                        HStack{
                            Image(systemName: gender==2
                                  ? "checkmark.circle.fill"
                                  : "circle")
                            Spacer()
                            Text("女性")
                                .frame(width: 100,height: 30)
                                .background(.white)
                            Spacer()
                        }
                    }
                }
            }
        }
        Spacer()
        Button(action: {
            isError = true
        }){
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.blue)
                .frame(width: 300, height: 50)
                .overlay(Text("登録する").font(.title))
                .foregroundColor(.white)
                .padding(.bottom, 10.0)
        }
        .alert(isPresented: $isError){
            Alert(title: Text("会員登録"), message: Text("この内容で登録します。よろしいですか。"),
                  primaryButton: .default(Text("OK"), action: {
                //登録処理
            }),
                  secondaryButton: .cancel(Text("キャンセル"), action: {
                isError = false
            })
            )
        }
        
        Button(action: {}){
            RoundedRectangle(cornerRadius: 30)
                .stroke(lineWidth: 3.0)
                .frame(width: 300, height: 50)
                .overlay(Text("キャンセル").font(.title))
                .foregroundColor(.black)
        }
    }
}

#Preview {
    regist()
}
