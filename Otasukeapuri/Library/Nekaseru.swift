//
//  Nekaseru.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/10/07.
//

import SwiftUI

struct Nekaseru: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            ZStack{
                Image("扉")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
            }
            // もどるボタン系
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            // もどるボタン系
        }
    }
}

#Preview {
    Nekaseru()
}
