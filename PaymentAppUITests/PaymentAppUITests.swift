import XCTest

class PaymentAppUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Setup code here. This method is called before the invocation of each test method in the class.
        app = XCUIApplication()
        app.launch()
    }

    func testLoginWithValidCredentials() {
        // Tap on the username field and enter valid username
        XCTAssertTrue(app.textFields["UsernameField"].waitForExistence(timeout: 5), "Username field did not appear in time")
        app.textFields["UsernameField"].tap()
        app.textFields["UsernameField"].typeText("testUser")

        // Tap on the password field and enter valid password
        let passwordField = app.secureTextFields["PasswordField"]
        XCTAssertTrue(passwordField.waitForExistence(timeout: 5), "Password field did not appear in time")
        passwordField.tap()
        passwordField.typeText("testPassword")

        // Dismiss the keyboard by tapping outside the text fields
        app.tap() // This will tap on the app area to dismiss the keyboard

        // Tap on the login button
        app.buttons["LoginButton"].tap()

        // Verify that the account screen is displayed
        XCTAssertTrue(app.staticTexts["AccountTitle"].exists, "Account title does not exist after logging in")
        XCTAssertTrue(app.staticTexts["BalanceLabel"].exists, "Balance label does not exist after logging in")
    }

    func testLoginWithInvalidCredentials() {
        // Tap on the username field and enter invalid username
        XCTAssertTrue(app.textFields["UsernameField"].waitForExistence(timeout: 5), "Username field did not appear in time")
        app.textFields["UsernameField"].tap()
        app.textFields["UsernameField"].typeText("invalidUser")

        // Tap on the password field and enter invalid password
        let passwordField = app.secureTextFields["PasswordField"]
        XCTAssertTrue(passwordField.waitForExistence(timeout: 5), "Password field did not appear in time")
        passwordField.tap()
        passwordField.typeText("invalidPassword")

        // Dismiss the keyboard by tapping outside the text fields
        app.tap() // This will tap on the app area to dismiss the keyboard

        // Tap on the login button
        app.buttons["LoginButton"].tap()

        // Verify that the error message is displayed
        XCTAssertTrue(app.staticTexts["ErrorMessage"].exists, "Error message does not exist after invalid login")
    }

    func testLogout() {
        // First, log in with valid credentials
        XCTAssertTrue(app.textFields["UsernameField"].waitForExistence(timeout: 5), "Username field did not appear in time")
        app.textFields["UsernameField"].tap()
        app.textFields["UsernameField"].typeText("testUser")

        // Ensure the secure text field is tapped and focused
        let passwordField = app.secureTextFields["PasswordField"]
        XCTAssertTrue(passwordField.waitForExistence(timeout: 5), "Password field did not appear in time")
        passwordField.tap()
        passwordField.typeText("testPassword")

        // Add a slight delay to ensure the password is fully entered
        sleep(1)

        // Dismiss the keyboard by tapping outside the text fields
        app.tap() // This will tap on the app area to dismiss the keyboard

        // Tap the login button
        app.buttons["LoginButton"].tap()

        // Add a short delay to allow the UI to update
        sleep(1)

        // Verify that the account screen is displayed
        XCTAssertTrue(app.staticTexts["AccountTitle"].exists, "Account title does not exist after logging in")
        
        // Check for the existence of the Logout button before tapping
        let logoutButton = app.buttons["LogoutButton"]
        XCTAssertTrue(logoutButton.waitForExistence(timeout: 5), "Logout button does not exist")

        // Tap the logout button
        logoutButton.tap()

        // Verify that the login screen is displayed again
        XCTAssertTrue(app.textFields["UsernameField"].exists, "Username field does not exist after logging out")
        XCTAssertTrue(app.secureTextFields["PasswordField"].exists, "Password field does not exist after logging out")
        XCTAssertTrue(app.buttons["LoginButton"].exists, "Login button does not exist after logging out")
    }
}
