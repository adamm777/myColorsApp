import 'package:cached_network_image/cached_network_image.dart';
import 'package:district_flutter/model/product_model.dart';
import 'package:flutter/material.dart';
import '../pages/product_page/view/product_details.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  ProductModel product;
  ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 0),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: product.image,
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontFamily: "Popins",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "KWD ${product.details.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13.0,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
