import 'package:flutter/material.dart';

class kalenderPage extends StatelessWidget {
  const kalenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00f1f1f1),
        title: Text('Kalender'),
      ),
      body: Center(
          child: Text(
        'Kalender',
        style: TextStyle(fontSize: 60),
      )),
    );
  }
}
