import 'package:flutter/material.dart';
import 'package:flutterhttp/screens/product_detail.dart';
import 'package:flutterhttp/services/apiService.dart';

class CategoryProductScreen extends StatelessWidget {
  final String categoryName;

  CategoryProductScreen(this.categoryName);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.toUpperCase()),
      ),
      body: FutureBuilder(
        future: ApiService().getSingleProductByCategory(categoryName),
        builder: (contex,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return Center(
            
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (contex,index){
                return ListTile(
                  title: Text(snapshot.data[index]['title']),
                  leading: Image.network(snapshot.data[index]['image'],height: 50,width: 50,),
                  subtitle: Text("BDT "+snapshot.data[index]['price'].toString()),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (contex)=>ProductDetail(snapshot.data[index]['id'])));
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