//
//  Input.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/07.
//

import SwiftUI

struct Input: View {

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack{
            ZStack{
                
                Image("煙")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                VStack(spacing: 0){

                    Image("Hinttitle")
                        .resizable()
                        .scaledToFit()      // 縦横比を維持しながらフレームに収める
                        .frame(width: 150)
                        .padding(.bottom,50)
                        .padding(.top,20)

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 300, height: 80)
                            .padding(.top, 20)

                        NavigationLink(destination: Gatya().navigationBarBackButtonHidden(true).navigationTitle("ワードガチャ")
                            .navigationBarTitleDisplayMode(.inline)) {
                            Text("ワードガチャ")
                                .font(.custom("HannariMincho-Regular", size: 25))
                                .foregroundColor(.black)
                                .frame(width: 280, height: 80)
                                .padding(.top)
                        }

                    }

                    Text("アイデア出しに息づまった時に使って欲しい機能です。ゲーム感覚で触ってみましょう！")

                        .font(.custom("HannariMincho-Regular", size: 15))
                        .lineSpacing(12)
                        .foregroundColor(.white) // 文字色
                        .frame(width: 250,height: 130)
                        .padding(.bottom,50)

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 300, height: 80)
                            .padding(.top, 20)

                        NavigationLink(destination: Shisou().navigationBarBackButtonHidden(true).navigationTitle("思考方法")
                            .navigationBarTitleDisplayMode(.inline)) {
                            Text("思考方法")
                                .font(.custom("HannariMincho-Regular", size: 25))
                                .foregroundColor(.black)
                                .frame(width: 280, height: 80)
                                .padding(.top)
                        }

                    }

                    Text("アイデアが出やすくなる色んな思考法や頭の体操をする場所です。")
                        .font(.custom("HannariMincho-Regular", size: 15))
                        .lineSpacing(12)
                        .foregroundColor(.white) // 文字色
                        .frame(width: 250,height: 100)


                    

                    Spacer()



                }.padding(.top,30)

                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .onTapGesture {
                                dismiss()
                            }
                    }
                }


            }
        }
        
    }
}

#Preview {
    Input()
}
