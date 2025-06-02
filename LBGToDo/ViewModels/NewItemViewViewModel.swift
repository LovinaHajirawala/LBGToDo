//
//  NewItemViewViewModel.swift
//  LBGToDo
//
//  Created by Lovina v. Hajirawala on 02/06/25.
//

import Foundation

// This class is to create a new to-do

class NewItemViewViewModel : ObservableObject {
    //Declare properties
    @Published var toDoTitle: String = ""
    @Published var dueDate: Date = Date()
    
    // Initialise properties
    init(_toDoTitle: String, _dueDate: Date) {
        toDoTitle = _toDoTitle
        dueDate = _dueDate
    }
}
