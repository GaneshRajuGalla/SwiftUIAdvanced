//
//  DependencyInjectionApp.swift
//  DependencyInjection
//
//  Created by Ganesh on 24/08/23.
//

import SwiftUI

@main
struct DependencyInjectionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(dataService: ProductionDataService())
        }
    }
}
