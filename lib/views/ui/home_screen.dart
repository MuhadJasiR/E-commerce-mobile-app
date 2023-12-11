import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/sneaker_model.dart';
import 'package:e_commerce/services/helper.dart';
import 'package:e_commerce/shared/app_style.dart';
import 'package:e_commerce/views/widgets/product_card_widgets.dart';
import 'package:flutter/material.dart';

import '../widgets/home_widget.dart';
import '../widgets/new_shoes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;

  void getMaleSneaker() {
    _male = Helper().getMaleSneaker();
    log(_male.toString(), name: "checking the field is empty or not");
  }

  // void getFemaleSneaker() {
  //   _female = Helper().getFemaleSneaker();
  // }

  @override
  void initState() {
    super.initState();
    getMaleSneaker();
    // getFemaleSneaker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Adidas.jpg"),
                        fit: BoxFit.fill)),
                child: Container(
                  padding: const EdgeInsets.only(left: 8, bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Athletics Shoes",
                        style: fontStyleWithHeight(
                            42, Colors.white, FontWeight.bold, 1.5),
                      ),
                      Text("Collection",
                          style: fontStyleWithHeight(
                              42, Colors.white, FontWeight.bold, 1.2)),
                      TabBar(
                          padding: EdgeInsets.zero,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: Colors.white,
                          labelStyle:
                              fontStyle(24, Colors.white, FontWeight.bold),
                          unselectedLabelColor: Colors.grey.withOpacity(0.3),
                          dividerColor: const Color.fromARGB(255, 0, 0, 0),
                          tabs: const [
                            Tab(text: "Mens Shoes"),
                            Tab(text: "Women Shoes"),
                            Tab(text: "Kids Shoes"),
                          ]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.265),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      HomeWidget(male: _male),
                      HomeWidget(male: _male),
                      HomeWidget(male: _male),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
