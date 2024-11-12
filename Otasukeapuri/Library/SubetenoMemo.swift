//
//  SubetenoMemo.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/10/07.
//

import SwiftUI
import SwiftData
//Listの背景を変更するためのもの
extension UICollectionReusableView {
    override open var backgroundColor: UIColor? {
        get { .clear }
        set { }
    }
}
//Listの背景を変更するためのもの

struct SubetenoMemo: View {

    @Query private var memo: [Memo]
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext


    //Listの背景を変更するためのもの
    init() {
        UICollectionView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorColor = .black
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

                    Text("データ管理")
                        .font(.headline)
                        .foregroundColor(.white) // 文字色
                        .padding(.top,28)

                    Text("データの管理を行う場所です。必要が無くなったデータはスライドして削除できます。")
                        .font(.custom("HannariMincho-Regular", size: 15))
                        .foregroundColor(.white) // 文字色
                        .frame(width: 300)
                        .padding(.top,30)
                    List{
                        ForEach(memo, id: \.self) { memo in



                            Text(memo.title)
                                .font(.custom("HannariMincho-Regular", size: 25))
                                .padding(.top,10)



                            Text(memo.content)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .padding(.bottom,20)



                        }
                        .onDelete(perform: deleteItems)


                    }
                }
                .padding(.bottom,50)

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


    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                // 削除する
                modelContext.delete(memo[index])
            }
        }

    }
}

#Preview {
    SubetenoMemo()
        .modelContainer(for: Memo.self)
}

