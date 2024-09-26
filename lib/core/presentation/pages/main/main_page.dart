import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/dependency_injection.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonBloc(pokeRepository: getIt()),
        ),
      ],
      child: Builder(
        builder: (context) {
          return BlocListener<AuthBloc, AuthState>(
            listenWhen: (previous, current) {
              return previous.userSession.value != current.userSession.value;
            },
            listener: (context, state) {
              if (state.userSession.value == null) {
                context.router.replace(LoginRoute());
                return;
              }
            },
            child: BlocListener<PokemonBloc, PokemonState>(
              listenWhen: (previous, current) => previous.addPokemonToMyTeam.errored != current.addPokemonToMyTeam.errored,
              listener: (context, state) {
                if (state.addPokemonToMyTeam.errored) {
                  context.snackBarError(state.addPokemonToMyTeam.exception.toString());
                }
              },
              child: AutoTabsScaffold(
                routes: [
                  HomeRoute(),
                  PokemosTeamsRoute(),
                ],
                homeIndex: 0,
                bottomNavigationBuilder: (context, tabsRouter) {
                  return BottomNavigationBar(
                    currentIndex: tabsRouter.activeIndex,
                    onTap: (value) {
                      tabsRouter.setActiveIndex(value);
                    },
                    items: [
                      BottomNavigationBarItem(
                        backgroundColor: context.theme.colorScheme.onPrimary,
                        label: "Home",
                        activeIcon: Icon(
                          Icons.home,
                          color: context.theme.colorScheme.primary,
                        ),
                        icon: Icon(
                          Icons.home,
                          color: context.theme.colorScheme.secondary,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Team",
                        activeIcon: Icon(
                          Icons.people,
                          color: context.theme.colorScheme.primary,
                        ),
                        icon: Icon(
                          Icons.people,
                          color: context.theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
