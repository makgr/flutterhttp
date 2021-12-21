import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService{
  Future getAllProduct() async{
    final allProductUrl = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(allProductUrl);
    // print(response.statusCode);
    // print(response.body);
    return json.decode(response.body);
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



}