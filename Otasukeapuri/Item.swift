//
//  Item.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/07.
//

import Foundation
import SwiftData

@Model
final class Todo {    // 保存のやつ
    var content: String
    var isDone: Bool
    let registerDate: Date

    init(content: String) {
        self.content = content
        isDone = false
        registerDate = Date()
    }
}
