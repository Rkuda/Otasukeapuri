//
//  Nekaseru.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/10/07.
//

import SwiftUI

struct Nekaseru: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            ZStack{
                Image("扉")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                VStack{
                    Text("ここは思い悩んだアイデアと一旦距離を取るための場所です。一定期間時間アイデアを寝かせた後にもう一度アイデアを見た時、あなたがどのように感じるでしょうか。")
                        .font(.custom("HannariMincho-Regular", size: 15))
                        .foregroundColor(.white) // 文字色
                        .frame(width: 300,height: 100)

                        .padding(.top,90)

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
    Nekaseru()
       
}
