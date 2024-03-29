import 'package:flutter/material.dart';
import 'package:my_project_flutter/common/widgets/bottom_bar.dart';
import 'features/auth/screens/auth_screen.dart';
import 'features/home/screens/home_screen.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch( routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings:  routeSettings,
          builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings:  routeSettings,
          builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings:  routeSettings,
          builder: (_) => const BottomBar(),
      );
    default:
      return MaterialPageRoute(
          settings:  routeSettings,
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('404 Screen does net exist'),
            ),
          )
      );
  }
}