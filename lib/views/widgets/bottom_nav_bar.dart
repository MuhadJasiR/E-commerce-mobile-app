import 'dart:developer';

import 'package:e_commerce/controllers/main_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ionicons/ionicons.dart';
import 'bottom_nav_icons_widget.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.pageList,
  });

  final List<Widget> pageList;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, value, child) => Scaffold(
          backgroundColor: Color(0xFFE2E2E2),
          bottomNavigationBar: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavIcons(
                    onTap: () {
                      value.pageIndex = 0;
                      log("0");
                    },
                    icon:
                        value.pageIndex == 0 ? Icons.home_outlined : Icons.home,
                  ),
                  BottomNavIcons(
                    onTap: () {
                      value.pageIndex = 1;
                      log("1");
                    },
                    icon: value.pageIndex == 1
                        ? Ionicons.search
                        : Ionicons.search_outline,
                  ),
                  BottomNavIcons(
                    onTap: () {
                      value.pageIndex = 2;
                    },
                    icon: value.pageIndex == 2
                        ? Ionicons.add_circle
                        : Ionicons.add_circle_outline,
                  ),
                  BottomNavIcons(
                    onTap: () {
                      value.pageIndex = 3;
                    },
                    icon: value.pageIndex == 3
                        ? Ionicons.cart_outline
                        : Ionicons.cart,
                  ),
                  BottomNavIcons(
                    onTap: () {
                      value.pageIndex = 4;
                    },
                    icon: value.pageIndex == 4
                        ? Ionicons.person_outline
                        : Ionicons.person,
                  ),
                ],
              ),
            ),
          )),
          body: pageList[value.pageIndex]),
    );
  }
}
