//
//  UnitTestsPracticeApp.swift
//  UnitTestsPractice
//
//  Created by Ganesh on 25/08/23.
//

import SwiftUI

@main
struct UnitTestsPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            UnitTestsView(isPremium: Bool.random())
        }
    }
}
