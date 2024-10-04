//
//  Gatya.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/24.
//

import SwiftUI

struct Gatya: View {
    @Environment(\.dismiss) var dismiss
    @State private var randomNumber = 1
    @State private var timer: Timer?
    @State private var isRolling = false
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color(red: 0.9, green: 0.6, blue: 0.1)
                // 背景色
                    .edgesIgnoringSafeArea(.all)
                    .toolbarBackground(.white, for: .navigationBar)
                
                VStack {
                    Spacer()
                    Image(systemName: "die.face.\(randomNumber)")
                        .resizable()
                        .scaledToFit()
                        .frame(width:UIScreen.main.bounds.width/2)
                        .padding()
                    Spacer()
                    Button{
                        playdies()
                    } label: {
                        Text("サイコロを振る")
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    .disabled(isRolling)
                    Spacer()
                }
                .padding()
            }
            
            // もどるボタン系
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            // もどるボタン系
            
        }
        
        
        
        
       
    }
    
    
    private func playdies() {
        print("ボタンが押されたよ。")
        isRolling = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            randomNumber = Int.random(in: 1...6)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            timer?.invalidate()
            timer = nil
            isRolling = false
        }
    }
    
    
    
    
}





#Preview {
    Gatya()
}
