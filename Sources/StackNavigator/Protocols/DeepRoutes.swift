//
//  File.swift
//  
//
//  Created by mehmet karanlık on 16.01.2023.
//

import Foundation
import SwiftUI

@available(macOS 13.0, *)
public protocol DeepRoutes : Hashable, Equatable  {
   func urlSchema() -> String
   func toItem() ->  PageRouteInfo
}

extension DeepRoutes {
   static func == (lhs: any DeepRoutes, rhs: any DeepRoutes) -> Bool {
      lhs.hashValue == rhs.hashValue
   }

   static func != (lhs: any DeepRoutes, rhs: any DeepRoutes) -> Bool {
      lhs.urlSchema() != rhs.urlSchema()
   }
}
