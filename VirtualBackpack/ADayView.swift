//
//  ADayView.swift
//  VirtualBackpack
//
//  Created by Ishika Meel on 10/31/23.
//

import SwiftUI
struct TryAgain: View {
    
    
    @State private var title: String=""
    @Environment(\.managedObjectContext)private var viewContext
    @FetchRequest(
        entity: Task.entity(),
        sortDescriptors: [
            NSSortDescriptor(key: "dateCreated", ascending: false)
        ]
    )
    private var allTasks: FetchedResults<Task>
    private func saveTask(){
        do {
            let task = Task(context: viewContext)
            task.title = title
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    private func updateTask(_ task: Task) {
        task.isFavorite.toggle() // Toggle the isFavorite property
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = allTasks [index]
            viewContext.delete(task)
            
            do {
                try viewContext.save()
            } catch {
                print (error.localizedDescription)
            }
        }
    }
    var body: some View {
        NavigationView{
            
            VStack {
                Spacer()
                Text("A Day Backpack")
                    .font(.title)
                    .bold()
                    
                
                TextField("Enter Object", text: $title)
                    .textFieldStyle(.roundedBorder)
                Button("Add to Backpack"){
                    saveTask()
                }
                .padding(10)
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                
                List {
                    ForEach(allTasks) { task in
                        HStack {
                            Text(task.title ?? "")
                            Spacer()
                            Image(systemName: task.isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .onTapGesture {
                                    updateTask(task)
                                }
                        }
                    }.onDelete(perform: deleteTask)
                }
                
            }
            Spacer()
                .padding()
                .navigationTitle("A Day")
        }
    }
    
    
    struct TryAgain_Previews: PreviewProvider {
        static var previews: some View {
            let persistentContainer = CoreDataManager.shared.persistentContainer
            TryAgain().environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
