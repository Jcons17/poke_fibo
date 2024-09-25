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
    );
  }
}
