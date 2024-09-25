import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/core/core.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthBloc authBloc;

  AuthGuard({required this.authBloc});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authBloc.state.userSession.value != null) {
      if (authBloc.state.itWasUsedCode || authBloc.state.itWasUsedFinger) {
        resolver.next(true);
        return;
      } else {
        // TODO: finger
        resolver.next(true);
        return;
      }
    } else {
      router.replace(LoginRoute());
      return;
    }
  }
}
