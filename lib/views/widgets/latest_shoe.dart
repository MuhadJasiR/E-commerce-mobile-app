import 'package:e_commerce/views/widgets/stagger_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../models/sneaker_model.dart';

class LatestShoe extends StatelessWidget {
  const LatestShoe({super.key, required Future<List<Sneakers>> male})
      : _male = male;

  final Future<List<Sneakers>> _male;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
      future: _male,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("${snapshot.hasError}");
        } else {
          final male = snapshot.data;
          return GridView.custom(
            gridDelegate: SliverWovenGridDelegate.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 16,
              pattern: [WovenGridTile(0.7), WovenGridTile(0.8)],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
                childCount: male!.length, (context, index) {
              final shoe = snapshot.data![index];
              return StaggerTile(
                  imageUrl: shoe.imageUrl[0],
                  name: shoe.title,
                  price: "\$${shoe.price}");
            }),
          );
        }
      },
    );
  }
}
