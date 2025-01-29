
import 'dart:convert';

import 'package:spleenify_task/AppUtils/app_imports.dart';
import 'package:spleenify_task/ModelClass/category_model.dart';

class ApiServices{

  final String baseUrl = "https://dummyjson.com/";

  final dio = Dio()
    ..options.connectTimeout = const Duration(seconds: 90) // 5 seconds
    ..options.receiveTimeout = const Duration(seconds: 90)
  ;


  Future<ResponseModel?> getProducts() async {
    try {
      var response = await dio.get(
        "${baseUrl}products?limit=10",
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data.runtimeType.toString() == "String"?
        jsonDecode(response.data) : response.data;
        return ResponseModel.fromJson(responseData,);
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }

  Future<ResponseModel?> getProductsByCat(String query) async {
    try {
      var response = await dio.get(
        "${baseUrl}products/category/$query",
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data.runtimeType.toString() == "String"?
        jsonDecode(response.data) : response.data;
        return ResponseModel.fromJson(responseData,);
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }

  Future<List<CategoryModel>?> getCategories() async {
    try {
      var response = await dio.get(
        "${baseUrl}products/categories",
      );

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((item) => CategoryModel.fromJson(item))
            .toList();
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }


}