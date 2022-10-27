//
//  File.swift
//
//
//  Created by mehmet karanlık on 23.10.2022.
//

import SwiftUI

public struct AppBuilder: View {
   let routes: [PageRouteInfo]
   let initRoute: PageRouteInfo?

 public  init(routes: [PageRouteInfo]) {
      self.routes = routes
      initRoute = routes.first(where: { $0.isInitial })
      assert(initRoute != nil, "Initial route has not been provided.")
   }

 public var body: some View {
    NavigationStack {
       initRoute!.view
    }
    .navigationDestination(for: PageRouteInfo.self) { routeInfo in
       routeInfo.view
    }
   }
}
