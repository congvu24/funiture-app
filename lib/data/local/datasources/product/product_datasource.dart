import 'dart:convert';

import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/models/post/post_list.dart';
import 'package:boilerplate/models/product/Product.model.dart';
import 'package:sembast/sembast.dart';
import 'package:flutter/services.dart' show rootBundle;

class ProductDataSource {
  final String file;
  final List<Product> data = [];

  // final List<Product> data = [
  //   new Product(
  //       id: 1,
  //       name: "san pham 1 san pham 1 san pham 1 san pham 1 san pham 1",
  //       price: 200000,
  //       star: 4.5,
  //       description:
  //           "The fabric chairs with curved backs make you want to stay at the dining table longer. Choose...See more fabric chairs with curved backs make you want to stay at the dining table longer. Choose...See more",
  //       room: "Phòng khách",
  //       category: "Ghế",
  //       brand: "Hoà Phát",
  //       country: "Việt Nam",
  //       material: "Thép",
  //       width: 20,
  //       length: 20,
  //       deep: 20,
  //       height: 10,
  //       images: ["assets/images/product-1.png", "assets/images/product-1.png"]),
  //   new Product(
  //       id: 2,
  //       name: "san pham 1",
  //       price: 200000,
  //       star: 4.5,
  //       description:
  //           "The fabric chairs with curved backs make you want to stay at the dining table longer. Choose...See more fabric chairs with curved backs make you want to stay at the dining table longer. Choose...See more",
  //       room: "Phòng khách",
  //       category: "Ghế",
  //       brand: "Hoà Phát",
  //       country: "Việt Nam",
  //       material: "Thép",
  //       width: 20,
  //       length: 20,
  //       deep: 20,
  //       height: 10,
  //       images: ["assets/images/product-1.png", "assets/images/product-1.png"]),
  //   new Product(
  //       id: 3,
  //       name: "san pham 1",
  //       price: 200000,
  //       star: 4.5,
  //       description:
  //           "The fabric chairs with curved backs make you want to stay at the dining table longer. Choose...See more fabric chairs with curved backs make you want to stay at the dining table longer. Choose...See more",
  //       room: "Phòng khách",
  //       category: "Ghế",
  //       brand: "Hoà Phát",
  //       country: "Việt Nam",
  //       material: "Thép",
  //       width: 20,
  //       length: 20,
  //       deep: 20,
  //       height: 10,
  //       images: ["assets/images/product-1.png", "assets/images/product-1.png"]),
  //   new Product(
  //       id: 4,
  //       name: "san pham 1",
  //       price: 200000,
  //       star: 4.5,
  //       description:
  //           "The fabric chairs with curved backs make you want to stay at the dining table longer. Choose...See more fabric chairs with curved backs make you want to stay at the dining table longer. Choose...See more",
  //       room: "Phòng khách",
  //       category: "Ghế",
  //       brand: "Hoà Phát",
  //       country: "Việt Nam",
  //       material: "Thép",
  //       width: 20,
  //       length: 20,
  //       deep: 20,
  //       height: 10,
  //       images: ["assets/images/product-1.png", "assets/images/product-1.png"]),
  //   new Product(
  //       id: 5,
  //       name: "san pham 1",
  //       price: 200000,
  //       star: 4.5,
  //       description:
  //           "The fabric chairs with curved backs make you want to stay at the dining table longer. Choose...See more fabric chairs with curved backs make you want to stay at the dining table longer. Choose...See more",
  //       room: "Phòng khách",
  //       category: "Ghế",
  //       brand: "Hoà Phát",
  //       country: "Việt Nam",
  //       material: "Thép",
  //       width: 20,
  //       length: 20,
  //       deep: 20,
  //       height: 10,
  //       images: ["assets/images/product-1.png", "assets/images/product-1.png"]),
  //   new Product(
  //       id: 6,
  //       name: "san pham 1",
  //       price: 200000,
  //       star: 4.5,
  //       description:
  //           "The fabric chairs with curved backs make you want to stay at the dining table longer. Choose...See more fabric chairs with curved backs make you want to stay at the dining table longer. Choose...See more",
  //       room: "Phòng khách",
  //       category: "Ghế",
  //       brand: "Hoà Phát",
  //       country: "Việt Nam",
  //       material: "Thép",
  //       width: 20,
  //       length: 20,
  //       deep: 20,
  //       height: 10,
  //       images: ["assets/images/product-1.png", "assets/images/product-1.png"]),
  // ];

  ProductDataSource(this.file);

  loadData() async {
    String jsondata = await rootBundle.loadString(file);
    List<dynamic> list = jsonDecode(jsondata);
    list.forEach((element) {
      // Map<String, dynamic> j = jsonDecode(element);
      data.add(Product.fromJson(element));
    });
  }

  List<Product> getData() {
    return data;
  }
}
