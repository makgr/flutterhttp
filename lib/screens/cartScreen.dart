import 'package:flutter/material.dart';
import 'package:flutterhttp/services/apiService.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: FutureBuilder(
        future: ApiService().getCart(1),
        builder: (contex,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return Text('success');
          }
          return Center(child: CircularProgressIndicator(),);
        }
        ),
      
    );
  }
}