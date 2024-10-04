//
//  Shisou1.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/25.
//

import SwiftUI

struct Shisou1: View {

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

                Text("オズボーンのチェックリスト")
                    .font(.title2)
                    .fontWeight(.black)
                Spacer()

                ScrollView{

                    ZStack{  //文字の周り余白のため

                        VStack{

                            Text("アメリカの実業家であるアレックス・F・オズボーン氏が考案した思考法です。\n全部で9つの項目があり、アイデアのテーマ・対象を決めたうえで、チェックリストの各項目当てはめてアイデアを出していきます。9項目の内訳は、以下のとおりです。\n")
                            Text("転用")
                                .foregroundColor(.orange).fontWeight(.bold)
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("（例：他に使い道はないか？他に活躍できる分野・領域はないか？）\n")
                                .frame(maxWidth:.infinity, alignment:.leading)

                            Text("応用")
                                .foregroundColor(.orange).fontWeight(.bold)
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("（例：他の業種・分野からアイデアを借りると？）\n")
                                .frame(maxWidth:.infinity, alignment:.leading)

                            Text("変更")

                                .foregroundColor(.orange).fontWeight(.bold)
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("（例：形・機能を変えてみたら？）\n")
                                .frame(maxWidth:.infinity, alignment:.leading)

                            Text("拡大")
                                .foregroundColor(.orange).fontWeight(.bold)
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("（例：時間・頻度・高さ・長さ・強さなどを拡大してみたらどうか？）\n")
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("縮小")
                                .foregroundColor(.orange).fontWeight(.bold)
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("（例：携帯化できるか？短くできるか？軽くできるか？省略できるか？）\n")
                            Text("代用")
                                .foregroundColor(.orange).fontWeight(.bold)
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("（例：他のもので代用できないか？）\n")
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("置換")
                                .foregroundColor(.orange).fontWeight(.bold)
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("（例：要素・パターン・配列・ペース・スケジュールなどを変えられないか？）\n")
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("逆転")
                                .foregroundColor(.orange).fontWeight(.bold)
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("（例：マイナスをプラスにできないか？役割を逆にできないか？）\n")
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("結合")
                                .foregroundColor(.orange).fontWeight(.bold)
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("（例：組み合わせてみたらどうか？ 目的や考えを結合できないか？ ）\n")
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("\n上記の9項目の視点をもとに、仮説を立てていきます。")
                                .frame(maxWidth:.infinity, alignment:.leading)
                        }
                    }   //文字の周り余白のため
                    .padding(.all, 30)
                }
            }
        }
    }
}

#Preview {
    Shisou1()
}
