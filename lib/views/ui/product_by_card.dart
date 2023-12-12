import 'package:e_commerce/models/sneaker_model.dart';
import 'package:e_commerce/services/helper.dart';
import 'package:e_commerce/views/widgets/latest_shoe.dart';
import 'package:e_commerce/views/widgets/stagger_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../shared/app_style.dart';

class ProductByCard extends StatefulWidget {
  const ProductByCard({super.key});

  @override
  State<ProductByCard> createState() => _ProductByCardState();
}

class _ProductByCardState extends State<ProductByCard>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male;

  void getMale() {
    _male = Helper().getMaleSneaker();
  }

  @override
  void initState() {
    getMale();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 0, 16, 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.close_rounded)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.filter_alt_outlined))
                        ],
                      ),
                    ),
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
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2,
                    left: 16,
                    right: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: TabBarView(controller: _tabController, children: [
                    LatestShoe(male: _male),
                    LatestShoe(male: _male),
                    LatestShoe(male: _male),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
