//
//  ViewThree.swift
//  Example
//
//  Created by mehmet karanlık on 14.01.2023.
//

import SwiftUI
import StackNavigator
struct ViewThree: View {
   @EnvironmentObject var navigationHandler : NavigationHandler
    var body: some View {
        Text("View 3")
          .onTapGesture {
             navigationHandler.replaceRootNamed(name: Routes.RouteNames.viewOne.rawValue, args: nil)
          }

          
    }
}

struct ViewThree_Previews: PreviewProvider {
    static var previews: some View {
        ViewThree()
    }
}
