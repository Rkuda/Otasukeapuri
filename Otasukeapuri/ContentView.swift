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
                Color(red: 0.7, green: 0.5, blue: 0.2)
                // 背景色
                    .edgesIgnoringSafeArea(.all)
                Image("Haikei")
                      .resizable()
                      .ignoresSafeArea()
                      .scaledToFill()

                VStack(spacing: 0){    // VStack始まり

                    NavigationLink(destination: ShinnkiMemo().navigationBarBackButtonHidden(true).navigationTitle("NewIdea")) {
                        Image("NewIdea4")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 300)
                            .padding(.top,50)
                    }
                    NavigationLink(destination: SubetenoMemo().navigationBarBackButtonHidden(true).navigationTitle("すべてのメモ")) {
                        Text("すべてのメモ")
                            .font(.title2)
                            .padding(.top,50)
                            .foregroundColor(Color.white)
                    }
                    NavigationLink(destination: Folder().navigationBarBackButtonHidden(true).navigationTitle("フォルダ分け")) {
                        Text("フォルダ分け")
                            .font(.title2)
                            .padding(.top,20)
                            .foregroundColor(Color.white)
                    }
                    NavigationLink(destination: Nekaseru().navigationBarBackButtonHidden(true).navigationTitle("寝かせる")) {
                        Text("寝かせる")
                            .font(.title2)
                            .padding(.top,20)
                            .foregroundColor(Color.white)
                    }
                    HStack{    // HStack始まり

                        NavigationLink(destination: Input().navigationBarBackButtonHidden(true).navigationTitle("HELP")) {
                            Image("Group 36")
                                .resizable()
                                .scaledToFit()      // 縦横比を維持しながらフレームに収める
                                .frame(width: 180)
                                .padding(.top,60)
                        }
                    }    // HStack始まり
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



