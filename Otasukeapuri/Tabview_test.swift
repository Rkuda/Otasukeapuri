//
//  Tabview_test.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/10/19.
//

import SwiftUI

struct Tabview_test: View {

    var body: some View {

        NavigationStack{    // NavigationStackおわり

            ZStack{     // ZStack始まり
                Color(red: 0.7, green: 0.5, blue: 0.2)
                // 背景色
                    .edgesIgnoringSafeArea(.all)
                Image("Haikei")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                TabView{
                    ShinnkiMemo() //1枚目の子ビュー
                                    .tabItem {
                                        Image("ペン")
                                            .resizable()
                                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                            .frame(width:50)
                                            .padding()
                                        Text("新規メモ")


                                    }
                                Input() //2枚目の子ビュー
                                    .tabItem {
                                        Image(systemName: "2.circle.fill") //タブバーの②
                                    }
                }
            }    // ZStackおわり
        }   // NavigationStackおわり
    }
}



#Preview {
    Tabview_test()
}
