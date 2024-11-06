//
//  Shitagaki.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/10/23.
//

import SwiftUI
import SwiftData


struct Shitagaki: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    @Query private var memo: [Memo]
    // フィルタリングされたメモリストを管理するプロパティ
        @State private var filteredMemos: [Memo] = []



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

                    List {
                        ForEach(memo.filter { $0.state == .draft }) { memo in

                            Text(memo.title)
                                .font(.custom("HannariMincho-Regular", size: 25))
                                .padding(.top,10)



                            Text(memo.content)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .padding(.bottom,20)



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
            }     //Z
        }    //N
    }    //body



}

#Preview {
    Shitagaki()
        .modelContainer(for: Memo.self)
}
