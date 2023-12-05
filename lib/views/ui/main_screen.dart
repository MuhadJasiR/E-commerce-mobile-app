import 'package:e_commerce/controllers/main_screen_provider.dart';
import 'package:e_commerce/views/ui/cart_screen.dart';
import 'package:e_commerce/views/ui/home_screen.dart';
import 'package:e_commerce/views/ui/profile_screen.dart';
import 'package:e_commerce/views/ui/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final List<Widget> pageList = [
    const HomeScreen(),
    const SearchScreen(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, value, child) => BottomNavBar(pageList: pageList),
    );
  }
}
