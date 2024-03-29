import 'dart:developer';

import 'package:e_commerce/controllers/product_provider.dart';
import 'package:e_commerce/views/ui/product_by_card.dart';
import 'package:e_commerce/views/ui/product_page.dart';
import 'package:e_commerce/views/widgets/product_card_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/sneaker_model.dart';
import '../../shared/app_style.dart';
import 'new_shoes.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget(
      {super.key, required Future<List<Sneakers>> male, required this.tabIndex})
      : _male = male;

  final Future<List<Sneakers>> _male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.405,
            child: FutureBuilder<List<Sneakers>>(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text(
                    "Error ${snapshot.error}",
                    style: const TextStyle(color: Colors.white),
                  );
                } else {
                  final male = snapshot.data;
                  log(male.toString(), name: "here in the male category");
                  return ListView.builder(
                    itemCount: male!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final shoe = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          productNotifier.shoesSize = shoe.sizes;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductPage(
                                    id: shoe.id, category: shoe.category),
                              ));
                        },
                        child: ProductCard(
                            price: "\$${shoe.price}",
                            category: shoe.category,
                            id: shoe.id,
                            name: shoe.name,
                            image: shoe.imageUrl[0]),
                      );
                    },
                  );
                }
              },
            )),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Shoes",
                    style: fontStyle(24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductByCard(
                              tabIndex: tabIndex,
                            ),
                          ));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show all",
                          style: fontStyle(22, Colors.black, FontWeight.bold),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 25,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: FutureBuilder<List<Sneakers>>(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("${snapshot.hasError}");
                } else {
                  final male = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: male!.length,
                    itemBuilder: (context, index) {
                      final shoe = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NewShoes(imageUrl: shoe.imageUrl[0]),
                      );
                    },
                  );
                }
              },
            ))
      ],
    );
  }
}
