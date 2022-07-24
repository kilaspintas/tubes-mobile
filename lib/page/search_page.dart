import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00f1f1f1),
        title: Text('Search'),
      ),
      body:Center(child: Text('Search',
        style: TextStyle(fontSize: 60),
      )),
  ) ;

}