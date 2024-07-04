import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe_design/Models/ItemModel.dart';

class HomeController extends GetxController {
  List<ItemModel> itemDataList = [
    ItemModel(Colors.pink, 'assets/image/shape1.png', 'Package name\nLiquid Swipe...'),
    ItemModel(Colors.deepPurpleAccent, 'assets/image/shape3.png', 'Can be used for\nOnboarding Design...'),
    ItemModel(Colors.redAccent, 'assets/image/shape2.png', 'Like, comment &\nFollow for more...'),
  ];
  RxInt dotIndex = 0.obs;
}