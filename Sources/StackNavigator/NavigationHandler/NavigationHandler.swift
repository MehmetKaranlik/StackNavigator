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
   @Published public var singularStackRoute: [PageRouteInfo] = [] {
      didSet {
         print(singularStackRoute.map({ "Name : \($0.view)" }))
      }
   }
   @Published public var stack: [PageRouteInfo] = []

   public init(initial: PageRouteInfo) {
      singularStackRoute.append(initial)
   }

   public func push(destionation: any DeepRoutes) {
      stack.append(destionation.toItem())
   }

   public func pop() {
      if isNotLast {
         stack.removeLast()
      }
   }

   public func popToRoot() {
      if isNotLast {
         stack.removeLast((1 ... stack.count - 1).count)
      }
   }

   public func replaceRoot(with: any DeepRoutes) {
      var route = with.toItem()
      withAnimation {
         self.singularStackRoute.append(route)
         self.singularStackRoute.remove(at: 0)
      }
   }
}

private extension NavigationHandler {
   var isNotLast: Bool {
      return stack.count > 1
   }
}

private extension NavigationHandler {
   func withDelay(_ callback: @escaping () -> ()) {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
         callback()
      }
   }
}
