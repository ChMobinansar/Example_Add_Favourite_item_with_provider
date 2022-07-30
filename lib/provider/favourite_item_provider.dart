import 'package:flutter/cupertino.dart';

class FavItemProvider with ChangeNotifier {
  List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;
  void addItem(int value) {
    _selectedItem.add(value);
    notifyListeners();
  }

  void deleteItem(int value) {
    _selectedItem.remove(value);
    notifyListeners();
  }
}
