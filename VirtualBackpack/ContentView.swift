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
                        NavigationLink(destination: TryAgain()) {
                            ZStack {
                                Capsule()
                                    .fill( Color(red: 172/255, green: 214/255, blue: 87/255))
                                    .frame(width: 437.5, height: 187.5)
                                
                                Text("Calendar")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .font(.largeTitle)
                                    .offset(x:80)
                                
                            }
                        }
                        .offset(x:-180, y:30)
                        
                        
                        NavigationLink(destination: Bday()) {
                            ZStack {
                                Capsule()
                                    .fill(Color(red: 149/255, green: 214/255, blue: 255/255))
                                    .frame(width: 437.5, height: 187.5)
                                
                                Text("Resources")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .font(.largeTitle)
                                    .offset(x:-95, y:0)
                            }
                        }
                        .offset(x:190, y:20)
                        
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
        
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
        
    }
