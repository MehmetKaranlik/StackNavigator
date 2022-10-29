//
//  File.swift
//
//
//  Created by mehmet karanlık on 27.10.2022.
//

import Foundation
import SwiftUI

public class NavigationHandler: ObservableObject {
   let routes: [PageRouteInfo]
   @Published var stack: [PageRouteInfo] = []
   @Published var singularRouteStack: [PageRouteInfo] = []

 public init(routes: [PageRouteInfo]) {
      self.routes = routes
      singularRouteStack.append(
         routes.first(where: { $0.isInitial == true })!
      )
   }

   func pushNamed(name: String) {
      let route = findRouteByName(name)
      if let route { stack.append(route) }
   }

   func replaceRoute(name: String) {
      let route = findRouteByName(name)
      if let route {
         withAnimation {
            singularRouteStack.append(route)
            singularRouteStack.remove(at: 0)
         }
      }
   }

   private func findRouteByName(_ name: String) -> PageRouteInfo? {
      return routes.first(where: { $0.name == name })
   }
}
