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
      stack.append(
         routes.first(where: { $0.isInitial == true })!
      )
   }

   public func pushNamed(name: String, args : Arguments?) {
      let route = findRouteByName(name)
      if let route {
        let finalRoute = matchArgument(route: route, args: args)
        stack.append(finalRoute)
      }

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
      stack.removeAll { route in
         route != stack.first
      }
      return args
   }


   public func replaceRootNamed(name: String, args:Arguments?) {
      let route = findRouteByName(name)
      if let route {
         var finalRoute = matchArgument(route: route, args: args)
         if stack.count > 1 {
            stack.replaceSubrange(0...0, with: [finalRoute.makeFirst()])
         }else {
            pushRemoveUntil(name: finalRoute.name, args: finalRoute.args)
         }

      }
   }



   public func pushRemoveUntil(name: String, args:Arguments?) {
      let route = findRouteByName(name)
      if let route {
         var finalRoute = matchArgument(route: route, args: args)
         stack.append(finalRoute.makeFirst())
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.stack.removeSubrange(self.rangeWithoutLastItem)
            print(self.stack)
         }

      
      }
   }





   var maxRange : ClosedRange<Int> {
      return 1...(stack.count - 1)
   }

   var rangeWithoutLastItem : ClosedRange<Int> {
      return 0...(stack.count - 2)
   }

   var indexBeforeLast : Int {
      return stack.index(before: stack.count - 1)
   }


   private func matchArgument(route : PageRouteInfo, args: Arguments?) -> PageRouteInfo {
      if args == nil { return route }
      var new = route
      let argumented = new.withArgs(args: args!)
      return argumented
   }

   private func findRouteByName(_ name: String) -> PageRouteInfo? {
      return routes.first(where: { $0.name == name })
   }
}



