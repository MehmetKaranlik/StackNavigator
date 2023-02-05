//
//  File.swift
//
//
//  Created by mehmet karanlık on 23.10.2022.
//

import SwiftUI

@available(iOS 16.0.0, *)
@available(macOS 13.0.0, *)
public struct PageRouteInfo: Hashable {
   
   public let view: AnyView
   public let isInitial: Bool
   public let id: String = UUID().uuidString

   public init(view: any View) {
      self.view = AnyView(view)
      self.isInitial = false
   }

   public init(view: any View, isInitial: Bool) {
      self.view = AnyView(view)
      self.isInitial = isInitial
   }

   public static func == (lhs: PageRouteInfo, rhs: PageRouteInfo) -> Bool {
      lhs.hashValue == rhs.hashValue
   }

   public func hash(into hasher: inout Hasher) {
      hasher.finalize()
   }

   public mutating func makeFirst() -> PageRouteInfo {
      return PageRouteInfo(view: view, isInitial: true)
   }
}
