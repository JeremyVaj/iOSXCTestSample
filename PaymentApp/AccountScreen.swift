import SwiftUI

struct AccountScreen: View {
    @Environment(\.presentationMode) var presentationMode
    var balance: Double = 100.00 // Fake balance for demonstration

    var body: some View {
        VStack {
            Text("Account")
                .font(.largeTitle)
                .accessibilityIdentifier("AccountTitle")

            Text("Balance: \(balance, specifier: "%.2f")")
                .accessibilityIdentifier("BalanceLabel")

            Button("Logout") {
                // Action to log out and go back to LoginScreen
                presentationMode.wrappedValue.dismiss()
            }
            .accessibilityIdentifier("LogoutButton") // Set accessibility identifier for testing
        }
        .padding()
    }
}
