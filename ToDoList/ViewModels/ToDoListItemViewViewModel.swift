//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Улько Артем Викторович on 09.04.2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
	init() {}

	func toggleIsDone(item: ToDoListItem) {
		var itemCopy = item
		itemCopy.setDone(!item.isDone)

		guard
			let uid = Auth.auth().currentUser?.uid
		else { return }

		let db = Firestore.firestore()
		db.collection("users")
			.document(uid)
			.collection("todos")
			.document(itemCopy.id)
			.setData(itemCopy.asDictionary())
	}
}
