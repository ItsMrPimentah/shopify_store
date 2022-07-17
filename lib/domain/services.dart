import 'package:dio/dio.dart';
import 'package:shopify_store/models/products_model.dart';
import 'service_helper.dart';

class ApiRequest implements BaseAPI {
  String accessToken = "myaccessToken";
  static String storeName = "mystoreTenant";
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://$storeName.myshopify.com/admin/',
      connectTimeout: 10000,
      receiveTimeout: 3000,
    ),
  );

  @override
  Future<List<Product>> get({Map<String, String>? headers}) async {
    Response response = await dio.get("products.json?access_token=$accessToken",
        options: Options(headers: headers));
    List<Product> products = response.data['products']
        .map<Product>((product) => Product.fromJson(product))
        .toList();

    return products;
  }
}
