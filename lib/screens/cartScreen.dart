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
            List products = snapshot.data['products'];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (contex,index){
                return FutureBuilder(
                  future: ApiService().getSingleProductDetails(products[index]['productId']),
                  builder: (contex, AsyncSnapshot asyncSnapshot){
                    if(asyncSnapshot.hasData){
                      return ListTile(
                        leading: Image.network(asyncSnapshot.data['image']),
                        title: Text(asyncSnapshot.data['title']),
                        subtitle: Text('Quantity: '+products[index]['quantity'].toString()),
                        // trailing: Text('Price: '+asyncSnapshot.data['price'].toString()),
                        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red)),
                      );
                    }
                    return LinearProgressIndicator();
                  }
                  );
              }
              );
          }
          return Center(child: CircularProgressIndicator(),);
        }
        ),
        bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          color: Colors.amber,
          child: Center(
            child: Text('Order Now', style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              
            ),),
          ),
        ),
      
    );
  }
}