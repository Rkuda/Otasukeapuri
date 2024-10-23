//
//  Shisou.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/24.
//

import SwiftUI

struct Shisou: View {
    @Environment(\.dismiss) var dismiss
    // シート画面の表示を管理する状態変数
    @State var modalFlg1 = false
    @State var modalFlg2 = false
    @State var modalFlg3 = false

    var body: some View {

        NavigationStack{
            ZStack{
                Image("煙")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                VStack(spacing: 0){     // V

                    Text("色んな思想方法を見ることができます。")
                        .font(.subheadline) //フォント→タイトル
                        .foregroundColor(.white) // 文字色
                        .frame(width: 300,height: 80)
                        .padding(.bottom,50)
                        .padding(.top,50)


                    Button {
                        modalFlg1 = true
                    } label: {
                        Text("オズボーンのチェックリスト")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(.all, 30) // TextViewの周りの余白を設定
                            .background(.white) // 背景色→黄色
                            .cornerRadius(20)
                            .frame(width: 350,height: 100)
                            .padding(.bottom, 10)
                            .padding(.top, 100)
                    }
                    .sheet(isPresented: $modalFlg1) {
                        Shisou1()
                    }

                    Button {
                        modalFlg2 = true
                    } label: {
                        Image("Group 14")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 300)
                            .padding(.bottom, 20)
                    }
                    .sheet(isPresented: $modalFlg2) {
                        Shisou2()
                    }

                    Button {
                        modalFlg3 = true
                    } label: {
                        Image("Group 15")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 300)
                            .padding(.bottom, 30)
                    }
                    .sheet(isPresented: $modalFlg3) {
                        Shisou3()
                    }

                    Spacer()

                }      // V

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
    Shisou()
}



