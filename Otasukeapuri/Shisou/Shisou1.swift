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
                            .font(.custom("HannariMincho-Regular", size: 15))
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(.black)
                    }
                }

                .padding()

                Text("とんでも法")
                    .font(.custom("HannariMincho-Regular", size: 25))
                    .fontWeight(.black)
                Spacer()

                ScrollView{

                    ZStack{  //文字の周り余白のため

                        VStack{

                            Text("簡単に言うと、アイデアを考える上で例えば〇〇なら？の〇〇の部分をとんでもない尺度で考えてみる思考方法です。この方法はアイデアの内容によって色々な方向から考えられますが、ここでは例として４つの尺度をご紹介します。")
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)
                            Text("１.とんでもなくサイズを大きく・小さくしたら？")
                                .foregroundColor(.blue)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("プロダクトや製品のアイデアの際に使いやすいとんでも法です。\n例：何mもある消しゴム、何が入るかわからないくらい小さなゴミ箱、など")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)

                            Text("２.とんでもなくコアな層向けにしてみたら？")
                                .foregroundColor(.blue)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("サービスを考える際に使いやすいとんでも法です。\n例：ブランドの〇〇商品を使い続けて５年以上のユーザーのみの集会、など")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)

                            Text("３.とんでもなく規模感を大きくしたら？")
                                .foregroundColor(.blue)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("凝り固まった規模感を解きほぐすためのとんでも法です。\n例：全国規模で集まるラジオ体操、100人で会うマッチングアプリ、など")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)

                            Text("４.とんでもなく馬鹿げた方向に考えてみたら？")
                                .foregroundColor(.blue)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .padding(.bottom,10)
                            Text("どんなアイデアにも使いやすいとんでも法です。こんなにふざけるのは…などと躊躇せず楽しくふざけてみましょう。\n例：残飯だけの飲食店、使うと悲鳴をあげるお箸、など")
                                .frame(maxWidth:.infinity, alignment:.leading)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .padding(.bottom,30)

                            Text("このように今あるアイデアを尺度を極端に変えて飛躍して考えてみます。すると思いの外斬なアイデアに繋がることがあります。")
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
    Shisou1()
}
