import 'package:district_flutter/model/product_model.dart';
import 'package:district_flutter/pages/cart_page/view/cart_page.dart';
import 'package:district_flutter/pages/product_page/controller/product_controller.dart';
import 'package:district_flutter/pages/product_page/view/product_details.dart';
import 'package:district_flutter/widgets/product_cart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ionicons/ionicons.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
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
                          "assets/logo.jpg",
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
                      Get.to(() => const CartPage());
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
              for (ProductModel product in controller.productList)
                ProductCard(product: product),
            ],
          ),
        );
      },
    );
  }
}
