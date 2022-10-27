//
//  File.swift
//
//
//  Created by mehmet karanlık on 23.10.2022.
//

import SwiftUI

public struct PageRouteInfo : Hashable, Equatable {
   public static func == (lhs: PageRouteInfo, rhs: PageRouteInfo) -> Bool {
      lhs.name == rhs.name
   }

   public func hash(into hasher: inout Hasher) {
     hasher.finalize()
   }

   let view: AnyView
   let name: String
   let isInitial: Bool


}
