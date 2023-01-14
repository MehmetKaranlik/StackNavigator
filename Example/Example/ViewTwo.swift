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
   @EnvironmentObject var navigationManager : NavigationHandler
    var body: some View {
        Text(id + "BU BIR ARGUMAN OLARAK ALINMIŞTIR")
          .onTapGesture {
             navigationManager.pushRemoveUntil(name: Routes.RouteNames.viewThree.rawValue,args: nil)
          }
    }
}

struct ViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        ViewTwo(id: "33")
    }
}
