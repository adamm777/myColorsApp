import 'package:district_flutter/model/product_model.dart';
import 'package:district_flutter/pages/cart_page/view/cart_page.dart';
import 'package:district_flutter/pages/product_page/controller/product_controller.dart';

import 'package:district_flutter/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SizedBox(
                    height: 70,
                    child: Image.asset(
                      "assets/2.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ));
                },
                icon: const Icon(
                  Ionicons.bag_outline,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        padding: const EdgeInsets.all(16.0),
        children: [
          for (ProductModel product in productController.productList)
            ProductCard(product: product),
        ],
      ),
    );
  }
}
