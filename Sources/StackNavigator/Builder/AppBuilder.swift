//
//  File.swift
//
//
//  Created by mehmet karanlık on 23.10.2022.
//

import SwiftUI

@available(iOS 16.0.0, *)
@available(macOS 13.0.0, *)
public struct AppBuilder: View {

   @ObservedObject var navigationHandler : NavigationHandler

   public init(initial: PageRouteInfo) {
      navigationHandler = NavigationHandler(initial: initial.self)
   }

 public var body: some View {
    NavigationStack(path:$navigationHandler.stack) {
       ZStack {
          ForEach(navigationHandler.singularStackRoute,id:\.self.id) { root in
             root.view
          }.transition(.asymmetric(insertion: .move(edge: .trailing), removal: .identity))
       }
       .navigationDestination(for: PageRouteInfo.self) { routeInfo in
          AnyView(routeInfo.view)
       }
    }
    .environmentObject(navigationHandler)
   }


}
