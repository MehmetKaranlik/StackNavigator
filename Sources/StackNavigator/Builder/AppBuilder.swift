//
//  File.swift
//
//
//  Created by mehmet karanlık on 23.10.2022.
//

import SwiftUI

struct AppBuilder: View {
   let routes: [PageRouteInfo]
   let initRoute: PageRouteInfo?

   init(routes: [PageRouteInfo]) {
      self.routes = routes
      initRoute = routes.first(where: { $0.isInitial })
      assert(initRoute != nil, "Initial route has not been provided.")
   }

   var body: some View {
      initRoute!.view
   }
}
