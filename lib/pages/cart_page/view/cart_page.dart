import 'package:district_flutter/pages/cart_page/controller/cart_controller.dart';
import 'package:district_flutter/widgets/cart_item.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, controller, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
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
          bottomNavigationBar:
              context.watch<CartController>().totalProducts != 0
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
