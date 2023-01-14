//
//  Routes.swift
//  Example
//
//  Created by mehmet karanlık on 14.01.2023.
//

import Foundation
import StackNavigator

struct Routes {

   static let routes : [PageRouteInfo] = [
      PageRouteInfo(build: { args in
         ContentView()
      }, name: RouteNames.viewOne.rawValue, isInitial: true),
      PageRouteInfo(build: { args in 
      return ViewTwo(id: args?["id"] as? String ?? "")
      }, name: RouteNames.viewTwo.rawValue),
      PageRouteInfo(build: { _ in
         ViewThree()
      }, name: RouteNames.viewThree.rawValue)

   ]


   enum RouteNames : String, CaseIterable {
      case viewOne = "one"
      case viewTwo = "two"
      case viewThree = "three"
   }

   

}
