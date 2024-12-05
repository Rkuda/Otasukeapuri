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
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
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
                        ForEach(memo.filter { $0.state == .final }) { memo in
                            Text(memo.title)
                                .font(.custom("HannariMincho-Regular", size: 25))
                                .padding(.top,10)
                            Text(memo.content)
                                .font(.custom("HannariMincho-Regular", size: 16))
                                .padding(.bottom,10)
                            Divider()
                        }
                        .onDelete(perform: deleteMemo)
                    }
                   .padding(.bottom,50)
                   .padding(.top,80)
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

    private func deleteMemo(at offsets: IndexSet) {
            // 削除対象のメモを特定
            let filteredMemos = memo.filter { $0.state == .final }
            for index in offsets {
                let memoToDelete = filteredMemos[index]
                context.delete(memoToDelete) // モデルコンテキストから削除
            }
            try? context.save() // 削除を保存
        }

}

#Preview {
    Seisyo()
        .modelContainer(for: Memo.self)
}
