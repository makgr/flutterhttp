

import 'dart:html';

class Product{
  final int id;
  final String title;
  final price;
  final String descriptipon;
  final String category;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.descriptipon,
    required this.category,
    required this.image
  });

factory Product.fromjson(Map<String, dynamic> json){
  return Product(
    id: json['id'],
    title: json['title'],
    price: json['price'],
    descriptipon: json['description'],
    category: json['category'],
    image: json['image']
  );
}

}