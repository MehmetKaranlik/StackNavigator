//
//  ContentView.swift
//  Example
//
//  Created by mehmet karanlık on 14.01.2023.
//

import SwiftUI
import StackNavigator


struct ContentView: View {

   @EnvironmentObject var navManager : NavigationHandler
    var body: some View {
        VStack {

            Text("View One")
              .onTapGesture {
                 navManager.pushNamed(name: Routes.RouteNames.viewTwo.rawValue,args: ["id":"123"])
              }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
