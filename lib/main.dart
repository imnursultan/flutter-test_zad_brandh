import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_zad_app/constants/app_strings.dart';
import 'package:test_zad_app/modules/home/product_list_screen.dart';
import 'package:test_zad_app/modules/intro/intro_ios_screen.dart';
import 'package:test_zad_app/modules/product_add/view/product_add_screen.dart';
import 'package:test_zad_app/modules/product_edit/view/product_edit_screen.dart';
import 'package:test_zad_app/providers/data_provaider.dart';

void main() async {


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: DataProvaider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.productListApp,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(secondary: Colors.blueGrey),
        ),
        home: const IntroScreen(),
        routes: {
          ProductListScreen.routeName: (ctx) => const ProductListScreen(),
          ProductAddScreen.routeName: (ctx) => const ProductAddScreen(),
          ProductEditScreen.routeName: (ctx) =>const ProductEditScreen(),
        },
      ),
    );
  }
}
