//
//  ContentView.swift
//  VirtualBackpack
//
//  Created by Ishika Meel on 10/31/23.
//

import SwiftUI
struct TextInCapsuleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
struct ContentView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                ZStack {
                    Color(red: 246/255, green: 240/255, blue: 214/255)
                        .ignoresSafeArea()
                    VStack {
                        Text("Virtual\nBackpack")
                            .multilineTextAlignment(.center)
                            .bold()
                            .offset(y:-100)
                            .font(.system(size:50))
                        
                        NavigationLink(destination: ADayView()) {
                            ZStack {
                                Capsule()
                                    .fill( Color(red: 200/255, green: 180/255, blue: 210/255))
                                    .frame(width: 350, height: 175.5)
                                    .offset(y:-100)
                                
                                Text("A Day Backpack")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .font(.title)
                                    .offset(x:0,y:-100)
                                
                            }
                        }
                        .offset(x:0, y:30)
                        
                        
                       NavigationLink(destination: BDayView()) {
                            ZStack {
                                Capsule()
                                    .fill(Color(red: 210/255, green: 180/255, blue: 200/255))
                                    .frame(width: 350, height: 175.5)
                                    .offset(y:-50)
                                
                                Text("B Day Backpack")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .font(.title)
                                    .offset(x:0, y:-50)
                            }
                        }
                        .offset(x:0, y:30)
                        
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
        
        
    struct ContentView_Previews: PreviewProvider {
               static var previews: some View {
                   let persistentContainer = CoreDataManager.shared.persistentContainer
                   ContentView().environment(\.managedObjectContext, persistentContainer.viewContext)
               
               }
           }
           
       }

