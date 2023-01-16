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
                navManager.push(destionation: RouteNames.viewOne)
             }
             Button("Replace root with 3") {
                navManager.replaceRoot(with: RouteNames.viewThree)
             }
             Button("Push 4 and remove all") {
                navManager.pushAndRemoveUntil(destionation: RouteNames.viewFour)
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
