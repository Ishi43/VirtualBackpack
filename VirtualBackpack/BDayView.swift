//
//  BDayView.swift
//  VirtualBackpack
//
//  Created by Ishika Meel on 10/31/23.
//
import SwiftUI
struct BDayView: View {
    
    
    @State private var title: String=""
    @Environment(\.managedObjectContext)private var customContext
    @FetchRequest(
        entity: BTask.entity(),
        sortDescriptors: [
            NSSortDescriptor(key: "dateCreated", ascending: false)
        ]
    )
    private var allTasks: FetchedResults<BTask>
    private func saveTask(){
        do {
            let task = BTask(context: customContext)
            task.title = title
            try customContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    private func updateTask(_ task: BTask) {
        task.isFavorite.toggle() // Toggle the isFavorite property
        do {
            try customContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = allTasks [index]
            customContext.delete(task)
            
            do {
                try customContext.save()
            } catch {
                print (error.localizedDescription)
            }
        }
    }
    var body: some View {
        NavigationView{
            
            VStack {
                Spacer()
                Text("B-Day Backpack")
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
                .navigationTitle("B Day")
        }
    }
    
}
struct TryAgain_Previews: PreviewProvider {
       static var previews: some View {
           let persistentContainer = CoreDataManager.shared.persistentContainer
           let customContext = CoreDataManager.shared.customContext
           BDayView().environment(\.managedObjectContext,customContext)
           
       }
   }

