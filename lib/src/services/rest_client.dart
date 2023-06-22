import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/models.dart';

part 'rest_client.g.dart';

const BASE_URL = 'https://fakestoreapi.com';

@RestApi(baseUrl: BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/products?limit=15")
  Future<List<Product>> getProductList();

  @GET("/products/categories")
  Future<List<String>> getCategoriesList();

  @GET("/products/category/{categoryName}")
  Future<List<Product>> getCategoriesDataList(
      @Path("categoryName") String categoryName);
}

