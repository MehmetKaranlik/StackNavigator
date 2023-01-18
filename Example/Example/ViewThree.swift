//
//  ViewThree.swift
//  Example
//
//  Created by mehmet karanlık on 14.01.2023.
//

import SwiftUI
import StackNavigator
struct ViewThree: View {
   @EnvironmentObject var navManager : NavigationHandler
    var body: some View {
       VStack(spacing:20) {
          Text("View 3")
          List {
             Button("Push To 4") {
                navManager.push(destionation: RouteNames.viewFour)
             }
             Button("Replace root with 2") {
                Task {
                   await navManager.replaceRoot(with: RouteNames.viewFour)
                }
             }
             Button("Push 4 and remove all") {
              
             }
             Button("Pop back if possible") {
                navManager.pop()
             }
          }
       }

          
    }
}

struct ViewThree_Previews: PreviewProvider {
    static var previews: some View {
        ViewThree()
    }
}
