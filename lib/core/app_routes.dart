import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/core/core.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;

  AppRouter({super.navigatorKey, required this.authGuard});

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
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
          guards: [
            authGuard,
          ],
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: "home",
            ),
            AutoRoute(
              page: PokemosTeamsRoute.page,
              path: "team",
            ),
            AutoRoute(
              page: PokemonDetailsRoute.page,
              path: "pokemon",
            ),
          ],
        ),
      ];
}
