import 'package:district_flutter/pages/cart_page/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Ionicons.chevron_back,
                color: Colors.black,
              ),
            ),
            title: const Text(
              "My Bag",
              style: TextStyle(
                fontFamily: "Popins",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.cartItems.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "MY ITEMS",
                          style: TextStyle(
                            fontFamily: "Popins",
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      )
                    : Container(),
                for (CartItem cartItem in controller.cartItems)
                  CartCard(cartItem: cartItem),
                ExpansionTile(
                  shape: const ContinuousRectangleBorder(side: BorderSide.none),
                  iconColor: Colors.black,
                  title: Text(
                    "Total Number",
                    style: TextStyle(
                      fontFamily: "Popins",
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  initiallyExpanded: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        controller.totalProducts.toString(),
                        style: const TextStyle(
                          fontFamily: "Popins",
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Total Amount",
                    style: TextStyle(
                      fontFamily: "Popins",
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  initiallyExpanded: true,
                  iconColor: Colors.black,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        controller.totalAmount.toString(),
                        style: const TextStyle(
                          fontFamily: "Popins",
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: controller.totalProducts != 0.obs
              ? Container(
                  height: 70,
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'Check Out',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : null,
        );
      },
    );
  }
}

// ignore: must_be_immutable
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
