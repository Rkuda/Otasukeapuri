//
//  ContentView.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/07.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var isShowingView: Bool = false

    // 保存のやつ
    @Environment(\.modelContext) private var context

    @State private var textFieldInput = ""
    // 保存のやつ

    var body: some View {

        NavigationStack{    // NavigationStackおわり

            ZStack{     // ZStack始まり
                Color(red: 0.8, green: 0.6, blue: 0.3)
                // 背景色
                    .edgesIgnoringSafeArea(.all)


                VStack(spacing: 0){    // VStack始まり
                    Image(decorative: "logo")
                        .resizable()
                        .scaledToFit()      // 縦横比を維持しながらフレームに収める
                        .frame(width: 200)
                        .padding(.top,30)

                    NavigationLink(destination: ShinnkiMemo().navigationBarBackButtonHidden(true).navigationTitle("新規メモ")) {
                        Image("Group 26")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 300)
                            .padding(.top,50)
                    }

                    NavigationLink(destination: Input().navigationBarBackButtonHidden(true).navigationTitle("インプット")) {
                        Image("Group 2")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 300)
                            .padding(.top,50)
                    }

                    Image(decorative: "lamp1")
                        .resizable()
                        .scaledToFit()      // 縦横比を維持しながらフレームに収める
                        .frame(width: 200)
                        .padding(.top,50)

                }    // VStack始まり
            }    // ZStackおわり
        }   // NavigationStackおわり
    }
}


// スワイプで戻れる
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
// スワイプで戻れる

#Preview  {
    ContentView()
        .modelContainer(for: Memo.self)
}



