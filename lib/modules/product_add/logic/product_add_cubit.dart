import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


part 'product_add_state.dart';


class ProductAddCubit extends Cubit<ProductAddState> {
  ProductAddCubit() : super(ProductAddState());


  void selectImage(File pickedImage) {
    pickedImage = pickedImage;
  }
    Function? onSelectImage;
   File? image;
     final _picker = ImagePicker();
  Future<void> takePicture() async {
    final imageFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }

    // widget._onSelectImage(savedImage);
  }


 

}
