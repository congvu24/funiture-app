import 'package:boilerplate/models/product/Product.model.dart';
import 'package:boilerplate/models/product/ProductInCart.model.dart';
import 'package:boilerplate/models/profile/profile.model.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:boilerplate/ui/cart/address.screen.dart';
import 'package:boilerplate/ui/cart/confirm.screen.dart';
import 'package:boilerplate/widgets/listview_payment.widget.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  // repository instance
  final Repository _repository;

  // constructor:---------------------------------------------------------------
  _CartStore(Repository repository) : this._repository = repository {
    _setupDisposers();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [];
  }

  // store variables:-----------------------------------------------------------

  @observable
  Voucher? voucher;

  @observable
  PaymentMethod paymentMethod = payments[0];

  @observable
  Address address = addresses[0];

  @observable
  ShippingMethod shippingMethod = shippingMethods[0];

  @observable
  ObservableList<ProductInCart> data = new ObservableList<ProductInCart>();

  @computed
  double get submoney {
    double total = 0;
    data.forEach((element) {
      total = total + element.product.price * element.number;
    });
    return total;
  }

  @action
  void addCart(Product item) {
    int currentIndex =
        data.indexWhere((element) => item.id == element.product.id);
    if (currentIndex >= 0) {
      ProductInCart newItem = data[currentIndex];
      newItem.number = newItem.number + 1;
      List<ProductInCart> newList = data.toList();
      newList[currentIndex] = newItem;
      data = new ObservableList<ProductInCart>.of(newList);
    } else {
      ProductInCart newItem = new ProductInCart(number: 1, product: item);
      data.add(newItem);
    }
  }

  void removeCart(Product item) {
    int currentIndex =
        data.indexWhere((element) => item.id == element.product.id);
    ProductInCart newItem = data[currentIndex];
    if (newItem.number - 1 == 0) {
      data.removeWhere((element) => element.product.id == item.id);
    } else {
      newItem.number = newItem.number - 1;
      List<ProductInCart> newList = data.toList();
      newList[currentIndex] = newItem;
      data = new ObservableList<ProductInCart>.of(newList);
    }
  }

  @action
  void setPayment(PaymentMethod method) {
    paymentMethod = method;
  }

  @action
  void setAddress(Address newAddress) {
    address = newAddress;
  }

  @action
  void setShipping(ShippingMethod newShipping) {
    shippingMethod = newShipping;
  }

  @action
  void setVoucher(Voucher newVoucher) {
    voucher = newVoucher;
  }

  @action
  void clearCart() {
    data = new ObservableList<ProductInCart>();
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
