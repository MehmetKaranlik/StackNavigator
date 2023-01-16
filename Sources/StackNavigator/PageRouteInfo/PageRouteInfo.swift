//
//  File.swift
//
//
//  Created by mehmet karanlık on 23.10.2022.
//

import SwiftUI

public typealias Arguments = [String:Any?]
public typealias ArgumentedBuilder = (_ args : Arguments?) -> any View

@available(macOS 13.0, *)
public struct PageRouteInfo : Hashable {

   let view: any View
   let isInitial: Bool
   let id : String = UUID().uuidString
   

   public init( view: any View) {
      self.view = view
      self.isInitial = false
   }

   public init(view: any View, isInitial : Bool) {
      self.view = view
      self.isInitial = isInitial
   }


   public static func == (lhs: PageRouteInfo, rhs: PageRouteInfo) -> Bool {
      lhs.hashValue == rhs.hashValue
   }

   public func hash(into hasher: inout Hasher) {
      hasher.combine(id)
   }



   public mutating func makeFirst() -> PageRouteInfo {
      return PageRouteInfo(view: view, isInitial: true)
   }




   var isHiddenBack : Bool {
      return isInitial
   }

}


private extension PageRouteInfo {

   private func typeCheck(args:Arguments) throws {
      do {
         let view =  try crackView()
         let mirror = Mirror(reflecting: view)
         try mirror.children.forEach { element in
            guard  type(of: element.value) == type(of: args[element.label!]) else {
               throw Exceptions.runtimeError("Type mismatch with given arguments")
            }
         }
      }catch let e {
         throw e
      }
   }


   private func crackView() throws -> any View  {
      let mirror = Mirror(reflecting: self)
      let storage = Mirror(reflecting: mirror.children.first!.value)
      let viewMirror = Mirror(reflecting: storage.children.first!.value)
      do {
         guard let view = viewMirror.children.first?.value, view is any View else {
            throw Exceptions.runtimeError("View is faulty")
         }
         return view as! (any View)
      }


   }
}
