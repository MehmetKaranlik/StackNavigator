public struct StackNavigator {
    public private(set) var text = "Private testing!"
    public let appBuilder : AppBuilder
    public init(routes : [PageRouteInfo]) {
      appBuilder = AppBuilder(routes: routes)
    }
}
