//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Улько Артем Викторович on 09.04.2024.
//

import SwiftUI

struct ToDoListItemView: View {

	@StateObject var viewModel = ToDoListItemViewViewModel()
	let item: ToDoListItem

	var dateString: String {
		Date(timeIntervalSince1970: item.dueDate)
			.formatted(
				date: .abbreviated,
				time: .shortened
			)
	}

	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(item.title)
					.font(.title)
				Text(dateString)
					.font(.footnote)
					.foregroundColor(Color(.secondaryLabel))
			}
			
			Spacer()
			
			Button {
				viewModel.toggleIsDone(item: item)
			} label: {
				Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
					.foregroundColor(Color.blue)
			}
		}
	}
}
