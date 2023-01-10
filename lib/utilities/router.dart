import 'package:flutter/cupertino.dart';
import 'package:task9_1/presentation/bottom_bar_view/bottom_bar_view.dart';
import 'package:task9_1/presentation/profile_view/profile_view.dart';
import 'package:task9_1/presentation/chat_view/chat_view.dart';
import 'package:task9_1/presentation/favorites_view/favorites_view.dart';
import 'package:task9_1/presentation/home_view/home_view.dart';
import 'package:task9_1/presentation/news_view/news_view.dart';
import 'package:task9_1/presentation/start_view/get_start_view.dart';
import 'package:task9_1/presentation/start_view/start_view.dart';
import 'package:task9_1/utilities/routes.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.bottomBarPageRoute:
      return CupertinoPageRoute(
        builder: (_) => BottomBarView(),
        settings: routeSettings,
      );
    case AppRoutes.profilePageRoute:
      return CupertinoPageRoute(
        builder: (_) => ProfileView(),
        settings: routeSettings,
      );
    case AppRoutes.getStartPageRoute:
      return CupertinoPageRoute(
        builder: (_) => GetStartView(),
        settings: routeSettings,
      );
    case AppRoutes.chatPageRoute:
      return CupertinoPageRoute(
        builder: (_) => ChatView(),
        settings: routeSettings,
      );
    case AppRoutes.startPageRoute:
      return CupertinoPageRoute(
        builder: (_) => StartView(),
        settings: routeSettings,
      );
    case AppRoutes.favoritesPageRoute:
      return CupertinoPageRoute(
        builder: (_) => FavoritesView(),
        settings: routeSettings,
      );
    case AppRoutes.groceryPageRoute:
      return CupertinoPageRoute(
        builder: (_) => HomeView(),
        settings: routeSettings,
      );
    case AppRoutes.newsPageRoute:
      return CupertinoPageRoute(
        builder: (_) => NewsView(),
        settings: routeSettings,
      );
    default:
      return CupertinoPageRoute(
        builder: (_) => BottomBarView(),
        settings: routeSettings,
      );
  }
}