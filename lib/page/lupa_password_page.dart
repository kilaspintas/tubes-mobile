import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class lupaPasswordPage extends StatefulWidget {
  lupaPasswordPage({Key? key}) : super(key: key);

  @override
  State<lupaPasswordPage> createState() => _lupaPasswordPageState();
}

class _lupaPasswordPageState extends State<lupaPasswordPage> {
  final TextEditingController email = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content:
                  Text("Password reset link sudah dikirim ke Email anda :)"),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lupa Password Page"),
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
                  child: Text(
                    "Masukkan Email anda dan nanti Kami akan mengirimkan link untuk reset Password",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
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
                MaterialButton(
                    color: Colors.amber,
                    child: Text('Reset Password'),
                    onPressed: () async {
                      passwordReset();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
