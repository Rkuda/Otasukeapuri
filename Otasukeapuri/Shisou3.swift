//
//  Shisou3.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/25.
//

import SwiftUI

struct Shisou3: View {
    @Environment(\.dismiss) private var dm
    
    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                HStack{
                    Button {
                        dm()
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.black)
                        
                    }
                    Button {
                        dm()
                    } label: {
                        Text("閉じる")
                            .font(.caption)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(.black)
                    }
                    
                    
                }
                
                .padding()
                Spacer()
            }
            
            
            
        }
    }
}

#Preview {
    Shisou3()
}
