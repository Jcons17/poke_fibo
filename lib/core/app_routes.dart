import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/core/core.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: "/home",
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: "/login",
        ),
        AutoRoute(
          page: SignUpRoute.page,
          path: "/sign-up",
        ),
        AutoRoute(
          page: MainRoute.page,
          path: "/",
          initial: true,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: "/home",
            ),
            AutoRoute(
              page: PokemosTeamsRoute.page,
              path: "/team",
            ),
            AutoRoute(
              page: PokemonDetailsRoute.page,
              path: "/pokemon",
            ),
          ],
        ),
      ];
}
