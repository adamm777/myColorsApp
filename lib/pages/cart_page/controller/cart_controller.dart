import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:district_flutter/model/product_model.dart';

class CartItem {
  final ProductModel product;
  int requestedQuantity;

  CartItem({required this.product, required this.requestedQuantity});
}

class CartController extends ChangeNotifier {
  final List<CartItem> cartItems = [];
  var totalProducts = 0;
  var totalAmount = 0.0;

  void addToCart(ProductModel product) {
    final existingCartItem = cartItems.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, requestedQuantity: 0),
    );

    if (product.details.quantity > 0) {
      if (existingCartItem.requestedQuantity == 0) {
        cartItems.add(CartItem(product: product, requestedQuantity: 1));
      } else {
        existingCartItem.requestedQuantity++;
      }
      product.details.quantity--;
      totalProducts++;
      totalAmount += product.details.price;
      notifyListeners();
      Fluttertoast.showToast(
        msg: "Product added to Cart",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Not enough in stock",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  void incrementQuantity(CartItem cartItem) {
    if (cartItem.product.details.quantity > 0) {
      cartItem.requestedQuantity++;
      cartItem.product.details.quantity--;
      totalProducts++;
      totalAmount += cartItem.product.details.price;
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: "Not enough in stock",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  void decrementQuantity(CartItem cartItem) {
    if (cartItem.requestedQuantity > 1) {
      cartItem.requestedQuantity--;
      cartItem.product.details.quantity++;
      totalProducts--;
      totalAmount -= cartItem.product.details.price;
      notifyListeners();
    }
  }

  void removeFromCart(CartItem cartItem) {
    cartItems.remove(cartItem);
    cartItem.product.details.quantity += cartItem.requestedQuantity;
    totalProducts -= cartItem.requestedQuantity;
    totalAmount -= cartItem.requestedQuantity * cartItem.product.details.price;
    notifyListeners();
  }

  void clearCart() {
    for (var cartItem in cartItems) {
      cartItem.product.details.quantity += cartItem.requestedQuantity;
    }
    cartItems.clear();
    totalProducts = 0;
    totalAmount = 0.0;
    notifyListeners();
  }
}
