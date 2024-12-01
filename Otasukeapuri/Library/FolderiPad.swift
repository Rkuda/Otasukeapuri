//
//  FolderiPad.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/11/14.
//

import SwiftUI
import SwiftData

struct FolderiPad: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    @Query private var memo: [Memo]
    @State private var inputTitle = ""
    @State private var inputContent = ""

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationStack{
            ZStack{
                Image("宝石")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                VStack(spacing: 0){

                    Image("Librarytitle")
                        .resizable()
                        .scaledToFit()      // 縦横比を維持しながらフレームに収める
                        .frame(width: 150)
                        .padding(.bottom,30)
                        .padding(.top,450)

                    Text("メモを残す際に選んだファイルごとにアイデアを振り返ることができます。データの削除をする際はスライドで行えます。")
                        .font(.custom("HannariMincho-Regular", size: 20))
                        .foregroundColor(.white) // 文字色
                        .frame(width: 600)
                        .padding(.bottom,20)


                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 660, height: 80)
                            .padding(.top, 20)

                        NavigationLink(destination: SitagakiiPad().navigationBarBackButtonHidden(true).navigationTitle("下書き")
                            .navigationBarTitleDisplayMode(.inline)) {
                            HStack{
                                Spacer()
                                Text("下書き")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)
                                Spacer()


                            }
                        }


                    }

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width:660, height: 80)
                            .padding(.top, 20)

                        NavigationLink(destination: SeisyoiPad().navigationBarBackButtonHidden(true).navigationTitle("清書")
                            .navigationBarTitleDisplayMode(.inline)) {
                            HStack{
                                Spacer()
                                Text("清書")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)

                                Spacer()
                            }
                        }

                    }

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 660, height: 80)
                            .padding(.top, 20)

                        NavigationLink(destination: TukawanaiiPad().navigationBarBackButtonHidden(true).navigationTitle("使わないかも")
                            .navigationBarTitleDisplayMode(.inline)) {
                            HStack{
                                Spacer()
                                Text("使わないかも")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)

                                Spacer()
                            }
                        }


                    }

                    

                    Spacer()
                }
                .padding(.top,50)
                .padding(.bottom,50)

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
}

#Preview {
    FolderiPad()
}
