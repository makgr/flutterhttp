import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutterhttp/models/product.dart';
import 'package:flutterhttp/screens/all_category.dart';
import 'package:flutterhttp/screens/cartScreen.dart';
import 'package:flutterhttp/screens/product_detail.dart';
import 'package:flutterhttp/services/apiService.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http App'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCategory()));
          },
           icon: Icon(Icons.view_list)),
           IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
          },
           icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: FutureBuilder(
        future: ApiService().getAllProduct(),
        builder: (contex, AsyncSnapshot snapshot){
          if(snapshot.hasData){
             return Center(
            //child: CircularProgressIndicator(),
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (contex,index){
                Product product = snapshot.data[index];
                return ListTile(
                  title: Text(product.title),
                  leading: Image.network(product.image,height: 50,width: 50,),
                  subtitle: Text("BDT "+product.price.toString()),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (contex)=>ProductDetail(product.id)));
                  },
                );
               }
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