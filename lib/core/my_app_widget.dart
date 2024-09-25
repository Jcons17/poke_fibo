import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/presentation/guards/auth_guard.dart';
import 'package:flutter_template/dependency_injection.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppRouter _appRouter;
  late final AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = AuthBloc(
      authRepository: getIt(),
    );

    final authGuard = AuthGuard(authBloc: _authBloc);

    _appRouter = AppRouter(authGuard: authGuard);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _authBloc,
        ),
      ],
      child: MaterialApp.router(
        title: 'Poke Api',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("es"),
          Locale("en"),
        ],
        routerConfig: _appRouter.config(),
        builder: (context, child) {
          return BlocListener<AuthBloc, AuthState>(
            listenWhen: (previous, current) => previous.userSession.value != current.userSession.value,
            listener: (context, state) {
              if (state.userSession.value != null) {
                context.router.replace(MainRoute());
                return;
              }
              if (state.userSession.value == null) {
                context.router.replace(LoginRoute());
                return;
              }
            },
            child: child,
          );
        },
      ),
    );
  }
}
