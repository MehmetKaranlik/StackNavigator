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
public struct PageRouteInfo : Hashable, Equatable {



   public init(build : @escaping ArgumentedBuilder, name: String, args : Arguments) {
      self.routeBuilder = build
      self.name = name
      self.isInitial = false
      self.args = args
      self.view = AnyView(self.routeBuilder(self.args))

   }

   public init(build : @escaping ArgumentedBuilder, name: String) {
      self.name = name
      self.isInitial = false
      self.args = nil
      self.routeBuilder = build
      self.view = AnyView(build(self.args))
   }

   public init(build : @escaping ArgumentedBuilder, name : String, isInitial : Bool, args : Arguments) {
      self.name = name
      self.isInitial = isInitial
      self.args = args
      self.routeBuilder = build
      self.view = AnyView(build(self.args))

   }


   public init(build : @escaping ArgumentedBuilder, name : String, isInitial : Bool) {

      self.name = name
      self.isInitial = isInitial
      self.args = nil
      self.routeBuilder = build
      self.view = AnyView(build(self.args))

   }



   public static func == (lhs: PageRouteInfo, rhs: PageRouteInfo) -> Bool {
      lhs.hashValue == rhs.hashValue
   }

   public func hash(into hasher: inout Hasher) {
     hasher.finalize()
   }


   public mutating func withArgs(args:Arguments?) -> PageRouteInfo {
      guard let args else { return self }
      try? typeCheck(args: args)
      self.args = args
      self.view = AnyView(routeBuilder(args))
      return self
   }

   public mutating func makeFirst() -> PageRouteInfo {
      if let args {
      return PageRouteInfo(build: routeBuilder, name: name, isInitial: true, args: args)
      }
      return PageRouteInfo(build: routeBuilder, name: name, isInitial: true)

   }

   var view: AnyView
   let name: String
   let isInitial: Bool
   var args : Arguments?
   let routeBuilder : ArgumentedBuilder

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
