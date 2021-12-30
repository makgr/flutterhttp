import 'dart:convert';

import 'package:flutterhttp/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService{
  // Future getAllProduct() async{
  //   final allProductUrl = Uri.parse("https://fakestoreapi.com/products");
  //   final response = await http.get(allProductUrl);
  //   // print(response.statusCode);
  //   // print(response.body);
  //   return json.decode(response.body);
  // }
  Future<List<Product>> getAllProduct() async{
    final allProductUrl = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(allProductUrl);
    List<Product> allproducts = [];
    List body = json.decode(response.body);
    body.forEach((product) { 
      allproducts.add(Product.fromjson(product));
    });
    return allproducts;
  }

  Future getSingleProductDetails(int id) async{
    final singleProductUrl = Uri.parse("https://fakestoreapi.com/products/$id");
    final response = await http.get(singleProductUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

 Future getAllProductCategory() async{
    final categoryUrl = Uri.parse("https://fakestoreapi.com/products/categories");
    final response = await http.get(categoryUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getSingleProductByCategory(String catName) async{
    final productCategoryUrl = Uri.parse("https://fakestoreapi.com/products/category/$catName");
    final response = await http.get(productCategoryUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

 Future getCart(int userId) async{
    final fetchCartProducts = Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.get(fetchCartProducts);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future userLogin(String username, String password) async{
    final loginUrl = Uri.parse("https://fakestoreapi.com/auth/login");
    final response = await http.post(loginUrl, body:{
      'username':username,
      'password':password
    });
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future updateCart(int userId,int productId) async{
    final updateCartUrl = Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.put(updateCartUrl, body: {
      'userId': '$userId',
      'date': DateTime.now().toString(),
      'products':[
        {
          'productId':'$productId',
          'quantity': '1',
        }
      ].toString()
    });
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future deleteCart(String userId)async{
    final deleteCartUrl = Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.delete(deleteCartUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future userAuthentication(String username, String password) async{
    final authUrl = Uri.parse("http://api.somewhere.io/");
    final response = await http.post(authUrl, body: {
      'username': username,
      'password': password,
    });
    print(response.statusCode);
    print(response.body);

  }


}