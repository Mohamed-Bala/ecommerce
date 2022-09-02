import 'package:ecommerce/views/pages/dashboard.dart';
import 'package:flutter/cupertino.dart';
import '../utilities/routes.dart';
import '../views/pages/auth_page.dart';
import '../views/pages/landing_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      );
    case AppRoutes.dashboardPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const DashboardPage(),
        settings: settings,
      );
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
  }
}
