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
    @Query private var memo: [Memo]
    @State private var inputTitle = ""
    @State private var inputContent = ""
    @State private var state: MemoStatus = MemoStatus.draft


    var body: some View {
        NavigationStack{
            ZStack{
                Image("宝石")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                VStack{
                    NavigationLink(destination: SubetenoMemo().navigationBarBackButtonHidden(true).navigationTitle("すべてのメモ")) {
                        Text("すべてのメモ")
                            .font(.custom("HannariMincho-Regular", size: 30))
                            .foregroundColor(.black)
                            .padding(.all, 30) // TextViewの周りの余白を設定
                            .background(.white) // 背景色→黄色
                            .cornerRadius(20)
                            .frame(width: 300,height: 60)
                            .padding(.bottom, 50)
                            .padding(.top, 120)

                            }

                    NavigationLink(destination: Shitagaki().navigationBarBackButtonHidden(true).navigationTitle("下書き")) {
                        Text("下書き")
                            .font(.custom("HannariMincho-Regular", size: 30))
                            .foregroundColor(.black)
                            .padding(.all, 30) // TextViewの周りの余白を設定
                            .background(.white) // 背景色→黄色
                            .cornerRadius(20)
                            .frame(width: 300,height: 60)
                            .padding(.bottom, 50)
                    }

                    NavigationLink(destination: Seisyo().navigationBarBackButtonHidden(true).navigationTitle("清書")) {
                        Text("清書")
                            .font(.custom("HannariMincho-Regular", size: 30))
                            .foregroundColor(.black)
                            .padding(.all, 30) // TextViewの周りの余白を設定
                            .background(.white) // 背景色→黄色
                            .cornerRadius(20)
                            .frame(width: 300,height: 60)
                            .padding(.bottom, 50)
                    }

                    NavigationLink(destination: Tukawanai().navigationBarBackButtonHidden(true).navigationTitle("あんまり")) {
                        Text("あんまり")
                            .font(.custom("HannariMincho-Regular", size: 30))
                            .foregroundColor(.black)
                            .padding(.all, 30) // TextViewの周りの余白を設定
                            .background(.white) // 背景色→黄色
                            .cornerRadius(20)
                            .frame(width: 300,height: 60)
                            .padding(.bottom, 10)
                           }
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
}

#Preview {
    Folder()
}
