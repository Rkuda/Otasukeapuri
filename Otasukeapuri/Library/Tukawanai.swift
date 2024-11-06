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

                    Text("使わない")
                        .font(.headline)
                        .foregroundColor(.white) // 文字色
                        .padding(.top,28)

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
