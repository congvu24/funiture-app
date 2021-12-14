// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStore, Store {
  Computed<double>? _$submoneyComputed;

  @override
  double get submoney => (_$submoneyComputed ??=
          Computed<double>(() => super.submoney, name: '_CartStore.submoney'))
      .value;

  final _$voucherAtom = Atom(name: '_CartStore.voucher');

  @override
  Voucher? get voucher {
    _$voucherAtom.reportRead();
    return super.voucher;
  }

  @override
  set voucher(Voucher? value) {
    _$voucherAtom.reportWrite(value, super.voucher, () {
      super.voucher = value;
    });
  }

  final _$paymentMethodAtom = Atom(name: '_CartStore.paymentMethod');

  @override
  PaymentMethod get paymentMethod {
    _$paymentMethodAtom.reportRead();
    return super.paymentMethod;
  }

  @override
  set paymentMethod(PaymentMethod value) {
    _$paymentMethodAtom.reportWrite(value, super.paymentMethod, () {
      super.paymentMethod = value;
    });
  }

  final _$addressAtom = Atom(name: '_CartStore.address');

  @override
  Address get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$shippingMethodAtom = Atom(name: '_CartStore.shippingMethod');

  @override
  ShippingMethod get shippingMethod {
    _$shippingMethodAtom.reportRead();
    return super.shippingMethod;
  }

  @override
  set shippingMethod(ShippingMethod value) {
    _$shippingMethodAtom.reportWrite(value, super.shippingMethod, () {
      super.shippingMethod = value;
    });
  }

  final _$dataAtom = Atom(name: '_CartStore.data');

  @override
  ObservableList<ProductInCart> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableList<ProductInCart> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$_CartStoreActionController = ActionController(name: '_CartStore');

  @override
  void addCart(Product item) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.addCart');
    try {
      return super.addCart(item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPayment(PaymentMethod method) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.setPayment');
    try {
      return super.setPayment(method);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddress(Address newAddress) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.setAddress');
    try {
      return super.setAddress(newAddress);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShipping(ShippingMethod newShipping) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.setShipping');
    try {
      return super.setShipping(newShipping);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVoucher(Voucher newVoucher) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.setVoucher');
    try {
      return super.setVoucher(newVoucher);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCart() {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.clearCart');
    try {
      return super.clearCart();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
voucher: ${voucher},
paymentMethod: ${paymentMethod},
address: ${address},
shippingMethod: ${shippingMethod},
data: ${data},
submoney: ${submoney}
    ''';
  }
}
