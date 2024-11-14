//
//  InputiPad.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/11/14.
//

import SwiftUI

struct InputiPad: View {
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
                        .padding(.top,300)

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 660, height: 80)
                            .padding(.top, 20)

                        NavigationLink(destination: GatyaiPad().navigationBarBackButtonHidden(true).navigationTitle("ワードガチャ")
                            .navigationBarTitleDisplayMode(.inline)) {
                            HStack{
                                Spacer().frame(width: 130)
                                Text("ワードガチャ")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)

                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .padding(.top,20)
                                    .padding()
                                Spacer().frame(width: 130)
                            }
                        }


                    }

                    Text("アイデア出しに息づまった時に使って欲しい機能です。ゲーム感覚で触ってみましょう！")

                        .font(.custom("HannariMincho-Regular", size: 20))
                        .lineSpacing(12)
                        .foregroundColor(.white) // 文字色
                        .frame(width: 660,height: 130)
                        .padding(.bottom,50)

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 660, height: 80)
                            .padding(.top, 20)

                        NavigationLink(destination: ShisouiPad().navigationBarBackButtonHidden(true).navigationTitle("思考方法")
                            .navigationBarTitleDisplayMode(.inline)) {
                            HStack{
                                Spacer().frame(width: 130)
                                Text("思考方法")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)

                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .padding(.top,20)
                                    .padding()
                                Spacer().frame(width: 130)
                            }
                        }


                    }

                    Text("アイデアが出やすくなる色んな思考法や頭の体操をする場所です。")
                        .font(.custom("HannariMincho-Regular", size: 20))
                        .lineSpacing(12)
                        .foregroundColor(.white) // 文字色
                        .frame(width: 660,height: 100)




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
    InputiPad()
}
