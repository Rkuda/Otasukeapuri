//
//  ShinnkiMemo.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/25.
//

import SwiftUI
import SwiftData

struct ShinnkiMemo: View {

    @Environment(\.modelContext) var context
    @Query private var memo: [Memo]

    @Environment(\.dismiss) var dismiss
    @State private var inputTitle = ""
    @State private var inputContent = ""
    @State private var state: MemoStatus = MemoStatus.draft

    private func add() {
        let data = Memo(title: inputTitle, content: inputContent, state: state)
        context.insert(data)
        saveContext()
    }

    private func saveContext() {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    init() {
            UITextView.appearance().backgroundColor = .clear
        }

    var body: some View {

        NavigationStack{
            ZStack{
                Color(red: 0.4, green: 0.7, blue: 0.7)
                // 背景色
                    .edgesIgnoringSafeArea(.all)
                    .toolbarBackground(.blue, for: .navigationBar)
                Image("背景紙")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                VStack{

                    HStack{

                        Menu("ファイルを選択"){
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
                        .menuStyle(.button)
                        .foregroundColor(.black)

                        Spacer()

                        Button(action: {
                            if !inputTitle.isEmpty || !inputContent.isEmpty {
                                add()
                            }
                            print(memo)
                        }) {
                            Image("Save")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 180)
                        }
                    }

                    TextField("タイトルを入力してください", text: $inputTitle)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom,10)


                    ZStack{
                        TextEditor(text: $inputContent)
                            .frame(maxWidth:.infinity, alignment:.leading)
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
                }
                .padding(.all, 30)

                /*
                 戻るボタン
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "chevron.left")
                            .onTapGesture {
                                dismiss()
                            }
                    }
                }
                 */
            }
        }
    }
}

#Preview {
    ShinnkiMemo()
        .modelContainer(for: Memo.self)
}
