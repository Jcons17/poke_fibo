import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/core.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthBloc authBloc;

  AuthGuard({required this.authBloc});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    await Future.delayed(Durations.medium3);
    if (authBloc.state.userSession.value != null) {
      if (authBloc.state.itWasUsedLocalAuth) {
        resolver.next(true);
        return;
      } else {
        // TODO: finger
        router.replace(BlockRoute());
        return;
      }
    } else {
      router.replace(LoginRoute());
      return;
    }
  }
}
