//
//  Routes.swift
//  Example
//
//  Created by mehmet karanlık on 14.01.2023.
//

import Foundation
import StackNavigator
import SwiftUI



enum RouteNames : DeepRoutes {
      case viewOne
      case viewTwo(id : String)
      case viewThree
      case viewFour

      func urlSchema() -> String {
         switch self {
            case .viewOne:
              return  "/viewOne"
            case .viewTwo(id: _):
               return "/viewTwo"
            case .viewThree:
               return "/viewThree"
            case .viewFour:
               return "/viewFour"
         }
      }

      func toItem() -> PageRouteInfo {
         switch self {
            case .viewOne:
            return PageRouteInfo(view: ViewOne(), isInitial: true)
            case .viewTwo(id: let id):
            return PageRouteInfo(view: ViewTwo(id: id))
            case .viewThree:
            return PageRouteInfo(view:ViewThree())
            case .viewFour:
            return PageRouteInfo(view: ViewFour())
         }
      }
   }





