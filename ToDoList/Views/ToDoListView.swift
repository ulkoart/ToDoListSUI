//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Улько Артем Викторович on 09.04.2024.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
	
	@StateObject var viewModel: ToDoListViewViewModel
	@FirestoreQuery var items: [ToDoListItem]
	
	private let userId: String

	init(userId: String) {
		self.userId = userId
		self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
		self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
	}

	var body: some View {
		NavigationView {
			VStack {
				List(items) { item in
					ToDoListItemView(item: item)
						.swipeActions {
							Button("Delete") {
								viewModel.delete(id: item.id)
							}
							.tint(.red)
						}
				}
				.listStyle(PlainListStyle())
			}
			.navigationTitle("To Do List")
			.toolbar {
				Button {
					viewModel.showingNewItemView = true
				} label: {
					Image(systemName: "plus")
				}
			}
			.sheet(isPresented: $viewModel.showingNewItemView, content: {
				NewItemView(newItemPresented: $viewModel.showingNewItemView)
			})
		}
    }
}
