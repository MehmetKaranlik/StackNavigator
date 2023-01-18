//
//  ContentView.swift
//  Example
//
//  Created by mehmet karanlık on 14.01.2023.
//

import SwiftUI
import StackNavigator


struct ViewOne: View {

   @EnvironmentObject var navManager : NavigationHandler
    var body: some View {
       VStack(spacing: 20) {

          Text("View 1")

          List {
            
             Button("Push To 2") {
                navManager.push(destionation: RouteNames.viewTwo(id: "Came from 4"))
             }
             Button("Replace root with 3") {
                Task {
                   await  navManager.replaceRoot(with: RouteNames.viewThree)
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
        .padding()

    }
}

struct ViewOne_Previews: PreviewProvider {
    static var previews: some View {
       ViewOne()
    }
}
