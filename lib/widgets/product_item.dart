import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_zad_app/models/product.dart';
import 'package:test_zad_app/module/product_edit/view/product_edit_screen.dart';
import 'package:test_zad_app/providers/products.dart';

class ProductItem extends StatefulWidget {
  final Product _movie;

  const ProductItem(this._movie, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: FileImage(
            widget._movie.image,
          ),
        ),
        title: Text(
          widget._movie.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(widget._movie.director),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () => Navigator.of(context).pushNamed(
                 ProductEditScreen.routeName,
                  arguments: widget._movie.id),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () => Provider.of<Products>(context, listen: false)
                  .deleteData(widget._movie.id),
            ),
          ],
        ),
      ),
    );
  }
}
