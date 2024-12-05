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
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.clear]
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
                        ForEach(memo.filter { $0.state == .draft }) { memo in
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
            }     //Z
        }    //N
    }    //body

    private func deleteMemo(at offsets: IndexSet) {
            // 削除対象のメモを特定
            let filteredMemos = memo.filter { $0.state == .draft }
            for index in offsets {
                let memoToDelete = filteredMemos[index]
                context.delete(memoToDelete) // モデルコンテキストから削除
            }
            try? context.save() // 削除を保存
        }

}

#Preview {
    Shitagaki()
        .modelContainer(for: Memo.self)
}
