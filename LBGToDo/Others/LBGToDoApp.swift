//
//  LBGToDoApp.swift
//  LBGToDo
//
//  Created by Lovina v. Hajirawala on 02/06/25.
//

import SwiftUI
import SwiftData

@main
struct LBGToDoApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: ToDoListItem.self)
        }
    }
}
