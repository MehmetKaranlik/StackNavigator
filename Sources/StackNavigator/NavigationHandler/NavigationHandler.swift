//
//  File.swift
//
//
//  Created by mehmet karanlık on 27.10.2022.
//

import Foundation
import SwiftUI

@available(macOS 13.0, *)
public class NavigationHandler: Navigator {
   @Published public var stack: [PageRouteInfo] = [] {
      didSet {
         print(stack.map { "Name : \($0.view)" })
      }
   }

   public init(initial: PageRouteInfo) {
      stack.append(initial)
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
      stack.removeLast((1...stack.count - 1).count)
   }

   public func pushAndRemoveUntil(destionation: any DeepRoutes) {
      var route = destionation.toItem()
      stack.append(route.makeFirst())
      if stack.last != route {
         withDelay {
            self.stack.removeFirst((0..<(self.stack.count - 1)).count)
         }
      }
   }

   public func replaceRoot(with: any DeepRoutes) {
      var route = with.toItem()
      if isNotLast {
         stack.insert(route.makeFirst(), at: 0)
         stack.remove(at: 1)
      } else {
         stack.insert(route.makeFirst(), at: 1)
         withDelay { self.stack.remove(at: 0) }
      }
   }
}

private extension NavigationHandler {
   var maxRange: ClosedRange<Int> {
      return 1...(stack.count - 1)
   }

   var rangeWithoutLastItem: Range<Int> {
      if stack.count > 1 {
         return 0..<(stack.count - 1)
      }
      return 0..<(stack.count)
   }

   var indexBeforeLast: Int {
      return stack.index(before: stack.count - 1)
   }

   var countWithoutLast: Int {
      return stack.count - 1
   }

   var isNotLast: Bool {
      return stack.count > 1
   }
}

extension NavigationHandler {
   func withDelay(_ callback: @escaping () -> ()) {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
         callback()
      }
   }
}
