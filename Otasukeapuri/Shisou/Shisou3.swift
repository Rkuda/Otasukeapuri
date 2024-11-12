//
//  Shisou3.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/25.
//

import SwiftUI

struct Shisou3: View {
    @Environment(\.dismiss) private var dm

    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            VStack{

                HStack{
                    Button {
                        dm()
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.black)

                    }
                    Button {
                        dm()
                    } label: {
                        Text("閉じる")
                            .font(.caption)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                

                Text("無理やりくっつけ法")
                    .font(.custom("HannariMincho-Regular", size: 25))
                    .fontWeight(.black)
               
                ScrollView{

                    ZStack{  //文字の周り余白のため

                        VStack{

                            Text("普段であれば繋がらないようなものを無理やりくっつけて考えてみる方法です。この思考法に役立つのがアプリ内のHintにあるワードガチャです。この思考法に正解・不正解はありません。なんじゃそりゃみたいな組み合わせでも良いので楽しく頭を動かしていきましょう。")
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,10)
                            Text("ワードガチャで作り上げるた組み合わせの例がこちらです。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)

                            Text("⚫︎高校生向けの → 詐欺師っぽい → 飲食店")
                                .foregroundColor(.indigo)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("詐欺師っぽい飲食店とは？学生に詐欺はよくありませんね。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,20)
                            Text("⚫︎冬にぴったりの → 渋い → サービス")
                                .foregroundColor(.indigo)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("冬といえばクリスマスやお正月のような華やかなイベントが多いですが渋いサービスとなると大人向けのしっとりしたサービスなんでしょうか？")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,20)
                            Text("⚫︎歴史に残る → 古風な → 折りたたみ傘")
                                .foregroundColor(.indigo)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("そもそも歴史を振り返るほどの昔に折り畳み傘はないかもしれませんが、それっぽい雰囲気の傘は作れるかもしれませんね。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,20)
                            Text("⚫︎音楽好きのための → 重い → バイキング")
                                .foregroundColor(.indigo)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("音楽好きのためのバイキングは楽しそうですね。ここで言う重いは何が重いのでしょうか…？")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,20)
                            Text("⚫︎謎に小さい → シンプルな → クーポン")
                                .foregroundColor(.indigo)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("サイズの小さなクーポンは作れそうですね。その分無くしそうではありますが…。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,20)

                            Text("このような感じのヘンテコな組み合わせを25万通りで提案してくれます。なんだそりゃと言うようなものから案外面白くなりそう？みたいなものまで幅広くあるのでぜひこの機能を使ってアイデアに繋げてみてください。ツッコミを入れつつ案外おもしろい、できそう！みたいにアイデアを繋げいくと良いでしょう。アイデアが出なくて疲れた時や息抜きにゲーム感覚で触ってみるのもおすすめです。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)




                        }
                    }   //文字の周り余白のため
                    .padding(.all, 30)
                }
            }
        }
    }
}

#Preview {
    Shisou3()
}
