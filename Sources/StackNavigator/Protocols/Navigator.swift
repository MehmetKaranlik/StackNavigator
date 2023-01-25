//
//  File.swift
//  
//
//  Created by mehmet karanlık on 16.01.2023.
//

import Foundation
import SwiftUI

@available(iOS 16.0.0, *)
@available(macOS 13.0.0, *)
public protocol Navigator : ObservableObject {
   var stack : [PageRouteInfo] { get set }
   var singularStackRoute: [PageRouteInfo] { get set }

   func push(destionation :any DeepRoutes)
   func pop()
   func popToRoot()
   func replaceRoot(with : any DeepRoutes)
}
