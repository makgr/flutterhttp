import 'package:flutter/material.dart';
import 'package:flutterhttp/screens/category-product.dart';
import 'package:flutterhttp/services/apiService.dart';

class AllCategory extends StatelessWidget {
  const AllCategory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: FutureBuilder(
        future: ApiService().getAllProductCategory(),
        builder: (contex, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (contex,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryProductScreen(snapshot.data[index])));
                  },
                  child: Card(
                    elevation: 2,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      padding: EdgeInsets.all(40),
                      child: Center(
                        child: Text(snapshot.data[index].toString().toUpperCase(),style: TextStyle(fontSize: 25),),
                      ),
                    ),
                  ),
                );
               }
              );
          }
          return Center(child: CircularProgressIndicator());
        }
        ),
    );
  }
}