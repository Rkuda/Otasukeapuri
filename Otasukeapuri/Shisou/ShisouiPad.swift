//
//  ShisouiPad.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/11/14.
//

import SwiftUI

struct ShisouiPad: View {
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
                        .font(.custom("HannariMincho-Regular", size: 20))
                        .foregroundColor(.white) // 文字色
                        .frame(width: 660,height: 30)

                        .padding(.top,480)
                        .padding(.bottom,30)


                    Button {
                        modalFlg1 = true
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 0.9, green: 0.87, blue: 0.9))
                                .frame(width: 660, height: 80)
                                .padding(.top, 20)
                            HStack{
                                Text("とんでも法")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)
                            }
                        }
                        .padding(.bottom,30)
                    }
                    .sheet(isPresented: $modalFlg1) {
                        Shisou1()
                    }

                    Button {
                        modalFlg3 = true
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 0.9, green: 0.87, blue: 0.9))
                                .frame(width: 660, height: 80)
                                .padding(.top, 20)
                            HStack{
                                Text("無理やりくっつけ法")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)
                            }
                        }
                        .padding(.bottom,30)
                    }
                    .sheet(isPresented: $modalFlg3) {
                        Shisou3()
                    }



                    Button {
                        modalFlg2 = true
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 0.9, green: 0.87, blue: 0.9))
                                .frame(width: 660, height: 80)
                                .padding(.top, 20)
                            HStack{
                                Text("アイデアチェスト流チェックリスト")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)
                            }
                        }
                        .padding(.bottom,30)
                    }
                    .sheet(isPresented: $modalFlg2) {
                        Shisou2()
                    }

                    Spacer()


                }      // V

                // もどるボタン系
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
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
    ShisouiPad()
}
