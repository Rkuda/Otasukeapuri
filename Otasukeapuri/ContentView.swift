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

    init() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.clear
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        

        }

    var body: some View {

        NavigationStack{    // NavigationStackおわり

            ZStack{     // ZStack始まり
                Color(red: 0.7, green: 0.5, blue: 0.2)
                // 背景色
                    .edgesIgnoringSafeArea(.all)
                Image("背景紙ロゴあり")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                VStack(spacing: 0){    // VStack始まり

                    NavigationLink(destination: ShinnkiMemo().navigationBarBackButtonHidden(true)) {
                        Image("NewIdea4")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 320)
                            .padding(.bottom,10)
                            .padding(.top,50)
                    }
                    Text("新しいアイデアをメモしましょう。")
                    .padding(.bottom,30)
                    .font(.custom("HannariMincho-Regular", size: 18))

                    HStack(spacing: 0){
                        NavigationLink(destination: SubetenoMemo().navigationBarBackButtonHidden(true).navigationTitle("Library")) {
                            Image("Library4")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 180)

                        }
                        NavigationLink(destination: Nekaseru().navigationBarBackButtonHidden(true).navigationTitle("Leave")) {
                            Image("Leave4")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 180)

                        }
                    }

                        NavigationLink(destination: Input().navigationBarBackButtonHidden(true).navigationTitle("Hint")) {
                            Image("Hint4")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 200)
                        }

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



