import 'package:flutter/material.dart';
import 'package:unskool/view/screen/screen_account.dart';
import 'package:unskool/view/screen/screen_featured.dart';
import 'package:unskool/view/screen/screen_mylearning.dart';
import 'package:unskool/view/screen/screen_search.dart';
import 'package:unskool/view/screen/screen_wishlist.dart';

class ProviderBottomnav with ChangeNotifier {
  int selectedIndex = 0;

  List<Widget> pages = [
    ScreenFeatured(),
    ScreenSearch(),
    ScreenMylearning(),
    ScreenWishlist(),
    ScreenAccount(),
  ];

  void onTapFn(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
