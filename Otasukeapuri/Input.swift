//
//  Input.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/07.
//

import SwiftUI

struct Input: View {
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(red: 0.9, green: 0.6, blue: 0.1)
                // 背景色
                    .edgesIgnoringSafeArea(.all)
                    .toolbarBackground(.white, for: .navigationBar)
                
                
                
                
                VStack(spacing: 0){
                    
                    
                    NavigationLink(destination: Gatya().navigationBarBackButtonHidden(true).navigationTitle("ワードガチャ")) {
                        Image("Group 11")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 300)
                                                    
                    }
                    Text("アイデア出しに息づまった時に使って欲しい機能です。\nゲーム感覚で触ってみましょう！")
                        .font(.subheadline) //フォント→タイトル
                        .foregroundColor(.black) // 文字色→青
                        .padding(.all, 30) // TextViewの周りの余白を設定
                        .background(Color(red: 1.0, green: 0.8, blue: 0.6, opacity: 0.6)) // 背景色→黄色
                        .cornerRadius(10)
                        .frame(width: 300,height: 150)
                        .padding(.bottom, 30)
                    
                    
                    
                    NavigationLink(destination: Shisou().navigationBarBackButtonHidden(true).navigationTitle("教えて先輩")) {
                        Image("Group 12")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 300)
                        
                    }
                    Text("アイデアが出やすくなる色んな思考法や頭の体操をする場所です。")
                        .font(.subheadline) //フォント→タイトル
                        .foregroundColor(.black) // 文字色→青
                        .padding(.all, 30) // TextViewの周りの余白を設定
                        .background(Color(red: 1.0, green: 0.8, blue: 0.6, opacity: 0.6)) // 背景色→黄色
                        .cornerRadius(10)
                        .frame(width: 300,height: 150)
                        .padding(.bottom, 30)
                        
                    
                    
                }
                
                // もどるボタン系
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "chevron.left")
                            .onTapGesture {
                                dismiss()
                            }
                    }
                }
                // もどるボタン系
                
            }
            
        }
        
        
        
        
        
    }
}

#Preview {
    Input()
}
