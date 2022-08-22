import 'dart:io';

class Product {
  final String id;
  final String title;
  final String director;
  final File image;

  Product({
    required this.id,
    required this.title,
    required this.director,
    required this.image,
  });
}
