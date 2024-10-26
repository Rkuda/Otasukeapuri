//
//  Tukawanai.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/10/23.
//

import SwiftUI
import SwiftData

struct Tukawanai: View {

    @Environment(\.dismiss) var dismiss
    @Query private var memo: [Memo]
    @State private var state: MemoStatus = MemoStatus.unused

    //Listの背景を変更するためのもの
    init() {
            UICollectionView.appearance().backgroundColor = .clear
    }
    //Listの背景を変更するためのもの

    var body: some View {
        NavigationStack{
            ZStack{
                Image("宝石")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack{

                    List(memo.filter { $0.state == .unused }) { memo in
                      HStack {
                        Text(memo.title)
                        Spacer()
                        Text(memo.content)
                      }
                    }
                    .padding(.top,30)

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
}

#Preview {
    Tukawanai()
        .modelContainer(for: Memo.self)
}
