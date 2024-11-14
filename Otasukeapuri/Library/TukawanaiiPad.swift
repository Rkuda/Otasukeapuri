//
//  TukawanaiiPad.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/11/14.
//

import SwiftUI
import SwiftData

struct TukawanaiiPad: View {
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
                        ForEach(memo.filter { $0.state == .unused }) { memo in
                            Text(memo.title)
                                .font(.custom("HannariMincho-Regular", size: 25))
                                .padding(.top,10)
                            Text(memo.content)
                                .font(.custom("HannariMincho-Regular", size: 18))
                                .padding(.bottom,20)
                        }
                    }
                    .padding(.bottom,50)
                    .padding(.top,360)
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
    TukawanaiiPad()
}
