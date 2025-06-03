//
//  ContentView.swift
//  LBGToDo
//
//  Created by Lovina v. Hajirawala on 02/06/25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    // State handling
    @Environment(\.modelContext) var context
    
    @State private var showToDoButton = false
    @State private var todoToEditItem : ToDoListItem?
    @Query private var items : [ToDoListItem]
    
    // UI Body
    var body: some View {
        NavigationStack {
            
            if items.isEmpty {
                // Welcome Text if no items entered
                VStack(alignment: .leading, spacing: 0.2){
                    Label("Hello LBG!!", systemImage: "star")
                        .font(.title)
                        .labelStyle(.titleOnly)
                }.padding()
            }
            List {
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading, spacing: 0.2) {
                            if item.isCritical {
                                Label("Critical", systemImage: "exclamationmark")
                                    .font(.footnote)
                                    .labelStyle(.titleAndIcon)
                                    .foregroundColor(.red)
                            }
                            
                            // Display the Title
                            Text(item.title)
                                .font(.title)
                                .bold()
                            
                            // Display the Timestamp
                            Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .shortened) )")
                                .font(.subheadline)
                        }
                        // Add Spacer
                        Spacer()
                        // Display checkmark button
                        Button {
                            withAnimation {
                                item.isCompleted.toggle()
                            }
                        } label : {
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle.fill)
                                .foregroundStyle(item.isCompleted ? .green : .gray)
                                .font(.title)
                        }
                        .buttonStyle(.plain)
                    } // Add Swipe ations
                    .swipeActions {
                        Button(role: .destructive) {
                            
                            withAnimation {
                                context.delete(item)
                            }
                        } label : {
                            Label("", systemImage: "trash")
                                .symbolVariant(.fill)
                        }
                        
                        Button {
                            todoToEditItem = item
                        } label : {
                            Label("", systemImage: "pencil")
                        }
                        .tint(.orange)
                    }
                }
            }
            
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
            
        }
    }
}



#Preview {
    MainView()
}
