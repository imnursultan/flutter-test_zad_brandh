import 'package:flutter/material.dart';
import 'package:test_zad_app/constants/app_colors.dart';
import 'package:test_zad_app/constants/app_strings.dart';
import 'package:test_zad_app/module/home/product_list_screen.dart';



class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child:const Text(AppStrings.hello,
                      style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Color(AppColors.green),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      const Text(AppStrings.there,
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                          )),
                      Text('.',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          )),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 270.0, 0.0, 0.0),
                  child: Text(AppStrings.testZadanie,
                      style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                )
              ],
            ),
            Container(
                padding:
                    const EdgeInsets.only(top: 0, left: 20.0, right: 20.0, bottom: 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            ProductListScreen.routeName,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Center(
                                  child: Icon(Icons.touch_app),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Center(
                                child: Text(AppStrings.catalog,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ));
  }
}
