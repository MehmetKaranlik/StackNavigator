//
//  ViewTwo.swift
//  Example
//
//  Created by mehmet karanlık on 14.01.2023.
//

import SwiftUI
import StackNavigator

struct ViewTwo: View {
   let id : String

   @EnvironmentObject var navManager : NavigationHandler
    var body: some View {
       VStack(spacing: 20) {
          Text("View 2")


          List {
             Text("Argument from navigation : \(id)")
             Button("Push To 3") {
                navManager.push(destionation: RouteNames.viewThree)
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
             Button("Pop back if possible") {
                navManager.pop()
             }
          }
       }
    }
}

struct ViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        ViewTwo(id: "33")
    }
}
