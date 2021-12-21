import 'package:flutter/material.dart';
import 'package:flutterhttp/screens/home.dart';
import 'package:flutterhttp/services/apiService.dart';

class LoginScreen extends StatelessWidget {

  TextEditingController nameController = TextEditingController(text: 'mor_2314');
  TextEditingController passwordController = TextEditingController(text: '83r5^_');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                hintText: 'Enter Username',
              ),
            ),
            SizedBox(height: 30,),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                hintText: 'Enter Password',
              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: ()async {
                  final getToken = await ApiService().userLogin(nameController.text, passwordController.text);
                   if(getToken != null){
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Success')));
                     Future.delayed(Duration(seconds: 2),(){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                     });
                   }else{
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Opps.Something wrong.')));
                   }
                }, 
                child: Text('Login'),
                ),
            ),
          ],
        ),
      ),
    );
  }
}