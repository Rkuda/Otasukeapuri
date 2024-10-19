//
//  TabItemView.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/10/19.
//

import SwiftUI


struct TabItemView: View {

    let tabItem: TabItem
        @Binding var selected: TabItem

        var body: some View {
           
            Image("\(tabItem)")
                .resizable()
                .aspectRatio(contentMode: .fit)
            // 選択状態によって、サイズや間隔を調整する.
                   .frame(width: tabItem == selected ? 95 : 70)
                   
                   .offset(y: tabItem == selected ? -15 : 0)
                .onTapGesture {
                    selected = tabItem // タップしたら自身をselectedに.
                }
        }
}

#Preview {
    TabView_costom()
        .modelContainer(for: Memo.self)
}
