import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalog.dart';
import 'package:flutter/material.dart';
import '../models/catalog.dart';

class CartModel {
  // CartModel(this._catalog);
  late CatalogueModel _catalog;

  // collection of ids store ids of each item
  final List<int> _itemIds = [];

  CatalogueModel get catalog => _catalog;

  set catalog(CatalogueModel newCatalog) {
    _catalog = newCatalog;
  }

  // get items in cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // remove id
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  void perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  void perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
