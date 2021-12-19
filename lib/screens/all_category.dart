import 'package:flutter/material.dart';
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
            
          }
          return Center(child: CircularProgressIndicator());
        }
        ),
    );
  }
}