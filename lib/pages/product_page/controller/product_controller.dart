import 'package:district_flutter/model/product_model.dart';
import 'package:district_flutter/repo/product_repo.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

class ProductController extends GetxController {
  late ProductRepo productRepo;
  late List<ProductModel> productList;
  late String errorLine;

  @override
  void onInit() {
    super.onInit();
    productRepo = ProductRepo();
    productList = [];

    errorLine = "";
    fetchProducts();
  }

  fetchProducts() async {
    Either<Failure, List<ProductModel>> response =
        await productRepo.getProducts();
    response.fold((l) {
      l.errorResponse;
      errorLine = "There is an error";
    }, (r) {
      productList = r;
      update();
    });
  }
}
