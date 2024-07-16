//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Улько Артем Викторович on 09.04.2024.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
	
	@Published var currentUserId: String = ""

	private var handler: AuthStateDidChangeListenerHandle?
	
	init() {
		self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
			DispatchQueue.main.async {
				self?.currentUserId = user?.uid ?? ""
			}
		}
	}
	

	public var isSignedIn: Bool {
		return Auth.auth().currentUser != nil
	}
	
}
