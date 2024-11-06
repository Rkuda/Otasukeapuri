//
//  Folder.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/10/07.
//

import SwiftUI
import SwiftData

struct Folder: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    @Query private var memo: [Memo]
    @State private var inputTitle = ""
    @State private var inputContent = ""
    


    var body: some View {
        NavigationStack{
            ZStack{
                Image("宝石")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()

                VStack{

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 330, height: 80)
                            .padding(.top, 20)
                        HStack{
                            Spacer().frame(width: 45)
                            NavigationLink(destination: SubetenoMemo().navigationBarBackButtonHidden(true).navigationTitle("すべてのメモ")) {
                                Text("すべてのメモ")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)
                            }.padding()
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .padding(.top,20)
                                .padding()
                            Spacer().frame(width: 40)
                        }

                    }.padding(.top,80)


                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 330, height: 80)
                            .padding(.top, 20)
                        HStack{
                            Spacer().frame(width: 45)
                            NavigationLink(destination: Shitagaki().navigationBarBackButtonHidden(true).navigationTitle("下書き")) {
                                Text("下書き")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)
                            }.padding()
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .padding(.top,20)
                                .padding()
                            Spacer().frame(width: 40)
                        }

                    }

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width:330, height: 80)
                            .padding(.top, 20)
                        HStack{
                            Spacer().frame(width: 45)
                            NavigationLink(destination: Seisyo().navigationBarBackButtonHidden(true).navigationTitle("清書")) {
                                Text("清書")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)
                            }.padding()
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .padding(.top,20)
                                .padding()
                            Spacer().frame(width: 40)
                        }
                    }

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 330, height: 80)
                            .padding(.top, 20)
                        HStack{
                            Spacer().frame(width: 45)
                            NavigationLink(destination: Tukawanai().navigationBarBackButtonHidden(true).navigationTitle("使わない")) {
                                Text("使わない")
                                    .font(.custom("HannariMincho-Regular", size: 30))
                                    .foregroundColor(.black)
                                    .padding(.top)
                            }.padding()
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .padding(.top,20)
                                .padding()
                            Spacer().frame(width: 40)
                        }

                    }

                    Spacer()
                }

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
    Folder()
        .modelContainer(for: Memo.self)
}
