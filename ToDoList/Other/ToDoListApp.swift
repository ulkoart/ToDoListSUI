//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Улько Артем Викторович on 09.04.2024.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {

	init() {
		FirebaseApp.configure()
	}

    var body: some Scene {
        WindowGroup {
			MainView()
        }
    }
}
