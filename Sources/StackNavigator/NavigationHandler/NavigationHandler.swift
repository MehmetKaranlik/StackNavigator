//
//  File.swift
//
//
//  Created by mehmet karanlık on 27.10.2022.
//

import Foundation
import SwiftUI

@available(macOS 13.0, *)
public class NavigationHandler: ObservableObject {
   let routes: [PageRouteInfo]
   @Published var stack: [PageRouteInfo] = [] // Push stack
   @Published var singularRouteStack: [PageRouteInfo] = [] // Root stack

 public init(routes: [PageRouteInfo]) {
      self.routes = routes
      singularRouteStack.append(
         routes.first(where: { $0.isInitial == true })!
      )
   }

  public func pushNamed(name: String) {
      let route = findRouteByName(name)
      if let route { stack.append(route) }
   }



   public func pop(_ args:Any?) -> Any? {
      stack.removeLast()
      return args
   }


   public func popUntil(name:String, args:Any?) -> Any? {
      while stack.last?.name != name {
         stack.removeLast()
      }
      return args
   }

   public func popToRoot(_ args:Any?)-> Any? {
      stack.removeAll()
      return args
   }


   public func replaceRootNamed(name: String) {
      let route = findRouteByName(name)
      if let route {
         withAnimation {
            singularRouteStack.append(route)
            singularRouteStack.remove(at: 0)
         }
      }
   }

   public func replaceRouteNamed(name : String) {
      let route = findRouteByName(name)
      if let route {
         stack.append(route)
         stack.remove(at: stack.index(before: stack.count - 1))
      }
   }


   public func pushRemoveUntil(name: String) {
      let route = findRouteByName(name)
      if let route {
         popToRoot(nil)
         replaceRootNamed(name: route.name)
      }
   }


   private func findRouteByName(_ name: String) -> PageRouteInfo? {
      return routes.first(where: { $0.name == name })
   }
}



