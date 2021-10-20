import 'dart:convert';
import 'dart:ffi';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Product extends Equatable {
  final int id;
  final String name;
  final double price;
  final double star;
  final String description;
  final String room;
  final String category;
  List<String> images;
  String? brand;
  String? country;
  String? material;
  double? length;
  double? width;
  double? deep;
  double? height;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.star,
      required this.description,
      required this.room,
      required this.category,
      required this.images,
      this.brand,
      this.country,
      this.material,
      this.length,
      this.width,
      this.deep,
      this.height});

  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json["id"],
        category = json["category"],
        price = json["price"],
        star = json["star"],
        description = json["description"],
        room = json["room"],
        images = List<String>.from(json["images"]),
        brand = json["brand"],
        country = json["country"],
        material = json["material"],
        length = json["length"],
        width = json["width"],
        deep = json["deep"],
        height = json["height"];

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        star,
        description,
        brand,
        country,
        material,
        length,
        width,
        deep,
        images,
        height
      ];
}
