//
//  SwiftProtocolApp.swift
//  SwiftProtocol
//
//  Created by Ganesh on 24/08/23.
//

import SwiftUI

@main
struct SwiftProtocolApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(colorTheme: AlternativeColorTheme(), dataSource: DefaultDataSource())
        }
    }
}
