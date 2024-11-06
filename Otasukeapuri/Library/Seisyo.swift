//
//  Seisyo.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/10/23.
//

import SwiftUI
import SwiftData

struct Seisyo: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    @Query private var memo: [Memo]
    
    
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

                    List(memo.filter { $0.state == .final }) { memo in
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
    Seisyo()
        .modelContainer(for: Memo.self)
}
