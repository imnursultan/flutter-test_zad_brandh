part of 'product_add_cubit.dart';

// ignore: must_be_immutable
class ProductAddState extends Equatable {
   ProductAddState({this.storedImage, this.widget});
  late File? storedImage;
  final String? widget;

  @override
  List<Object?> get props => [storedImage];

  List<Object?> get props2 => [widget];
}