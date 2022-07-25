import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_color_note/models/dummy_data.dart';
import 'package:ui_color_note/page/lupa_password_page.dart';
import 'package:ui_color_note/page/sign_up.dart';
import '../firebase/googleSetup.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String infoText = '';

  // text controller
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  bool isLoading = false;

  saveToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username.text);
  }

  getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    DummyData.data = prefs.getString('username') as List<Map<String, dynamic>>;
    setState(() {});
  }

  validasiUserInput(String input) {
    if (!DummyData.data.map((data) {
      "${data['username']}";
    }).contains(username.text)) {
      setState(() {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => KosongPage()));
        //infoText = 'Does not match data';
      });
    } else {
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
        //infoText = 'Welcome from $input';
      });
    }
  }

//login firebase_auth
  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Login berhasil :)"),
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
        backgroundColor: Colors.amber,
        title: Text(
          'Sign In',
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          reverse: true,
          child: Center(
            child: isLoading
                ? Center(
                    child: Text('Sabar bos ...'),
                  )
                : Column(
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
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
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
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
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
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      MaterialButton(
                          color: Colors.amber,
                          child: Text('Login'),
                          onPressed: () async {
                            if (password.text.isNotEmpty &&
                                email.text.isNotEmpty) {
                              signIn();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Semua input harus Diisi !!')));
                            }
                          }),

                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Do you not have an Accaount ?",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => signUpPage()));
                              });
                            },
                            child: Text(
                              "Create an Account",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: GestureDetector(
                            onTap: () async {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
                              provider.googleLogin();
                            },
                            child: Text(
                              "or click here to signup with google account !",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            lupaPasswordPage()));
                              });
                            },
                            child: Text(
                              "Forgot Password ? Click Here!",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  // void _login() async {
  //   if (username.text.isNotEmpty && password.text.isNotEmpty) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     //SharedPreferences
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setBool('isUser', true);
  //     Future.delayed(Duration(seconds: 2), () {
  //       if (username.text == 'rysalb' && password.text == '12345') {
  //         ScaffoldMessenger.of(context)
  //             .showSnackBar(SnackBar(content: Text('yok masuk')));
  //         Navigator.pushReplacement(
  //             context, MaterialPageRoute(builder: (context) => MainPage()));
  //       } else {
  //         ScaffoldMessenger.of(context)
  //             .showSnackBar(SnackBar(content: Text('Gak Cocok')));
  //         Navigator.pushReplacement(
  //             context, MaterialPageRoute(builder: (context) => LoginPage()));
  //       }
  //     });
  //   }
  // }

// login menggunakan dummy_data.dart

  // void getDataUser() async {
  //   if (username.text.isNotEmpty && password.text.isNotEmpty) {
  //     // sharedPreferences
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setBool('isUser', true);
  //     final List<dynamic> raw = jsonDecode(jsonEncode(DummyData.data));
  //     for (dynamic raw in raw) {
  //       prefs.setStringList(raw["id"].toString(), <String>[
  //         raw['username'],
  //         raw['password'],
  //         raw['nama'],
  //         raw['Nim']
  //       ]);
  //     }
  //     for (int i = 1; i < 16; i++) {
  //       final List<String>? data = prefs.getStringList(i.toString());
  //       Future.delayed(const Duration(seconds: 2), () async {
  //         if (username.text == data![0] && password.text == data[1]) {
  //           setState(() {
  //             isLoading = true;
  //           });
  //           Navigator.pushReplacement(
  //               context, MaterialPageRoute(builder: (context) => MainPage()));
  //           await prefs.setString('id_login', data[2]);
  //           await prefs.setString('nim', data[3]);
  //         } else {
  //           print(null);
  //         }
  //       });
  //     }
  //   }
  // }
}

class landscape extends StatefulWidget {
  landscape({Key? key}) : super(key: key);

  @override
  State<landscape> createState() => _landscapeState();
}

class _landscapeState extends State<landscape> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
