import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_item_provider.dart';
import '../routes/routes_setting.dart';
import '../views/Fav_example_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => FavItemProvider())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: FavouriteExample.routeName,
          onGenerateRoute: (settings) => generateRoute(settings),
        ));
  }
}
