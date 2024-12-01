//
//  ContentViewiPhone.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/11/14.
//

import SwiftUI
import SwiftData

struct ContentViewiPhone: View {
    @State private var isShowingView: Bool = false

    // 保存のやつ
    @Environment(\.modelContext) private var context

    @State private var textFieldInput = ""
    // 保存のやつ

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.clear]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {

        NavigationStack{    // NavigationStackおわり

            ZStack{     // ZStack始まり
                Color(red: 0.7, green: 0.5, blue: 0.2)
                // 背景色
                    .edgesIgnoringSafeArea(.all)
                Image("背景紙ロゴあり")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                VStack(spacing: 0){    // VStack始まり

                    Text("新しいアイデアをメモしましょう。")
                        .padding(.top,90)
                        .padding(.bottom,10)
                        .font(.custom("HannariMincho-Regular", size: 18))

                    NavigationLink(destination: ShinnkiMemo().navigationBarBackButtonHidden(true)) {
                        Image("NewIdea4")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 320)


                    }

                    HStack(spacing: 0){
                        NavigationLink(destination: Folder().navigationBarBackButtonHidden(true).navigationTitle("")) {
                            Image("Library4")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 180)
                        }
                        NavigationLink(destination: Nekaseru().navigationBarBackButtonHidden(true).navigationTitle("")) {
                            Image("Leave4")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 180)

                        }
                    }

                    NavigationLink(destination: Input().navigationBarBackButtonHidden(true).navigationTitle("")) {
                        Image("Hint4")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 200)
                    }

                }    // VStack始まり

            }    // ZStackおわり
        }   // NavigationStackおわり

    }
}




#Preview {
    ContentViewiPhone()
        .modelContainer(for: Memo.self)
}
