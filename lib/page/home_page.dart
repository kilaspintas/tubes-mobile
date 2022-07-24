import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_color_note/models/NotesOperation.dart';
import 'package:http/http.dart' as http;
import '../models/add_edit_note_widget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    const String apiUrl = 'http://10.0.2.2:8000/api/notes';

    Future<List<dynamic>> _fetchDataUsers() async{
      var hasil = await http.get(Uri.parse(apiUrl));
      return json.decode(hasil.body)['data'];
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00f1f1f1),
        title: Text(
          'NotesKu',
          style: TextStyle(
            color: Colors.amber,
            fontStyle: FontStyle.italic,
            fontSize: 25,
          ),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _fetchDataUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext contect, int index){
                return Dismissible(
                  key: Key(snapshot.data[index]['id'].toString()),
                  background: Container(
                    color: Colors.red.shade300,
                    child: const Center(
                      child: Text(
                        "Hapus ?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  child: Card(
                    child: Column(
                      children: [
                        snapshot.data[index]['email'] == user.email ?
                        ListTile(
                          title:  Text(snapshot.data[index]['judul'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                          subtitle: Text(snapshot.data[index]['deskripsi'],
                            style: const TextStyle(
                              fontSize: 16,
                            ),),
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AddEditNoteWidget(
                                    title: "Edit Data",
                                    id : snapshot.data[index]['id'].toString(),
                                  );
                                });
                          },
                        )
                        : Container( ),
                      ],
                    ),
                  ),
                  onDismissed: (direction){
                    String idnya = snapshot.data[index]['id'].toString();
                    String url = 'http://10.0.2.2:8000/api/notes/delete/$idnya';
                    Future _fetchDataUsers() async{
                      var hasil = await http.get(Uri.parse(url));
                      return json.decode(hasil.body)['message'];
                    }
                    _fetchDataUsers();

                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(236, 243, 171, 5),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const AddEditNoteWidget(
                  title: "Tambah Note");
              });

          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => addPage()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

// class NotesCard extends StatelessWidget {
//   final NoteModel note;

//   NotesCard(this.note);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(15),
//       padding: EdgeInsets.all(15),
//       height: 150,
//       decoration: BoxDecoration(
//           color: Colors.amber, borderRadius: BorderRadius.circular(15)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             note.judul,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Text(note.deskripsi, style: TextStyle(fontSize: 15))
//         ],
//       ),
//     );
//   }
// }
