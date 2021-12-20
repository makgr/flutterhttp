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
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Image.network(snapshot.data['image'],height: 200, width: double.infinity,),
                    SizedBox(height: 30,),
                    Center(
                      child: Text('BDT '+snapshot.data['price'].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                    ),
                    
                    SizedBox(height: 10,),
                    Text(snapshot.data['title'],style: TextStyle(
                      fontSize: 25,
                    ),),
                    Chip(
                      label: Text(snapshot.data['category'].toString(),style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),),
                      backgroundColor: Colors.blueGrey,
                      ),
                      SizedBox(height: 30,),
                      Text(snapshot.data['description']),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){

          },
          child: Icon(Icons.shopping_cart),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}