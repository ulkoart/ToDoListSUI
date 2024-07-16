//
//  RegisterView.swift
//  ToDoList
//
//  Created by Улько Артем Викторович on 09.04.2024.
//

import SwiftUI

struct RegisterView: View {
	
	@StateObject var viewModel = RegisterViewViewModel()
	
    var body: some View {
		VStack {
			HeaderView(
				title: "Register",
				subtitle: "Start organazing todos",
				angle: -15,
				background: .orange
			)
			
			Form {
				TextField("Full Name", text: $viewModel.name)
					.textFieldStyle(DefaultTextFieldStyle())
					.autocorrectionDisabled()

				TextField("Email Address", text: $viewModel.email)
					.textFieldStyle(DefaultTextFieldStyle())
					.autocapitalization(.none)
					.autocorrectionDisabled()

				SecureField("Password", text: $viewModel.password)
					.textFieldStyle(DefaultTextFieldStyle())

				TLButton(
					title: "Create Account",
					background: .green
				) {
					viewModel.register()
				}
				.padding()
			}
			.offset(y: -50)
			
			Spacer()
		}
	}
}

#Preview {
    RegisterView()
}
