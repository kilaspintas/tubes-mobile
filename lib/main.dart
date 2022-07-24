import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_color_note/firebase/googleSetup.dart';
import 'package:ui_color_note/page/data.dart';
import 'package:ui_color_note/page/login_page.dart';
import 'package:ui_color_note/page/main_page.dart';
import 'firebase_options.dart';
import 'models/NotesOperation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/notification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeNotifications();

  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUser = false;

  @override
  void initState() {
    // mendengarkan notifikasi

    // FirebaseMessaging.onMessage.listen((event) {
    //   if (event.notification != null) {
    //     //ada notifikasi masuk
    //     print(event.notification!.title);
    //   }
    // });

    super.initState();
    initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotesOperation(),
        )
      ],
      child: ReloadApp(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              brightness:
                  ThemeSettings.darkMode ? Brightness.dark : Brightness.light),
          title: 'Praktikum Mobile',
          home: //Splash(isUser)
              SplashFirebase(),
        ),
      ),
    );
  }

  void initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isUser') != null) {
      setState(() {
        isUser = prefs.getBool('isUser')!;
      });
    }

    if (prefs.getBool('darkMode') != null) {
      setState(() {
        ThemeSettings.darkMode = prefs.getBool('darkMode')!;
      });
    }
    print('first load app theme = ${ThemeSettings.darkMode}');
  }
}

class SplashFirebase extends StatefulWidget {
  @override
  State<SplashFirebase> createState() => _SplashFirebaseState();
}

class _SplashFirebaseState extends State<SplashFirebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainPage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}

//using dummy_data login

// class Splash extends StatefulWidget {
//   final bool isUser;
//   Splash(this.isUser);

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 1), () {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (context) => widget.isUser ? MainPage() : LoginPage()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Loading...'),
//       ),
//     );
//   }
// }
