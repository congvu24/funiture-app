import 'package:boilerplate/models/product/Product.model.dart';
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';

// ignore: must_be_immutable
class ProductInCart {
  @observable
  int number;

  @observable
  Product product;

  ProductInCart({
    required this.number,
    required this.product,
  });
}
