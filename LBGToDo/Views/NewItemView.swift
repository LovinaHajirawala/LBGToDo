//
//  NewItemView.swift
//  LBGToDo
//
//  Created by Lovina v. Hajirawala on 02/06/25.
//

import SwiftUI
import SwiftData

struct NewItemView: View {
    //State handling for model data
    
    @State private var item = ToDoListItem()
    @Environment(\.modelContext) var context
    
    // Dismiss
    @Environment(\.dismiss) var dismiss
    
    
    // UI Body
    var body: some View {
        VStack {
            // Add navigation Title
            //            Text("Add your To-Do here!")
            //                .font(.system(size: 25))
            //                .bold()
            Form {
                // Title
                TextField("Title", text: $item.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                DatePicker("Due Date", selection: $item.timestamp,
                           in: Date()...,
                           displayedComponents: .date)
                .datePickerStyle(.graphical)
                
                // Toggle
                Toggle("Important", isOn: $item.isCritical)
                // Button
                Button("Save") {
                    withAnimation {
                        context.insert(item)
                    }
                    dismiss()
                }.disabled(item.title == "")
            }
        }
    }
}

#Preview {
    NewItemView()
        .modelContainer(for: ToDoListItem.self)
}
