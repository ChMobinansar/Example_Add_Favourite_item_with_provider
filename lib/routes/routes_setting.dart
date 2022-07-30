import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/Fav_example_page.dart';
import '../views/Favourited_item_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case FavouriteExample.routeName:
      return MaterialPageRoute(builder: (context) => const FavouriteExample());
    case FavouritedItem.routeName:
      return MaterialPageRoute(builder: (context) => const FavouritedItem());
    // case SettingPage.routeName:
    //   return MaterialPageRoute(builder: (context) => const SettingPage());
    // case SplashView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SplashView());
    default:
      return errorRoute();
  }
}

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Arggg!'),
        ),
        body: const Center(
          child: Text('Oh No! You should not be here! '),
        ),
      );
    },
  );
}
