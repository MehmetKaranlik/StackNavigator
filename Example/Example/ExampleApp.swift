//
//  ExampleApp.swift
//  Example
//
//  Created by mehmet karanlık on 14.01.2023.
//

import SwiftUI
import StackNavigator

@main
struct ExampleApp: App {
    var body: some Scene {
       WindowGroup {
          AppBuilder(initial: RouteNames.viewOne.toItem())
        }
    }
}
