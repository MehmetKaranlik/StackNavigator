//
//  File.swift
//
//
//  Created by mehmet karanlık on 27.10.2022.
//

import Foundation
import SwiftUI

@available(iOS 16.0, *)
@available(macOS 13.0, *)
public class NavigationHandler: Navigator {
   @Published public var singularStackRoute: [PageRouteInfo] = []
   @Published public var stack: [PageRouteInfo] = []

   public init(initial: PageRouteInfo) {
      singularStackRoute.append(initial)
   }

   public func push(destionation: any DeepRoutes) {
      stack.append(destionation.toItem())
   }

   public func pop() {
      if isNotEmpy {
         stack.removeLast()
      }
   }

   public func popToRoot() {

         stack.removeAll()

   }

   public func popTo(_ to : any DeepRoutes){
      stack.removeAll { route in
         route.hashValue != to.toItem().hashValue
      }
   }

   public func replaceRoot(with: any DeepRoutes) {
      let route = with.toItem()
      withAnimation(.linear(duration: 0.35)) {
         self.singularStackRoute.append(route)
         withDelay {
            self.singularStackRoute.remove(at: 0)
         }
      }
   }
}

@available(iOS 16.0.0, *)
@available(macOS 13.0.0, *)
private extension NavigationHandler {
   var isNotEmpy: Bool {
      return !stack.isEmpty
   }
}

@available(iOS 16.0.0, *)
@available(macOS 13.0.0, *)
private extension NavigationHandler {
   func withDelay(_ callback: @escaping () -> ()) {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
         callback()
      }
   }
}
