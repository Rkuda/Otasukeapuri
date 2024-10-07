//
//  ShinnkiMemo.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/25.
//

import SwiftUI
import SwiftData

struct ShinnkiMemo: View {

    @Environment(\.modelContext) private var context
    @Query private var memo: [Memo]

    @Environment(\.dismiss) var dismiss
    @State private var inputTitle = ""
    @State private var inputContent = ""

    private func add() {
        let data = Memo(title: inputTitle, content: inputContent)
        context.insert(data)
    }

    var body: some View {

        NavigationStack{
            ZStack{
                Color(red: 0.4, green: 0.7, blue: 0.7)
                // 背景色
                    .edgesIgnoringSafeArea(.all)
                    .toolbarBackground(.blue, for: .navigationBar)

                VStack{

                    Button(action: {
                       print("保存ボタン")
                        add()
                    }) {
                       Text("保存")
                    }

                    TextField("タイトルを入力してください", text: $inputTitle)
                        .textFieldStyle(.roundedBorder)
                        .padding()

                    TextEditor(text: $inputContent)
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .border(.gray, width: 1)

                        .overlay(alignment: .topLeading) {
                            // 未入力の時、プレースホルダーを表示
                            if inputContent.isEmpty {
                                Text("ここに文字を入力してください。")
                                    .allowsHitTesting(false) // タップ判定を無効化
                                    .foregroundColor(Color(uiColor: .placeholderText))
                                    .padding(6)
                            }
                        }
                }
                .padding(.all, 30)

                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "chevron.left")
                            .onTapGesture {
                                dismiss()
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    ShinnkiMemo()
}
