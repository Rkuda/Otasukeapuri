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
    @Environment(\.dismiss) var dismiss
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
                
                    List(memo) { memo in

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
    SubetenoMemo()
}
