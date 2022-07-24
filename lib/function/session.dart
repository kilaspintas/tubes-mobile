import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_color_note/page/home_page.dart';
import 'package:ui_color_note/page/login_page.dart';

class Navigasi extends StatelessWidget {
  const Navigasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          } else if(snapshot.hasData) {
             return HomePage();
          } else if(snapshot.hasError){
            return Center(child: Text("Jang jang error"));
          }else {
            return LoginPage();
          }

        },
      ),
    );
  }
}
