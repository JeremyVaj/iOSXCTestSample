import SwiftUI

struct LoginScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                    .accessibilityIdentifier("LoginTitle") // Add accessibility identifier

                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 10)
                    .accessibilityIdentifier("UsernameField") // Add accessibility identifier

                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 20)
                    .accessibilityIdentifier("PasswordField") // Add accessibility identifier

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.bottom, 10)
                        .accessibilityIdentifier("ErrorMessage") // Add accessibility identifier
                }

                Button(action: {
                    if username == "testUser" && password == "testPassword" {
                        isLoggedIn = true
                        errorMessage = nil // Reset error message on successful login
                    } else {
                        errorMessage = "Invalid credentials. Please try again."
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .accessibilityIdentifier("LoginButton") // Add accessibility identifier
            }
            .padding()
            .navigationDestination(isPresented: $isLoggedIn) {
                AccountScreen()
            }
        }
    }
}
