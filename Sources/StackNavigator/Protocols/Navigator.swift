//
//  File.swift
//  
//
//  Created by mehmet karanlık on 16.01.2023.
//

import Foundation
import SwiftUI

public protocol Navigator : ObservableObject {
   var stack : [PageRouteInfo] { get set }

   func push(destionation :any DeepRoutes)
   func pop()
   func popToRoot()
   func pushAndRemoveUntil(destionation :any DeepRoutes)
   func replaceRoot(with : any DeepRoutes)
}
