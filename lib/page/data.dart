import 'package:flutter/material.dart';

class ThemeSettings{
  static bool darkMode = false;
}

class ReloadApp extends StatefulWidget {
  final Function(BuildContext context) builder;
  ReloadApp({required this.builder});
  @override
  State<ReloadApp> createState() => ReloadAppState();
  static ReloadAppState? of (BuildContext context){
    return context.findRootAncestorStateOfType();
  }
}

class ReloadAppState extends State<ReloadApp> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  void rebuild(){
    setState(() {

    });
  }


}
