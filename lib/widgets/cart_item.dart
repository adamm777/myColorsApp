// ignore: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:district_flutter/pages/cart_page/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartCard extends StatelessWidget {
  final CartItem cartItem;
  final CartController controller = Get.find<CartController>();

  CartCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: cartItem.product.image,
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              cartItem.product.name,
                              style: const TextStyle(
                                fontFamily: "Popins",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "KWD ${cartItem.product.details.price}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            controller.decrementQuantity(cartItem);
                          },
                        ),
                        Text(
                          cartItem.requestedQuantity.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.black),
                          onPressed: () {
                            controller.incrementQuantity(cartItem);
                          },
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        controller.removeFromCart(cartItem);
                      },
                      child: const Text("Remove"),
                    )
                  ],
                ),
              ],
            ),
            const Divider(color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
