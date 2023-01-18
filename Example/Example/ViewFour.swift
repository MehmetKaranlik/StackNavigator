//
//  ViewFour.swift
//  Example
//
//  Created by mehmet karanlık on 16.01.2023.
//

import SwiftUI
import StackNavigator
struct ViewFour: View {
   @EnvironmentObject var navManager : NavigationHandler
    var body: some View {
       VStack(spacing:20) {
          Text("View 4")
          List {
             Button("Push To 1") {
                Task {
                   await navManager.push(destionation: RouteNames.viewOne)
                }
             }
             Button("Replace root with 3") {
                Task {
                   await navManager.replaceRoot(with: RouteNames.viewThree)
                }
             }
             Button("Push 4 and remove all") {
                Task {
               
                }
             }
             Button("Pop to Root") {
                navManager.popToRoot()
             }
          }
       }
    }
}

struct ViewFour_Previews: PreviewProvider {
    static var previews: some View {
        ViewFour()
    }
}
