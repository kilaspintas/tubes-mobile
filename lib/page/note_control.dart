// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ui_color_note/models/NotesOperation.dart';
// import 'package:ui_color_note/page/home_page.dart';

// class addPage extends StatefulWidget {
//   const addPage({Key? key}) : super(key: key);

//   @override
//   State<addPage> createState() => _addPageState();
// }

// class _addPageState extends State<addPage> {
//   late String Judul;
//   late String Deskripsi;

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0x00f1f1f1),
//           title: Text('Add'),
//         ),
//         body: Container(
//           margin: EdgeInsets.all(15),
//           padding: EdgeInsets.all(15),
//           height: 500,
//           decoration: BoxDecoration(
//               color: Colors.amber, borderRadius: BorderRadius.circular(15)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: 'Masukkan Judul',
//                   hintStyle: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//                 //controller: judulBaru,
//                 onChanged: (value) {
//                   Judul = value;
//                 },
//               ),
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     hintText: 'Masukkan Deskripsi',
//                     hintStyle: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.black,
//                   ),
//                   //controller: deskripsiBaru,
//                   onChanged: (value) {
//                     Deskripsi = value;
//                   },
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Provider.of<NotesOperation>(context, listen: false)
//                       .addNote(Judul, Deskripsi);
//                   Navigator.pop(context);
//                 },
//                 style: ButtonStyle(
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18.0),
//                       side: BorderSide(
//                         color: Colors.teal,
//                         width: 2.0,
//                       ),
//                     ),
//                   ),
//                 ),
//                 child: Text('Tambahkan',
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.greenAccent)),
//               ),
//             ],
//           ),
//         ),
//       );
// }

// class editPage extends StatefulWidget {
//   editPage({Key? key}) : super(key: key);

//   @override
//   State<editPage> createState() => _editPageState();
// }

// class _editPageState extends State<editPage> {
//   final TextEditingController judulBaru = TextEditingController();
//   final TextEditingController deskripsiBaru = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0x00f1f1f1),
//         title: Text('Edit'),
//       ),
//       body: Container(
//         margin: EdgeInsets.all(15),
//         padding: EdgeInsets.all(15),
//         height: 500,
//         decoration: BoxDecoration(
//             color: Colors.amber, borderRadius: BorderRadius.circular(15)),
//         child: Consumer<NotesOperation>(
//           builder: (context, NotesOperation data, child) => Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: 'Masukkan Judul',
//                   hintStyle: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//                 controller: judulBaru,
//               ),
//               Expanded(
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     hintText: 'Masukkan Deskripsi',
//                     hintStyle: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.black,
//                   ),
//                   controller: deskripsiBaru,
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   data.updateNote(
//                       data.selectedIndex!, judulBaru.text, deskripsiBaru.text);
//                   Navigator.pop(context);
//                 },
//                 style: ButtonStyle(
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18.0),
//                       side: BorderSide(
//                         color: Colors.teal,
//                         width: 2.0,
//                       ),
//                     ),
//                   ),
//                 ),
//                 child: Text('Ubah Data',
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.greenAccent)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
