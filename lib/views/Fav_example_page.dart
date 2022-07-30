import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleexamplewithprovider/configurations/size_config.dart';

import '../provider/favourite_item_provider.dart';
import 'Favourited_item_screen.dart';

class FavouriteExample extends StatefulWidget {
  static const routeName = "Favourite_screen";
  const FavouriteExample({Key? key}) : super(key: key);

  @override
  State<FavouriteExample> createState() => _FavouriteExampleState();
}

class _FavouriteExampleState extends State<FavouriteExample> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Favourite App")),
        actions: [
          InkWell(
              child: Icon(Icons.favorite),
              onTap: () {
                Navigator.pushNamed(context, FavouritedItem.routeName);
              }),
          SizedBox(
            width: SizeConfig.screenWidth! * 0.01,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Consumer<FavItemProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return ListTile(
                          onTap: () {
                            if (value.selectedItem.contains(index)) {
                              value.deleteItem(index);
                            } else {
                              value.addItem(index);
                            }
                          },
                          title: Text("Item  " + index.toString()),
                          trailing: Icon(
                            value.selectedItem.contains(index)
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: Colors.red,
                          ));
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
