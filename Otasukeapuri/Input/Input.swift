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
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
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


                    NavigationLink(destination: Gatya().navigationBarBackButtonHidden(true).navigationTitle("ワードガチャ")) {
                        Text("ワードガチャ")
                            .font(.custom("HannariMincho-Regular", size: 30))
                            .foregroundColor(.black)
                            .padding(.all, 30) // TextViewの周りの余白を設定
                            .background(.white) // 背景色→黄色
                            .cornerRadius(20)
                            .frame(width: 300,height: 100)
                            .padding(.bottom, 10)
                            .padding(.top, 100)
                    }
                    Text("アイデア出しに息づまった時に使って欲しい機能です。ゲーム感覚で触ってみましょう！")

                        .font(.custom("HannariMincho-Regular", size: 15))
                        .lineSpacing(12)
                        .foregroundColor(.white) // 文字色
                        .frame(width: 250,height: 100)
                        .padding(.bottom,50)

                    NavigationLink(destination: Shisou().navigationBarBackButtonHidden(true).navigationTitle("教えて先輩")) {
                        Text("思考方法")
                            .font(.custom("HannariMincho-Regular", size: 30))
                            .foregroundColor(.black)
                            .padding(.all, 30) // TextViewの周りの余白を設定
                            .background(.white) // 背景色→黄色
                            .cornerRadius(20)
                            .frame(width: 300,height: 100)
                            .padding(.bottom, 10)

                    }
                    Text("アイデアが出やすくなる色んな思考法や頭の体操をする場所です。")
                        .font(.custom("HannariMincho-Regular", size: 15))
                        .lineSpacing(12)
                        .foregroundColor(.white) // 文字色
                        .frame(width: 250,height: 100)


                    

                    Spacer()



                }

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
