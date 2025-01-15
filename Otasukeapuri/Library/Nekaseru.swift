//
//  Nekaseru.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/10/07.
//

import SwiftUI
import SwiftData

struct Nekaseru: View {
    @Environment(\.dismiss) var dismiss
    @Query private var memo: [Memo]
    @Environment(\.modelContext) private var context

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
                Image("扉")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                VStack{

                    Image("Leavetitle")
                        .resizable()
                        .scaledToFit()      // 縦横比を維持しながらフレームに収める
                        .frame(width: 150)
                        .padding(.bottom,10)
                        .padding(.top,20)

                    Text("ここは思い悩んだアイデアと一旦距離を取るための場所です。寝かせた後に再びアイデアを見た時、あなたがはのように感じるでしょうか？")
                        .font(.custom("HannariMincho-Regular", size: 15))
                        .foregroundColor(.white) // 文字色
                        .frame(width: 300)

                    List {
                        ForEach(memo.filter { $0.state == .nekaseru }) { memo in

                            
                            Text(memo.title)

                                .font(.custom("HannariMincho-Regular", size: 25))
                                .padding(.top,10)

                            Text(memo.content)
                                .font(.custom("HannariMincho-Regular", size: 16))
                                .padding(.bottom,10)
                                .lineSpacing(5)

                            Divider()
                                .background(Color.gray)

                        }
                        .onDelete(perform: deleteMemo)

                    }
                    .padding(.bottom,50)



                }.padding(.top,60)

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

    private func deleteMemo(at offsets: IndexSet) {
            // 削除対象のメモを特定
            let filteredMemos = memo.filter { $0.state == .nekaseru }
            for index in offsets {
                let memoToDelete = filteredMemos[index]
                context.delete(memoToDelete) // モデルコンテキストから削除
            }
            try? context.save() // 削除を保存
        }


}

#Preview {
    Nekaseru()
        .modelContainer(for: Memo.self)

}
