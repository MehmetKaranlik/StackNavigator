//
//  File.swift
//
//
//  Created by mehmet karanlık on 23.10.2022.
//

import SwiftUI

@available(macOS 13.0, *)
public struct AppBuilder: View {

   @ObservedObject var navigationHandler : NavigationHandler

   public init(initial: PageRouteInfo) {
     navigationHandler = NavigationHandler(initial: initial)
   }

 public var body: some View {
    NavigationStack(path:$navigationHandler.stack) {
      EmptyView()
       .navigationDestination(for: PageRouteInfo.self) { routeInfo in
          AnyView(routeInfo.view.transition(.asymmetric(insertion: .move(edge: .leading), removal: .identity)))
             .navigationBarBackButtonHidden(routeInfo.isInitial )

       }
    }
    .environmentObject(navigationHandler)
   }
}
