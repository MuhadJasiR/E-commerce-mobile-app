import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/constants.dart';
import 'package:e_commerce/shared/app_style.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ionicons/ionicons.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    final _favBox = Hive.box("fav_box");

    _deleteFav(int key) async {
      await _favBox.delete(key);
    }

    List<dynamic> fav = [];
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        "key": key,
        "id": item["id"],
        "name": item["name"],
        "category": item["category"],
        "price": item["price"],
        "imageUrl": item["imageUrl"]
      };
    }).toList();

    fav = favData.reversed.toList();
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Adidas.jpg"),
                    fit: BoxFit.cover)),
            child: Text(
              "My Favorite",
              style: fontStyle(40, Colors.white, FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 100),
              itemCount: fav.length,
              itemBuilder: (context, index) {
                final shoe = fav[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.11,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 5,
                                blurRadius: 0.3,
                                offset: Offset(0, 1))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CachedNetworkImage(
                                  imageUrl: shoe["imageUrl"],
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      shoe["name"],
                                      style: fontStyle(
                                          16, Colors.black, FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      shoe["category"],
                                      style: fontStyle(
                                          14, Colors.grey, FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${shoe['price']}",
                                          style: fontStyle(18, Colors.black,
                                              FontWeight.w600),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                _deleteFav(shoe["key"]);
                                ids.removeWhere(
                                    (element) => element == shoe["id"]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Favorites(),
                                    ));
                              },
                              icon: Icon(Ionicons.heart_dislike)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
