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


}