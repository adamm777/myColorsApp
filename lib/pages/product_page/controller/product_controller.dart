import 'package:district_flutter/model/product_model.dart';
import 'package:district_flutter/repo/product_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';

class ProductController extends ChangeNotifier {
  late ProductRepo productRepo;
  late List<ProductModel> productList;
  late String errorLine;

  ProductController() {
    productRepo = ProductRepo();
    productList = [];
    errorLine = "";
    fetchProducts();
  }

  void fetchProducts() async {
    Either<Failure, List<ProductModel>> response =
        await productRepo.getProducts();
    response.fold(
      (l) {
        l.errorResponse;
        errorLine = "There is an error";
        notifyListeners();
      },
      (r) {
        productList = r;
        notifyListeners();
      },
    );
  }
}
