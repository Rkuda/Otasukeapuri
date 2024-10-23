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
                    NavigationLink(destination: Shitagaki().navigationBarBackButtonHidden(true).navigationTitle("下書き")) {
                        Text("下書き")
                            .font(.custom("HannariMincho-Regular", size: 30))
                            .foregroundColor(.black)
                            .padding(.all, 30) // TextViewの周りの余白を設定
                            .background(.white) // 背景色→黄色
                            .cornerRadius(20)
                            .frame(width: 300,height: 80)
                            .padding(.bottom, 10)
                            .padding(.top, 100)
                    }
                    Button("下書き"){
                        state = MemoStatus.draft
                    }
                    Button("清書"){
                        state = MemoStatus.final
                    }
                    Button("使わない"){
                        state = MemoStatus.unused
                    }
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
