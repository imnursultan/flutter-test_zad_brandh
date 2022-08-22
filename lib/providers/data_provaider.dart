import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_zad_app/helpers/db_helper.dart';
import 'package:test_zad_app/models/product.dart';



class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addMovie(Product newProduct) async {
    _items.add(newProduct);
    notifyListeners();

    await DBHelper.insert(
      'Products',
      {
        'id': newProduct.id,
        'title': newProduct.title,
        'director': newProduct.director,
        'image': newProduct.image.path,
      },
    );
  }

  Future<void> editData(String id, Product editedProduct) async {

    final movieIndex = _items.indexWhere((element) => element.id == id);
    if (movieIndex >= 0) {
      _items[movieIndex] = editedProduct;
      notifyListeners();

      await DBHelper.edit(
          'Products',
          {
            'id': id,
            'title': editedProduct.title,
            'director': editedProduct.director,
            'image': editedProduct.image.path,
          },
          id);
    } else {
    }
  }

  Future<void> fetchData() async {
    final dataList = await DBHelper.getData('Products');
    _items = dataList
        .map(
          (e) => Product(
            id: e['id'],
            title: e['title'],
            director: e['director'],
            image: File(e['image']),
          ),
        )
        .toList();
    notifyListeners();
  }

  Future<void> deleteData(String id) async {
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    _items.removeAt(existingProductIndex);
    notifyListeners();

    await DBHelper.delete('Products', id);
  }
}
