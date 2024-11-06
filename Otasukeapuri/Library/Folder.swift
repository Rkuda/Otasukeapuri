//
//  Folder.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/10/07.
//

import SwiftUI
import SwiftData

struct Folder: View {
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
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
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

                    Text("メモを残す際に選んだファイルごとにアイデアを振り返ることができます。データの削除をする際はデータ管理フォルダで行ってください。その他のフォルダは閲覧のみを行うことができます。")
                        .font(.custom("HannariMincho-Regular", size: 15))
                        .foregroundColor(.white) // 文字色
                        .frame(width: 300)
                        .padding(.bottom,20)


                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 330, height: 80)
                            .padding(.top, 20)

                        NavigationLink(destination: Shitagaki().navigationBarBackButtonHidden(true).navigationTitle("")) {
                            HStack{
                                Spacer().frame(width: 55)
                                Text("下書き")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)

                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .padding(.top,20)
                                    .padding()
                                Spacer().frame(width: 40)
                            }
                        }

                    }

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width:330, height: 80)
                            .padding(.top, 20)

                        NavigationLink(destination: Seisyo().navigationBarBackButtonHidden(true).navigationTitle("")) {
                            HStack{
                                Spacer().frame(width: 60)
                                Text("清書")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)

                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .padding(.top,20)
                                    .padding()
                                Spacer().frame(width: 40)
                            }
                        }
                    }

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 330, height: 80)
                            .padding(.top, 20)

                        NavigationLink(destination: Tukawanai().navigationBarBackButtonHidden(true).navigationTitle("")) {
                            HStack{
                                Spacer().frame(width: 60)
                                Text("使わない")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)

                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .padding(.top,20)
                                    .padding()
                                Spacer().frame(width: 40)
                            }
                        }

                    }

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.black)
                            .stroke(Color.white, lineWidth: 1)
                            .frame(width: 330, height: 80)
                            .padding(.top, 20)

                        NavigationLink(destination: SubetenoMemo().navigationBarBackButtonHidden(true).navigationTitle("データ管理")) {
                            HStack{
                                Spacer().frame(width: 60)
                                Text("データ管理")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.white)
                                    .padding(.top)

                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .padding(.top,20)
                                    .padding()
                                Spacer().frame(width: 40)
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
    Folder()
        .modelContainer(for: Memo.self)
}
