import 'dart:convert';

import 'package:http/http.dart' as http;

// first class

class ApiService {
  Future getAllPost() async {
    final allProductUrl = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(allProductUrl);
    // print(response.statusCode);
    // print(response.body);
    return json.decode(response.body);
  }

// deuxieme class
  Future getSingleProduct(int id) async {
    final SingleProductUrl = Uri.parse("https://fakestoreapi.com/products/$id");
    final response = await http.get(SingleProductUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  // troisiéme class
  Future getAllCategory() async {
    final allCategoryUrl =
        Uri.parse("https://fakestoreapi.com/products/categories");
    final response = await http.get(allCategoryUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }
  // 4eme class

  Future getProductByCategory(String catName) async {
    final fetchProductCategoryUrl =
        Uri.parse("https://fakestoreapi.com/products/category/$catName");
    final response = await http.get(fetchProductCategoryUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getCart(String userId) async {
    final fetchCartUrl = Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.get(fetchCartUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  // Post request login screen

  Future userLogin(String username, String password) async {
    final loginUrl = Uri.parse("https://fakestoreapi.com/auth/login");
    final response = await http.post(loginUrl, body: {
      'username': username,
      'password': password,
    });
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  // Put request
  Future UpdatCart(int userId, int productId) async {
    final UpdatCartUrl = Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.put(UpdatCartUrl, body: {
      "userId": "$userId",
      "date": DateTime.now().toString(),
      "products": [
        {
          "productId": "$productId",
          "quantity": "1",
        }
      ].toString()
    });
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  // delete request

  Future deleteCart(String userId) async {
    final deleteCartUrl = Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.delete(deleteCartUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }
}
