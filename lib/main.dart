import 'package:flutter/material.dart';
import 'package:flutter_application_riverpod/constant/const.dart';
import 'package:flutter_application_riverpod/theme/product_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: Constant.routesList.asMap().map((key, value) => MapEntry( value['route'], (context) => value['page'])),
      debugShowCheckedModeBanner: false,
      theme: ProductTheme.darkTheme,
      title: 'Riverpod Examples',
    );
  }
}
