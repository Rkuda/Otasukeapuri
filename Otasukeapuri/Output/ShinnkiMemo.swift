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

    @FocusState private var isInputActive: Bool // TextEditorのフォーカス状態を管理
    @State private var keyboardHeight: CGFloat = 0 // キーボードの高さを保持

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
                    .onTapGesture {
                        UIApplication.shared.closeKeyboard()
                    }

                VStack{

                    Text("保存先を選びアイデアを保存しましょう。")
                        .font(.custom("HannariMincho-Regular", size: 15))
                        .padding(.top,35)

                    HStack{
                        Spacer()
                        Picker(selection: $state) {
                            ForEach(MemoStatus.allCases, id: \.self) { status in
                                Text(status.rawValue).tag(status)
                            }
                        } label: {
                            Text(state.rawValue)
                                .font(.custom("HannariMincho-Regular", size: 15))
                                .foregroundColor(.blue)
                        }
                        .pickerStyle(MenuPickerStyle()) // 必要に応じてPickerのスタイルを変更可能

                        Button(action: {
                            if !inputTitle.isEmpty || !inputContent.isEmpty {
                                add()
                                resetFields()
                            }


                            print(memo)
                        }) {
                            Image("Save")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 150)

                        }

                    }



                    TextField("タイトルを入力してください", text: $inputTitle)
                        .textFieldStyle(.roundedBorder)
                        .font(.custom("HannariMincho-Regular", size: 16))
                        .padding(.bottom,10)


                    ZStack{
                        TextEditor(text: $inputContent)
                            .font(.custom("HannariMincho-Regular", size: 15))
                            .focused($isInputActive) // フォーカス状態を管理
                            .frame(maxWidth:.infinity, alignment:.leading)
                        
                            .overlay(alignment: .topLeading) {
                                // 未入力の時、プレースホルダーを表示
                                if inputContent.isEmpty {
                                    Text("ここに文字を入力してください。")
                                        .allowsHitTesting(false) // タップ判定を無効化
                                        .foregroundColor(Color(uiColor: .placeholderText))
                                        .font(.custom("HannariMincho-Regular", size: 15))
                                        .padding(6)
                                }
                            }
                    }
                    .padding(.bottom, keyboardHeight) // キーボードの高さ分余白を追加
                    Spacer()

                }
                .padding(.all, 30)
                .ignoresSafeArea(.keyboard)


                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "chevron.left")
                            .onTapGesture {
                                dismiss()
                            }
                    }

                    ToolbarItem(placement: .keyboard) { // キーボード上のツールバー
                        Button("完了") {
                            isInputActive = false // フォーカスを解除
                        }
                    }

                }
            }

        }
        .onAppear {
            // キーボードの高さを監視
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    keyboardHeight = keyboardFrame.height
                }
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                keyboardHeight = 0
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self) // 監視解除
        }
    }

    private func resetFields() {
        inputTitle = ""
        inputContent = ""
    }

}

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



#Preview {
    ShinnkiMemo()
        .modelContainer(for: Memo.self)
}
