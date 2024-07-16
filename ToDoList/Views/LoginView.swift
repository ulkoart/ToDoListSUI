//
//  LoginView.swift
//  ToDoList
//
//  Created by Улько Артем Викторович on 09.04.2024.
//

import SwiftUI

struct LoginView: View {

	@StateObject var viewModel = LoginViewViewModel()

	var body: some View {
		NavigationView {
			VStack {
				HeaderView(
					title: "To Do List",
					subtitle: "Get things done",
					angle: 15,
					background: .pink
				)
				

				
				Form {
					
					if !viewModel.errorMessage.isEmpty {
						Text(viewModel.errorMessage)
							.foregroundColor(Color.red)
					}
					
					TextField("Email Address", text: $viewModel.email)
						.textFieldStyle(DefaultTextFieldStyle())
						.autocapitalization(.none)

					SecureField("Password", text: $viewModel.password)
						.textFieldStyle(DefaultTextFieldStyle())
					TLButton(title: "Log In", background: .blue) {
						viewModel.login()
					}
					.padding()
				}
				.offset(y: -50)
				VStack {
					Text("New around here?")
					NavigationLink("Create An Account", destination: RegisterView())
				}
				.padding(.bottom, 50)

				Spacer()
			}
		}
	}
}

#Preview {
    LoginView()
}
