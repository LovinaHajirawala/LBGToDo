//
//  NewItemView.swift
//  LBGToDo
//
//  Created by Lovina v. Hajirawala on 02/06/25.
//

import SwiftUI

struct NewItemView: View {
    //State handling for model data
    @StateObject var viewModel = NewItemViewViewModel(_toDoTitle: "", _dueDate: Date.now)
    
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
               TextField("Title", text: $viewModel.toDoTitle)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                // Toggle
                Toggle("Important", isOn: .constant(false))
                // Button
                Button("Save") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NewItemView()
}
