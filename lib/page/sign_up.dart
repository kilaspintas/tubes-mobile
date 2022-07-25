import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/auth_services.dart';

class signUpPage extends StatefulWidget {
  signUpPage({Key? key}) : super(key: key);

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();

//method signUp firebhase
  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("akun berhasil dibuat :)"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          reverse: true,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.png",
                  height: 100,
                  width: 500,
                  fit: BoxFit.fitWidth,
                ),

                //Image.asset("lib/assets/logo.png"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: username,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Username',
                      contentPadding: const EdgeInsets.all(10.0),
                      hintStyle: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Email',
                      contentPadding: const EdgeInsets.all(10.0),
                      hintStyle: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Password',
                      contentPadding: const EdgeInsets.all(10.0),
                      hintStyle: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                MaterialButton(
                    color: Colors.amber,
                    child: Text('Create'),
                    onPressed: () async {
                      if (username.text.isNotEmpty &&
                          password.text.isNotEmpty &&
                          email.text.isNotEmpty) {
                        signUp();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Semua input harus Diisi !!')));
                      }

                      /* if(usernameController.toString() == DummyData.data.map((data){"${data['username']}";}) ){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                        }else{
                          Navigator.push(context, MaterialPageRoute(builder: (context) => KosongPage()));
                        }
                */
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
