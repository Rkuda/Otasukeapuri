//
//  TabView_costom.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/10/20.
//

import SwiftUI

struct TabView_costom: View {

    @State private var selected: TabItem = .memo

    var body: some View {

        ZStack{
            Image("背景紙ロゴあり")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

            TabView(selection: $selected) {
                   ShinnkiMemo()
                       .tag(TabItem.memo)
                   SubetenoMemo()
                       .tag(TabItem.library)
                   Nekaseru()
                       .tag(TabItem.leave)
                   Input()
                       .tag(TabItem.hint)
               }
               // PageTabスタイルを利用する(インジケータは非表示).
               .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            VStack{
                Spacer()
                HStack {
                    ForEach(TabItem.allCases, id: \.self) { tabItem in
                        TabItemView(tabItem: tabItem, selected: $selected)
                    }
                }
                .padding(.bottom, 40)


            }
        }
    }
}

#Preview {
    TabView_costom()
        .modelContainer(for: Memo.self)
}
