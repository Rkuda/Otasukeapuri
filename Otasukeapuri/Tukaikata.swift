//
//  Tukaikata.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/12/05.
//

import SwiftUI

struct Tukaikata: View {
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

                Image("背景レンガ")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()


                    VStack(spacing: 0){

                        Image("使い方文字")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 130)
                            .padding(.bottom,10)
                            .padding(.top,40)


                        ScrollView{

                        Image("NewIdea4")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 230)

                            .padding(.top,10)

                        Text("新しいアイデアを作成します。\n１下書き…アイデアの下書きを保存\n２清書…ある程度内容が固まったアイデアを保存\n３使わないかも…使うかは分からないアイデアや面白いキーワードなどを保存\n４寝かせる…自分で良いか悪いか分からなくなったアイデアを保存\n以上４つの保存先に分けてメモを作成できます。")
                            .font(.custom("HannariMincho-Regular", size: 15))
                            .lineSpacing(12)
                            .foregroundColor(.white) // 文字色
                            .frame(width: 280)
                            .padding(.top,20)

                            Image("Library4")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 180)

                                .padding(.top,40)

                            Text("作成したアイデアを振り返る場所です。\n保存時に選んだ保存先ごとにアイデアを振り返ることができます。使わなくなったアイデアはスライドで削除することができます。")
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .lineSpacing(12)
                                .foregroundColor(.white) // 文字色
                                .frame(width: 280)
                                .padding(.top,20)

                            Image("Leave4")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 180)

                                .padding(.top,30)

                            Text("アイデアの保存時に「寝かせる」を選んだアイデアはここで振り返ることができます。しばらく時間と距離をとって再びアイデアを見た時にどのように感じるかを大切にしましょう。")
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .lineSpacing(12)
                                .foregroundColor(.white) // 文字色
                                .frame(width: 280)

                            Image("Hint4")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 180)

                                .padding(.top,80)

                            Text("アイデアが出ない時、頭を柔らかくしたい時のための場所です。\n１ワードガチャ…３つのワードを組み合わせて一つの文章を作り出すガチャです。ヘンテコな文章も出来上がるのでゲーム感覚で息抜きにも使っていただけます。全部で25万通りの文章を作ることができます。\n２思考方法…アイデア出しに役立つ３つの思考方法を紹介しています。\nこの二つの機能でアイデア出しの手助けを行います。")
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .lineSpacing(12)
                                .foregroundColor(.white) // 文字色
                                .frame(width: 280)
                                .padding(.top,30)
                                .padding(.bottom,40)

                            Text("このアプリはアイデア出しに特化したメモアプリです。少しでもアイデア出しの手助けができると幸いです。")
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .lineSpacing(12)
                                .foregroundColor(.white) // 文字色
                                .frame(width: 280)
                                .padding(.top,30)


                            Image("アプリ名白")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 120)
                                .padding(.top,40)
                                .padding(.bottom,100)

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
}

#Preview {
    Tukaikata()
}
