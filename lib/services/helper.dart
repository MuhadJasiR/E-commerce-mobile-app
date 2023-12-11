import 'dart:developer';

import 'package:e_commerce/models/sneaker_model.dart';
import 'package:flutter/services.dart' as the_bundle;

// this class fetches data from the json file and return it to the app
class Helper {
  Future<List<Sneakers>> getMaleSneaker() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/mens_shoes.json");
    final maleList = sneakersFromJson(data);
    log(maleList.toString());
    return maleList;
  }

  // Future<List<Sneakers>> getFemaleSneaker() async {
  //   final data =
  //       await the_bundle.rootBundle.loadString("assets/json/mens_shoes.json");
  //   final femaleList = sneakersFromJson(data);
  //   return femaleList;
  // }

  // Future<List<Sneakers>> kidsSneaker() async {
  //   final data =
  //       await the_bundle.rootBundle.loadString("assets/json/mens_shoes.json");
  //   final kidsList = sneakersFromJson(data);
  //   return kidsList;
  // }

  // Future<Sneakers> getMaleSneakersById(String id) async {
  //   final data =
  //       await the_bundle.rootBundle.loadString("assets/json/mens_shoes.json");
  //   final maleList = sneakersFromJson(data);
  //   final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);
  //   return sneaker;
  // }
}
