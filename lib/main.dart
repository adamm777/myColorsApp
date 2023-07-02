import 'package:district_flutter/pages/cart_page/controller/cart_controller.dart';
import 'package:district_flutter/pages/product_page/view/product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  Get.put(CartController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyColors',
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      locale: const Locale('en'),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 0.99),
        child: child!,
      ),
      home: const ProductsPage(),
    );
  }
}
