//
//  Gatya.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/24.
//

import SwiftUI

struct Gatya: View {
    @Environment(\.dismiss) var dismiss
    @State private var timer: Timer?
    @State private var isRolling = false
    @State private var selectedfirstWord: String = "世界一"
    @State private var selectedsecondword: String = "可愛らしい"
    @State private var selectedthirdword: String = "ロボット"

    // ワードのリスト
    let firstwords = ["世界一", "過去最高に", "何よりも", "とんでもなく", "歴史に残る"]
    let secondwords = ["卑怯な", "卑猥な", "強烈な", "可愛らしい", "弱々しい"]
    let thirdwords = ["ロボット", "お箸", "貯金箱", "書物", "サービス"]


    var body: some View {

        NavigationStack{
            ZStack{
                Image("煙")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                VStack {
                    // 選ばれたワードを表示
                    Text(selectedfirstWord)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    Text(selectedsecondword)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    Text(selectedthirdword)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()

                    // スロットを回すボタン
                    Button(action: {
                        isRolling = true
                        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                        // ランダムにワードを選ぶ
                        selectedfirstWord = firstwords.randomElement() ?? ""
                        selectedsecondword = secondwords.randomElement() ?? ""
                        selectedthirdword = thirdwords.randomElement() ?? ""
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            timer?.invalidate()
                            timer = nil
                            isRolling = false
                        }
                    }) {
                        Text("スロットを回す")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }.disabled(isRolling)
                }
                .padding()
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
    Gatya()
}
