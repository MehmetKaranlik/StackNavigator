public struct StackNavigator {
    public let appBuilder : AppBuilder
    public init(routes : [PageRouteInfo]) {
      assert(!routes.isEmpty, "Please provide atleast single page")
      appBuilder = AppBuilder(routes: routes)
    }
}
