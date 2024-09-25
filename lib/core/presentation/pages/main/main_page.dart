import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/core.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
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
              activeIcon: Column(
                children: [
                  Icon(
                    Icons.home,
                    color: context.theme.colorScheme.primary,
                  ),
                  Text("Home"),
                ],
              ),
              icon: Column(
                children: [
                  Icon(
                    Icons.home,
                    color: context.theme.colorScheme.secondary,
                  ),
                  Text("Home"),
                ],
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Column(
                children: [
                  Icon(
                    Icons.people,
                    color: context.theme.colorScheme.primary,
                  ),
                  Text("Team"),
                ],
              ),
              icon: Column(
                children: [
                  Icon(
                    Icons.people,
                    color: context.theme.colorScheme.secondary,
                  ),
                  Text("Team"),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
