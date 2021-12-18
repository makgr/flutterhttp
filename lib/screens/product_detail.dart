import 'package:flutter/material.dart';
import 'package:flutterhttp/services/apiService.dart';

class ProductDetail extends StatelessWidget {
  final int id;

  ProductDetail(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product details'),
      ),
      body: FutureBuilder(
        future: ApiService().getSingleProductDetails(id),
        builder: (contex,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Image.network(snapshot.data['image'],height: 200, width: double.infinity,),
                  SizedBox(height: 30,),
                  Center(
                    child: Text(snapshot.data['title'],style: TextStyle(fontSize: 20,),),
                  ),
                  Center(
                    child: Text('BDT '+snapshot.data['price'].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                  ),
                  Center(
                    child: Text('Category :'+snapshot.data['category'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        ),
    );
  }
}