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
                        .padding(.top,20)

                    Text("メモを残す際に選んだファイルごとにアイデアを振り返ることができます。データの削除はスライドで行えます。")
                        .font(.custom("HannariMincho-Regular", size: 15))
                        .foregroundColor(.white) // 文字色
                        .frame(width: 300)
                        .padding(.bottom,20)


                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 0.21, green: 0.16, blue: 0.06))
                            .stroke(Color.white, lineWidth: 1)
                            .frame(width: 330, height: 80)
                            .padding(.top, 20)

                        NavigationLink(destination: Shitagaki().navigationBarBackButtonHidden(true).navigationTitle("下書き")
                            .navigationBarTitleDisplayMode(.inline)) {
                            HStack{
                                Spacer().frame(width: 70)
                                Text("下書き")
                                    .font(.custom("HannariMincho-Regular", size: 25))
                                    .foregroundColor(.white)
                                    .padding(.top)

                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .padding(.top,20)
                                    .padding()
                                Spacer().frame(width: 55)
                            }
                        }
                        

                    }

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 0.21, green: 0.16, blue: 0.06))
                            .stroke(Color.white, lineWidth: 1)
                            .frame(width: 330, height: 80)
                            .padding(.top, 20)

                        NavigationLink(destination: Seisyo().navigationBarBackButtonHidden(true).navigationTitle("清書")
                            .navigationBarTitleDisplayMode(.inline)) {
                            HStack{
                                Spacer().frame(width: 70)
                                Text("清書")
                                    .font(.custom("HannariMincho-Regular", size: 25))
                                    .foregroundColor(.white)
                                    .padding(.top)

                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .padding(.top,20)
                                    .padding()
                                Spacer().frame(width: 55)
                            }
                        }

                    }

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 0.21, green: 0.16, blue: 0.06))
                            .stroke(Color.white, lineWidth: 1)
                            .frame(width: 330, height: 80)
                            .padding(.top, 20)

                        NavigationLink(destination: Tukawanai().navigationBarBackButtonHidden(true).navigationTitle("使わないかも")
                            .navigationBarTitleDisplayMode(.inline)) {
                            HStack{
                                Spacer().frame(width: 70)
                                Text("使わないかも")
                                    .font(.custom("HannariMincho-Regular", size: 25))
                                    .foregroundColor(.white)
                                    .padding(.top)

                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .padding(.top,20)
                                    .padding()
                                Spacer().frame(width: 55)
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
