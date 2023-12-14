import 'package:flutter/material.dart';

class ProductNotifier extends ChangeNotifier {
  int _activatePage = 0;
  List<dynamic> _shoeSizes = [];
  List<String> _sizes = [];
  int get activatePage => _activatePage;
  set activatePage(int newIndex) {
    _activatePage = newIndex;
    notifyListeners();
  }

  List<dynamic> get shoeSizes => _shoeSizes;
  set shoesSize(List<dynamic> newSize) {
    _shoeSizes = newSize;
    notifyListeners();
  }

  void toggleCheck(int index) {
    for (var i = 0; i < _shoeSizes.length; i++) {
      if (i == index) {
        _shoeSizes[i]["isSelected"] = !_shoeSizes[i]["isSelected"];
        notifyListeners();
      }
    }
  }

  List<String> get sizes => _sizes;
  set sizes(List<String> newSizes) {
    _sizes = newSizes;
    notifyListeners();
  }
}
