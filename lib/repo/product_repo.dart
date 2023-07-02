// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:district_flutter/model/product_model.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    Object? responseData = await fetchDataFromApi(
      futureFunction: () => apiPostFetch(
        apiUrl: "https://programmertest.district91.com/api/products",
      ),
    );

    if (responseData is Success) {
      Map<String, dynamic> res = responseData.response as Map<String, dynamic>;
      List<dynamic> response = res['data'] ?? [];
      List<ProductModel> productList = [];
      if (response.isNotEmpty) {
        for (Map<String, dynamic> product in response) {
          productList.add(ProductModel.fromJson(product));
        }
      }
      return Right(productList);
    }
    return Left(responseData as Failure);
  }
}

Future fetchDataFromApi({
  required TaskCallback<Future> futureFunction,
}) async {
  var responseFutureData = await futureFunction();

  Object? responseData = await responseFutureData;

  return responseData;
}

class Success {
  int code;
  Object response;
  Success({required this.code, required this.response});
}

class Failure {
  int code;
  Object errorResponse;
  Failure({required this.code, required this.errorResponse});
}

Future<Object> apiPostFetch(
    {required String apiUrl, bool reconnect = false, int timer = 2000}) async {
  reconnect = false;
  getResponse() async {
    try {
      Response response;
      response = await http.get(Uri.parse(apiUrl));

      if (200 == response.statusCode) {
        return Success(code: 200, response: json.decode(response.body));
      }
      if (reconnect) {
        Future.delayed(Duration(milliseconds: timer), () {
          getResponse();
        });
      } else {
        return Failure(code: 201, errorResponse: json.decode(response.body));
      }
    } catch (e) {
      if (reconnect) {
        Future.delayed(Duration(milliseconds: timer), () {
          getResponse();
        });
      } else {
        return Failure(code: 900, errorResponse: 'Unknown Error');
      }
    }
  }

  return getResponse();
}

printLog(dynamic msg, {String tag = ''}) {
  if (kDebugMode) {
    print(tag + ':' + ' ' + "$msg");
  }
}
