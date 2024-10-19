//
//  Tabview_test.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/10/19.
//

import SwiftUI

struct Tabview_test: View {
    
   
    var body: some View {

        NavigationStack{    // NavigationStackおわり

            ZStack{     // ZStack始まり
                Color(red: 0.7, green: 0.5, blue: 0.2)
                // 背景色
                    .edgesIgnoringSafeArea(.all)
                Image("Haikei")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                TabView{
                    ContentView()
                                    .tabItem {
                                        Image("Group 45")
                                            .font(.system(size: 60))
                                    }
                    SubetenoMemo()
                                    .tabItem {
                                        Image("Group 46")
                                            .resizable()
                                                                .frame(width: 10.0, height: 10.0)
                                    }
                    Nekaseru()
                                    .tabItem {
                                        Image("Group 47")
                                            .resizable()
                                                                .frame(width: 10.0, height: 10.0)
                                    }
                                Input() 
                                    .tabItem {
                                        Image("Group 48")
                                    }
                }
            }    // ZStackおわり
        }   // NavigationStackおわり
    }
}



#Preview {
    Tabview_test()
}
