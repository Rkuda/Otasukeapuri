//
//  GatyaiPad.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/11/14.
//

import SwiftUI

struct GatyaiPad: View {
    @Environment(\.dismiss) var dismiss
    @State private var timer: Timer?
    @State private var isRolling = false
    @State private var selectedfirstWord: String = "〇〇で、〇〇のための"
    @State private var selectedsecondword: String = "〇〇な"
    @State private var selectedthirdword: String = "〇〇"

    // ワードのリスト
    let firstwords = ["世界一", "過去最高に", "何よりも", "とんでもなく", "歴史に残る","究極に","驚異的に","奇跡的に","最高峰に","ワールドクラスの","伝説に残る","お母さん専用の","赤ちゃんのための","友達と一緒に使う","大人のための","初心者向けの","動物好きな人向けの","旅行者のための","コレクター必見の","クリスマス限定の","冬にぴったりの","若者向けの","どこでも使える","勉強をサポートする","音楽好きのための","環境に配慮した","コーヒー愛好者専用の","おじいちゃん専用の","お父さんのための","長男・長女のための","ペットがいる家庭専用の","天下一の","謎にでかい","謎に小さい","宇宙最高の","朝だけに使う","一人暮らし専用の","高校生向けの","小学生だけ使える","瞑想にぴったりの","夏だけの","春にぴったりの","論理的な人向けの","妄想好きのための","ラーメン好きのための","収集癖のある人向けの","本好きのための","屋外専用の","健康マニアのための","めんどくさがり向けの"]
    let secondwords = ["卑怯な", "卑猥な", "強烈な", "可愛らしい", "弱々しい","美しい","賢い","ミステリアスな","詐欺師っぽい","古風な","古臭い","秘密の","夢のような","奇妙な","シンプルな","儚げな","可憐な","ド派手な","強力な","貧弱な","正しい","あたたかい","ちょっぴりえっちな","過激な","心地いい","キュートな","勇ましい","おっとりした","ヘルシーな","俊敏な","クリエイティブな","おしゃれな","ちょっぴり臭い","だいぶ臭い","間違いだらけの","厳しい","礼儀正しい","重い","軽い","かっこいい","渋い","冷たい","計画的な","高級な","美味しい","タチの悪い","はがゆい","まずい","うるさい","静かな"]
    let thirdwords = ["ロボット", "お箸", "貯金箱", "書物", "サービス","ゴミ箱","時計","ランドセル","スマホケース","カバン","自転車","歯ブラシ","電子レンジ","パソコン","ハンドクリーム","折り畳み傘","イヤホン","カメラ","マウス","サングラス","メガネ","引き出し","洗濯","帽子","お風呂","ホテル","お家","玄関","扉","部屋","鏡","ポーチ","消しゴム","アルバム","本","枕","布団","椅子","机","扇風機","鍋","シューズ","ブーツ","カーテン","マグカップ","ナイフ","ランプ","まな板","雑誌","居酒屋","交差点","学校","大学","先生","イベント","発表会","集団","サイト","アプリ","ダンボール","店員","おかし","定期便","テーマパーク","服屋さん","飲食店","カフェ","ハンガー","道路","車","スピーカー","職員室","教室","廊下","歌手","アイドル","マイク","司会者","社長","会社","バイキング","アクセアリー","デザイン","紙袋","照明器具","飼育員","商品券","クーポン","マジシャン","クッキー","スーパー","コンビニ","小物入れ","お散歩","旅行","パジャマ","掃除","マットレス","アウター","ぬいぐるみ"]
        //250,000パターン

    var body: some View {

        NavigationStack{
            ZStack{
                Image("煙")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                VStack(spacing: 0){

                    Text("どんどん回してアイデアに繋げましょう。")
                        .font(.custom("HannariMincho-Regular", size: 20))
                        .foregroundColor(.white) // 文字色

                        .padding(.top,480)
                        .padding(.bottom,50)


                    ZStack{
                        Image("煙単体2")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 550)
                            .padding(.top,10)
                        Text(selectedfirstWord)
                            .font(.custom("HannariMincho-Regular", size: 40))
                            .foregroundColor(.black)

                    }

                    ZStack{
                        Image("煙単体2")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 550)
                            .padding(.top,10)
                        Text(selectedsecondword)
                            .font(.custom("HannariMincho-Regular", size: 40))
                            .foregroundColor(.black)

                    }

                    ZStack{
                        Image("煙単体2")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 550)
                            .padding(.top,10)
                        Text(selectedthirdword)
                            .font(.custom("HannariMincho-Regular", size: 40))
                            .foregroundColor(.black)

                    }

                    // ガチャを回すボタン
                    Button(action: startSlotRolling) {
                                            Image("lamp")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 300)
                                                .padding(.top, 50)
                                        }
                                        .disabled(isRolling)

                    Spacer()
                }

            }

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

    /// スロットを同時に回して時間差で停止
        private func startSlotRolling() {
            isRolling = true

            // 1つ目のスロットを回す
            let firstSlotTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                selectedfirstWord = firstwords.randomElement() ?? ""
            }

            // 2つ目のスロットを回す
            let secondSlotTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                selectedsecondword = secondwords.randomElement() ?? ""
            }

            // 3つ目のスロットを回す
            let thirdSlotTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                selectedthirdword = thirdwords.randomElement() ?? ""
            }

            // 各スロットの停止タイミングを設定
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // 1秒後に1つ目を停止
                firstSlotTimer.invalidate()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // 1.5秒後に2つ目を停止
                secondSlotTimer.invalidate()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { // 2秒後に3つ目を停止
                thirdSlotTimer.invalidate()
                isRolling = false // すべて停止した後にボタンを有効化
            }
        }


}

#Preview {
    GatyaiPad()
}
