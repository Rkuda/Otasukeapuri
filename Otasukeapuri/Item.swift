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

    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}


