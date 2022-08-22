
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_zad_app/constants/app_strings.dart';
import 'package:test_zad_app/module/product_add/view/product_add_screen.dart';
import 'package:test_zad_app/providers/products.dart';
import 'package:test_zad_app/widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  static const routeName = '/list-product';
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.products),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(ProductAddScreen.routeName);
            },
          ),
       
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Products>(context, listen: false).fetchData(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<Products>(
                    builder: (ctx, movies, _) => movies.items.isEmpty
                        ? Center(
                            child: Text(
                              AppStrings.notProduct,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          )
                        : ListView.builder(
                            itemCount: movies.items.length,
                            itemBuilder: (ctx, i) {
                              var reversedList = movies.items.reversed.toList();
                              return ProductItem(reversedList[i]);
                            }),
                  ),
      ),
    );
  }
}
