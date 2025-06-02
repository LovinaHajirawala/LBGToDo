//
//  ToDoListItem.swift
//  LBGToDo
//
//  Created by Lovina v. Hajirawala on 02/06/25.
//

import Foundation
import SwiftData

@Model
class ToDoListItem {
    var title: String
    var timestamp: Date
    var isCritical: Bool
    var isCompleted: Bool
    
    init(title: String = "",
         timestamp: Date = .now,
         isCritical: Bool = false,
         isCompleted: Bool = false) {
        self.title = title
        self.timestamp = timestamp
        self.isCritical = isCritical
        self.isCompleted = isCompleted
    }
}
