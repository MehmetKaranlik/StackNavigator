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

   public init(routes: [PageRouteInfo]) {
     navigationHandler = NavigationHandler(routes: routes)
   }

 public var body: some View {
    NavigationStack(path:$navigationHandler.stack) {
       ZStack {
          ForEach(self.navigationHandler.singularRouteStack, id:\.self) { rootView in
             EmptyView()
          } .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .identity))
       }
       .navigationDestination(for: PageRouteInfo.self) { routeInfo in
          routeInfo.view
             .navigationBarBackButtonHidden(routeInfo.isInitial && navigationHandler.stack.first == routeInfo)
       }
    }
    .environmentObject(navigationHandler)
   }
}
