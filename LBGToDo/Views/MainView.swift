//
//  ContentView.swift
//  LBGToDo
//
//  Created by Lovina v. Hajirawala on 02/06/25.
//

import SwiftUI

struct MainView: View {
    // State handling
    @StateObject var viewModel = MainViewViewModel()
    @State private var showToDoButton = false
    

    // UI Body
    var body: some View {
        NavigationView {
            // Welcome Text
          Text("Hello LBG!")
            // Set the navigation Title
            .navigationTitle("To Do List")
            // Set Up the ToolBar
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showToDoButton.toggle()
                    }, label: {
                    Image(systemName: "plus")
                    } )
                }
            }
            .sheet(isPresented: $showToDoButton, content: {
                NavigationStack{
                    NewItemView()
                }
                .presentationDetents([.large])
            })
            .padding()
        }
    }
}

#Preview {
    MainView()
}
