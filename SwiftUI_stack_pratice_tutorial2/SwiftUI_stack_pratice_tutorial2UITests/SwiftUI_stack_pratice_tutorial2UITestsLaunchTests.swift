//
//  SwiftUI_stack_pratice_tutorial2UITestsLaunchTests.swift
//  SwiftUI_stack_pratice_tutorial2UITests
//
//  Created by hyorin song on 2021/10/27.
//

import XCTest

class SwiftUI_stack_pratice_tutorial2UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}