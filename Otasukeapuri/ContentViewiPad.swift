//
//  ContentiPad.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/11/14.
//

import SwiftUI
import SwiftData

struct ContentViewiPad: View {
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
                Image("iPad背景2")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                VStack(spacing: 0){    // VStack始まり

                    Text("新しいアイデアをメモしましょう。")
                        .padding(.top,70)
                        .padding(.bottom,30)
                        .font(.custom("HannariMincho-Regular", size: 25))

                    NavigationLink(destination: ShinkiMemoiPad().navigationBarBackButtonHidden(true)) {
                        Image("NewIdea4")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 360)
                            .padding(.bottom,10)


                    }

                    HStack(spacing: 0){
                        NavigationLink(destination: FolderiPad().navigationBarBackButtonHidden(true).navigationTitle("")) {
                            Image("Library4")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 220)
                        }
                        NavigationLink(destination: NekaseruiPad().navigationBarBackButtonHidden(true).navigationTitle("")) {
                            Image("Leave4")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 230)

                        }
                        NavigationLink(destination: InputiPad().navigationBarBackButtonHidden(true).navigationTitle("")) {
                            Image("Hint4")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 240)
                        }
                    }

                    NavigationLink(destination: TukaikataiPad().navigationBarBackButtonHidden(true)) {
                        Image("使い方")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 60)
                            .padding(.horizontal,65)
                            .padding(.top,35)


                }

                    Spacer().frame(height: 50)

                }    // VStack始まり

            }    // ZStackおわり
        }.navigationViewStyle(.stack)  // NavigationStackおわり
    }
}



#Preview {
    ContentViewiPad()
        .modelContainer(for: Memo.self)
}
