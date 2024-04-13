part of 'routes_imports.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
      AutoRoute(page: HomeDisplayScreenRoute.page),
      AutoRoute(page: LoginScreenRoute.page,),
      AutoRoute(page: SplashScreenRoute.page,path: '/'),

      AutoRoute(page: HomeScreenRoute.page),
      AutoRoute(page: BookingScreenRoute.page),
      AutoRoute(page: ProfileScreenRoute.page),
      AutoRoute(page: DetailsScreenRoute.page),

      ];
}
