//
//  Item.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/07.
//

import Foundation
import SwiftData

@Model
final class Memo: Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var state: MemoStatus

    init(title: String, content: String,state: MemoStatus) {
        self.title = title
        self.content = content
        self.state = state

    }
}

enum MemoStatus: String {
    case draft = "下書き"
    case final = "清書"
    case unused = "使わない"
}
