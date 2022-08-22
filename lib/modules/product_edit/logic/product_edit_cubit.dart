import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_edit_state.dart';

class ProductEditCubit extends Cubit<ProductEditState> {
  ProductEditCubit() : super(ProductEditInitial());
}
