import 'package:district_flutter/pages/cart_page/controller/cart_controller.dart';
import 'package:district_flutter/pages/product_page/controller/product_controller.dart';
import 'package:district_flutter/pages/product_page/view/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartController()),
        ChangeNotifierProvider(create: (_) => ProductController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartController(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyColors',
        home: ProductsPage(),
      ),
    );
  }
}
