//
//  ShinnkiMemo.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/25.
//

import SwiftUI

struct ShinnkiMemo: View {
    
    
    @Environment(\.dismiss) var dismiss
    @State private var inputName = ""
    @State private var inputText = ""
    
    
    
    
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color(red: 0.4, green: 0.7, blue: 0.7)
                // 背景色
                    .edgesIgnoringSafeArea(.all)
                    .toolbarBackground(.blue, for: .navigationBar)
                
                VStack{
                    TextField("タイトルを入力してください", text: $inputName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    
                    TextEditor(text: $inputText)
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .border(.gray, width: 1)

                        .overlay(alignment: .topLeading) {
                            // 未入力の時、プレースホルダーを表示
                            if inputText.isEmpty {
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
