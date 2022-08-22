import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_zad_app/constants/app_colors.dart';
import 'package:test_zad_app/constants/app_strings.dart';
import 'package:test_zad_app/models/product.dart';
import 'package:test_zad_app/providers/products.dart';
import 'package:test_zad_app/widgets/image_input.dart';



class ProductAddScreen extends StatefulWidget {
  static const routeName = '/add-movie';
  const ProductAddScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductAddScreenState createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final _tiltleController = TextEditingController();
  final _directorController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _saveProduct() {
    if (_tiltleController.text.isEmpty ||
        _directorController.text.isEmpty ||
        _pickedImage == null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppStrings.fillAllTheFeilds),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    var addData = Product(
      id: DateTime.now().toString(),
      title: _tiltleController.text,
      director: _directorController.text,
      image: _pickedImage as File,
    );

    Provider.of<Products>(context, listen: false).addMovie(addData);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addNewProduct),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
              child: Column(
                children: [
                  TextField(
                    controller: _tiltleController,
                    decoration: InputDecoration(
                      hintText: AppStrings.productName,
                      prefixIcon: const Icon(
                        Icons.production_quantity_limits,
                        color: Color(AppColors.green),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _directorController,
                    decoration: InputDecoration(
                      hintText: AppStrings.companyName,
                      prefixIcon: const Icon(
                        Icons.business,
                        color: Color(AppColors.green),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ImageInput(_selectImage, null,)
                ],
              ),
            ),
          )),
          ElevatedButton.icon(
            onPressed: _saveProduct,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: const Text(
              AppStrings.addProduct,
              style: TextStyle(color: Colors.white),
            ),
       
          ),
        ],
      ),
    );
  }
}
