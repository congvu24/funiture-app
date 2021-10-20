import 'package:boilerplate/models/product/Product.model.dart';
import 'package:boilerplate/models/profile/profile.model.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  // repository instance
  final Repository _repository;

  // constructor:---------------------------------------------------------------
  _ProductStore(Repository repository) : this._repository = repository {
    // setting up disposers
    _setupDisposers();
    // data = _repository.getProducts();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [];
  }

  // store variables:-----------------------------------------------------------

  @observable
  List<Product> data = [];

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
