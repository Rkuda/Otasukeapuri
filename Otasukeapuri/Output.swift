import SwiftUI
import SwiftData

struct Output: View {
    
    init() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor.orange
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.blue, .font : UIFont.systemFont(ofSize: 40)]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont.systemFont(ofSize: 40, weight: .bold)]
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    }
    
    @Environment(\.dismiss) var dismiss
    
    // 保存のやつ
    @Environment(\.modelContext) private var context
    @Query private var todos: [Todo]
    
    @State private var textFieldInput = ""
    // 保存のやつ
    
  
    
    var body: some View {
        NavigationStack{
            
            
            ZStack{
                Color(red: 0.4, green: 0.7, blue: 0.7)
                // 背景色
                    .edgesIgnoringSafeArea(.all)
                    .toolbarBackground(.blue, for: .navigationBar)
            
                VStack{
                    
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: ShinnkiMemo().navigationBarBackButtonHidden(true).navigationTitle("新規メモ")) {
                        Image("Group 10")
                            .resizable()
                            .scaledToFit()      // 縦横比を維持しながらフレームに収める
                            .frame(width: 200)
                            .padding(.top,50)
                        
                        }
                    
                    .padding()
                    Text("新規メモを作ろう!")
                    
                    
                 Spacer()
                       
                 Spacer()
                    
                }
                
                
                
                
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            
        }
        
        
        
        
        
    }
    private func add(todo: String) {
        let data = Todo(content: todo)
        context.insert(data)
    }

    private func delete(todo: Todo) {
        context.delete(todo)
    }

    private func update() {
        let updatingTodoIndex = todos.firstIndex { !$0.isDone }
        guard let updatingTodoIndex else { return }
        todos[updatingTodoIndex].isDone = true
        try? context.save()
    }
}

#Preview {
    Output()
        .modelContainer(for: Todo.self)
}

