import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:ui_color_note/models/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_color_note/page/data.dart';

import '../firebase/googleSetup.dart';
import '../main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _switch = false;

// memanggil data user firebase
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    _switch = ThemeSettings.darkMode;
  }

  Future<String?> data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('id_login');
    return data;
  }

  Future<String?> dataNim() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dataNim = prefs.getString('nim');
    return dataNim;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0x00f1f1f1),
          title: Text('Profile'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () async {
                  //_logout();
                  //AuthServices service = AuthServices(FirebaseAuth.instance);
                  FirebaseAuth.instance.signOut();
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                }),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome'),
            SizedBox(
              height: 20,
            ),

            Text(user.email!),
            // data dari dummy data.dart
            // FutureBuilder(
            //   future: data(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Text(snapshot.data.toString(),
            //           style: TextStyle(
            //             fontFamily: 'GilroyBold',
            //             fontSize: 14,
            //             fontWeight: FontWeight.bold,
            //           ));
            //     } else if (data() == null) {
            //       return Text("");
            //     } else {
            //       return Text('Tidak ada nama',
            //           style: TextStyle(
            //             fontFamily: 'GilroyBold',
            //             fontSize: 14,
            //             fontWeight: FontWeight.bold,
            //           ));
            //     }
            //   },
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // FutureBuilder(
            //   future: dataNim(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Text(snapshot.data.toString(),
            //           style: TextStyle(
            //             fontFamily: 'GilroyBold',
            //             fontSize: 14,
            //             fontWeight: FontWeight.bold,
            //           ));
            //     } else {
            //       return Text('Tidak ada nim',
            //           style: TextStyle(
            //             fontFamily: 'GilroyBold',
            //             fontSize: 14,
            //             fontWeight: FontWeight.bold,
            //           ));
            //     }
            //   },
            // ),
            SizedBox(
              height: 20,
            ),
            Text('Pilih Tema'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Light'),
                Switch(value: _switch, onChanged: _onChange),
                Text('Dark'),
              ],
            )
          ],
        ));
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isUser');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  void _onChange(bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _switch = !_switch;
      ThemeSettings.darkMode = _switch;
    });
    prefs.setBool('darkMode', _switch);
    ReloadApp.of(context)?.rebuild();
    print(prefs.getBool('darkMode'));
  }
}
