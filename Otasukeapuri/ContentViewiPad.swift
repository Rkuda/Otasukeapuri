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

    // 現在表示中の名言と名前を保持
    @State private var currentQuote: String = ""
    @State private var currentAuthor: String = ""
    // 名言リスト（名言と名前をペアにしたタプル）
    private let quotes = [
        ("私は失敗したのではない。ただ、うまくいかない1万通りの方法を見つけただけだ。", "トーマス・エジソン"),
        ("単純さこそが究極の洗練だ。", "レオナルド・ダ・ヴィンチ"),
        ("進歩とは、常識の代わりにアイデアを置き換えることである。", "オスカー・ワイルド"),
        ("混沌を抱く者こそ、星を生む。", "フリードリヒ・ニーチェ"),
        ("最も強いものが生き残るのではない。最も知的なものでもない。変化に最もよく適応したものが生き残るのだ。", "チャールズ・ダーウィン"),
        ("人はできると思えばできるし、できないと思えばできない。", "マーク・トウェイン"),
        ("創造的破壊こそが、経済の進化を牽引する力だ。", "ジョセフ・シュンペーター"),
        ("偶然は準備された心にのみ味方する。", "セネカ"),
        ("勇気とは、困難を恐れずに向き合うことである。そして創造には常に勇気が必要だ。", "アリストテレス"),
        ("新しいアイデアは、荒野の花のように最初は見落とされる。", "ヴィクトル・ユーゴー"),
        ("アイデアの力は、支配者たちが信じる以上に強い。", "ジョン・メイナード・ケインズ"),
        ("未来を想像するのは容易だ。それを実現する行動こそが難しい。", "テスラ（ニコラ・テスラ）"),
        ("未解決の問題こそが、新しいアイデアの土台だ。", "ベンジャミン・フランクリン"),
        ("アイデアは、平和の武器としても最も強力だ。", "アルフレッド・ノーベル"),
        ("知恵の始まりは、自分が無知であることを認めることだ。", "ソクラテス"),
        ("私は考える。それゆえに私は存在する。", "ルネ・デカルト"),
        ("新しい発明は、人間の力を無限に拡大する。", "フランシス・ベーコン"),
        ("天才とは、自分の中にあるものを信じることだ。", "ラルフ・ワルド・エマーソン"),
        ("想像力を欠いた目は、何も見えない。", "ウィリアム・ブレイク"),
        ("自由は創造の母である。", "ジャン＝ジャック・ルソー"),
        ("想像力は、記憶の延長線上にある。", "トマス・ホッブズ"),
        ("心は白紙である。そこに経験が書き込まれていく。", "ジョン・ロック"),
        ("大きなアイデアは、小さな質問から生まれる。", "モンテーニュ"),
        ("進歩は、個々の創意工夫によってもたらされる。", "アダム・スミス"),
        ("想像力は、世界を再構築する力を持つ。", "アリストファネス"),
        ("物事を変える者だけが、未来を変える。", "オウィディウス"),
        ("困難の中にこそ、創造力が芽生える。", "タキトゥス"),
        ("今を生きる者にこそ、未来の種がある。", "ホラティウス"),
        ("私に支点を与えよ。そうすれば地球を動かそう。", "アルキメデス"),
        ("偉大な行動の背後には、偉大なアイデアがある。", "キケロ"),
        ("探求の旅は終わらない。内なる目が開かれる限り。", "ペトラルカ"),
        ("大胆に行動せよ。そこにこそ創造がある。", "エウリピデス")
    ]

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
                Image("新iPad背景")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                VStack(spacing: 0){    // VStack始まり

                    VStack{
                        Text(currentQuote) // 名言
                            .font(.custom("HannariMincho-Regular", size: 18))
                            .lineSpacing(5)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            .frame(width: 320)
                            .padding(.bottom, 25)


                        Text(currentAuthor) // 名前
                            .font(.custom("HannariMincho-Regular", size: 14))
                            .multilineTextAlignment(.center)


                    }
                    .frame(width: 400,height: 120)
                    .padding(.top, 150)

                    NavigationLink(destination: ShinkiMemoiPad().navigationBarBackButtonHidden(true)) {
                        Image("新NewIdea")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 360)
                            .padding(.bottom,10)


                    }

                    HStack(spacing: 0){
                        NavigationLink(destination: FolderiPad().navigationBarBackButtonHidden(true).navigationTitle("")) {
                            Image("新Library")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 120)
                        }
                        NavigationLink(destination: NekaseruiPad().navigationBarBackButtonHidden(true).navigationTitle("")) {
                            Image("新Leave")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 120)

                        }
                        NavigationLink(destination: InputiPad().navigationBarBackButtonHidden(true).navigationTitle("")) {
                            Image("新Hint")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 120)
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
            .onAppear {
                // ホーム画面が表示された際にランダムな名言と名前を選択
                let randomQuote = quotes.randomElement() ?? ("Welcome!", "Unknown")
                currentQuote = randomQuote.0
                currentAuthor = randomQuote.1
            }
    }
}



#Preview {
    ContentViewiPad()
        .modelContainer(for: Memo.self)
}
