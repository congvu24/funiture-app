// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStore, Store {
  final _$dataAtom = Atom(name: '_ProductStore.data');

  @override
  List<Product> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<Product> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
