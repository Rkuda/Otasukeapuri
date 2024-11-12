//
//  Shisou2.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/25.
//

import SwiftUI

struct Shisou2: View {
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

                Text("アイデアチェスト流チェックリスト")
                    .font(.custom("HannariMincho-Regular", size: 19))
                    .fontWeight(.black)
                Spacer()

                ScrollView{

                    ZStack{  //文字の周り余白のため

                        VStack{

                            Text("オズボーンのチェックリストをご存知でしょうか？オズボーンのチェックリストはアイデアをチェックリストに当てはめて考えつつアイデアを出したり改良していくと言うものです。転用、変更、代用などの９つのチェックリストがありますが、そこだけ聞くと少しわかりにくいためアイデアチェストなりにわかりやすく解釈してみました。それがアイデアチェスト流チェックリストです。")
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)
                            Text("１.新しい使い方があるかも？")
                                .foregroundColor(.purple)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("既存の使い方じゃない新しい使い方ができないか考えてみる。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)

                            Text("２.他のものを上手く使えるかも？")
                                .foregroundColor(.purple)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("似た何かを上手く使えないか、似たものはないかを考えてみる。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)

                            Text("３.形を変えるとおもしろいかも？")
                                .foregroundColor(.purple)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("色・音・匂いなど五感の観点から色々変えられないか考えてみる。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)

                            Text("４.大きく・広く展開できるかも？")
                                .foregroundColor(.purple)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("規模や時間を大きくしたり足し算して考えてみる。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)

                            Text("５.小さく・狭く展開できるかも？")
                                .foregroundColor(.purple)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("規模や時間を小さくしたり引き算して考えてみる。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)

                            Text("６.他の何かに置き換えられるかも？")
                                .foregroundColor(.purple)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("他のもの、場所、素材などと置き換えて考えてみる。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)

                            Text("７.入れ替えるとおもしろいかも？")
                                .foregroundColor(.purple)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("配置やパターンなどを入れ替えて考えてみる。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)

                            Text("８.真逆に考えるとおもしろいかも？")
                                .foregroundColor(.purple)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("位置や向き、関係性を反対にしてみて考えてみる。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)

                            Text("９.他と合わせるとおもしろいかも？")
                                .foregroundColor(.purple)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("他のものと組み合わせて考えてみる。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)

                            Text("以上９つのチェックリストに自分のアイデアやテーマを当てはめてみてください。")
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
    Shisou2()
}
