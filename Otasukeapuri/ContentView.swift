//
//  ContentView.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/07.
//

import SwiftUI
import SwiftData

struct ContentView: View {

        var body: some View {
            if UIDevice.current.userInterfaceIdiom == .pad {
                ContentViewiPad()
                    } else {
                        ContentViewiPhone()
                    }
        }
}


// スワイプで戻れる
extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
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



