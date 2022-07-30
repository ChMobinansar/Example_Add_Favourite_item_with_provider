import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleexamplewithprovider/configurations/size_config.dart';

import '../provider/favourite_item_provider.dart';

class FavouritedItem extends StatefulWidget {
  static const routeName = "Favourited_screen";
  const FavouritedItem({Key? key}) : super(key: key);

  @override
  State<FavouritedItem> createState() => _FavouritedItemState();
}

class _FavouritedItemState extends State<FavouritedItem> {
  @override
  Widget build(BuildContext context) {
    final Fav = Provider.of<FavItemProvider>(context, listen: false);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Favourite App")),
        actions: [
          InkWell(child: Icon(Icons.favorite), onTap: () {}),
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
                    itemCount: value.selectedItem.length,
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
