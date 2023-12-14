import 'package:e_commerce/models/sneaker_model.dart';
import 'package:e_commerce/services/helper.dart';
import 'package:e_commerce/views/widgets/category_btm.dart';
import 'package:e_commerce/views/widgets/customer_spacer.dart';
import 'package:e_commerce/views/widgets/latest_shoe.dart';
import 'package:e_commerce/views/widgets/stagger_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../shared/app_style.dart';

class ProductByCard extends StatefulWidget {
  const ProductByCard({super.key, required this.tabIndex});

  final int tabIndex;

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
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close_rounded)),
                          IconButton(
                              onPressed: () {
                                filter();
                              },
                              icon: const Icon(Icons.filter_alt_outlined))
                        ],
                      ),
                    ),
                    TabBar(
                        padding: EdgeInsets.zero,
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
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
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

  Future<dynamic> filter() {
    final double _value = 100;
    List brandImages = [
      "https://cdn.britannica.com/94/193794-050-0FB7060D/Adidas-logo.jpg",
      "https://indieground.net/wp-content/uploads/2023/03/indieblog-nikelogohistory-15.jpg",
      "https://static.wixstatic.com/media/eba10f_3f16cbcdea4e42668d90805d3903cfea~mv2_d_3840_2160_s_2.png/v1/crop/x_725,y_171,w_2448,h_1787/fill/w_602,h_480,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/Puma-Logo-Png-Images-Transparent-Backgro.png",
      "https://i.pinimg.com/736x/98/e5/a4/98e5a4811e32177795897d60231a016f.jpg"
    ];
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.82,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(15))),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 5,
                width: 40,
                decoration: const BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  children: [
                    const CustomSpacer(),
                    Text(
                      "Filter",
                      style: fontStyle(40, Colors.black, FontWeight.bold),
                    ),
                    Text(
                      "Gender",
                      style: fontStyle(20, Colors.black, FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        CategoryBtn(buttonClr: Colors.black, label: "Men"),
                        CategoryBtn(buttonClr: Colors.grey, label: "Kids"),
                        CategoryBtn(buttonClr: Colors.grey, label: "Women")
                      ],
                    ),
                    const CustomSpacer(),
                    Text(
                      "Category",
                      style: fontStyle(20, Colors.black, FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        CategoryBtn(buttonClr: Colors.black, label: "shoes"),
                        CategoryBtn(buttonClr: Colors.grey, label: "Apparels"),
                        CategoryBtn(
                            buttonClr: Colors.grey, label: "Accessories"),
                      ],
                    ),
                    const CustomSpacer(),
                    Text(
                      "price",
                      style: fontStyle(20, Colors.black, FontWeight.bold),
                    ),
                    const CustomSpacer(),
                    Slider(
                      value: _value,
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.black,
                      max: 500,
                      divisions: 50,
                      label: _value.toString(),
                      secondaryTrackValue: 200,
                      onChanged: (value) {},
                    ),
                    const CustomSpacer(),
                    Text(
                      "Brand",
                      style: fontStyle(20, Colors.black, FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 80,
                      child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                border: Border.all(
                                    strokeAlign: BorderSide.strokeAlignInside),
                              ),
                              child: Image.network(
                                brandImages[index],
                                height: 60,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
