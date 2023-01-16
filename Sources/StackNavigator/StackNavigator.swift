import SwiftUI
@available(macOS 13.0, *)
public struct StackNavigator {
   public init(routes : [PageRouteInfo]) {
      assert(!routes.isEmpty, "Please provide atleast single page")
      assert(routes.contains(where: {
         $0.isInitial == true
      }), "Please provide initial route")

    }
}

