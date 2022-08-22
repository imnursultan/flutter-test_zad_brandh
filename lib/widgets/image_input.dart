import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:test_zad_app/constants/app_strings.dart';


class ImageInput extends StatefulWidget {
  final Function _onSelectImage;
  final File? _image;

  const ImageInput(this._onSelectImage, this._image, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  late File? _storedImage;
  final _picker = ImagePicker();

  Future<void> _takePicture() async {
    final imageFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');
    widget._onSelectImage(savedImage);
  }

  @override
  void initState() {
    super.initState();
    _storedImage = widget._image;
  }

  @override
  Widget build(BuildContext context) {
    // print(widget._onSelectImage);
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage as File,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  AppStrings.productImage,
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.camera),
            label: const Text(AppStrings.uploadPhoto),
            onPressed: _takePicture,
          ),
        ),
      ],
    );
  }
}