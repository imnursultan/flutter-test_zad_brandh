import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_zad_app/constants/app_strings.dart';
import 'package:test_zad_app/models/product.dart';
import 'package:test_zad_app/providers/products.dart';
import 'package:test_zad_app/widgets/image_input.dart';

import '../../../constants/app_colors.dart';

class ProductEditScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  const ProductEditScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductEditScreenState createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  String _titleValue = '';
  String _directorValue = '';
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _editMovie() {


    if (_titleValue.isEmpty || _directorValue.isEmpty || _pickedImage == null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppStrings.fillAllTheFeilds),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    final movieId = ModalRoute.of(context)?.settings.arguments as String;

    var editedData = Product(
      id: movieId,
      title: _titleValue,
      director: _directorValue,
      image: _pickedImage as File,
    );

    Provider.of<Products>(context, listen: false).editData(movieId, editedData);
    Navigator.of(context).pop();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final movieId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedMovie =
        Provider.of<Products>(context, listen: false).findById(movieId);

    setState(() {
      _pickedImage = loadedMovie.image;
      _titleValue = loadedMovie.title;
      _directorValue = loadedMovie.director;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit a Product'),
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
                    controller: TextEditingController(text: loadedMovie.title),
                    onChanged: (value) {
                      _titleValue = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextField(
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
                    controller:
                        TextEditingController(text: loadedMovie.director),
                    onChanged: (value) {
                      _directorValue = value;
                    },
                  ),
                  const SizedBox(height: 40),
                  ImageInput(_selectImage, loadedMovie.image,),
                     const SizedBox(height: 42),

                   
           
                ],
              ),
            ),
          )),
           
          ElevatedButton.icon(
            onPressed: _editMovie,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: const Text(
              AppStrings.saveChanges,
              style: TextStyle(color: Colors.white),
            ),
          
          ),
          
        ],
      ),
    );
  }
}



