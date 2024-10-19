//
//  SubetenoMemo.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/10/07.
//

import SwiftUI
import SwiftData

struct SubetenoMemo: View {
    @Environment(\.dismiss) var dismiss
    @Query private var memo: [Memo]

    var body: some View {

        NavigationStack{
            VStack{
                List(memo) { memo in
                    HStack {
                        Text(memo.title)
                        Spacer()
                        Text(memo.content)
                    }

                }

            }
            // もどるボタン系
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
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
    SubetenoMemo()
}
