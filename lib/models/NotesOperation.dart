import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NoteModel.dart';

class NotesOperation extends ChangeNotifier {
  int? selectedIndex;
  List<NoteModel> _notes = [];

  List<NoteModel> get listNotes {
    return _notes;
  }

  void addNote(NoteModel data) {
    _notes.add(data);
    notifyListeners();
  }

  void removeNote(NoteModel data) {
    _notes = _notes.where((item) => item.id != data.id).toList();
    notifyListeners();
  }

  void updateNote(NoteModel data) {
    _notes[_notes.indexWhere((item) => item.id == data.id)] = data;
    notifyListeners();
  }

  // void addNote(String id, String judul, String deskripsi) {
  //   NoteModel note = NoteModel(id,judul, deskripsi);
  //   _notes.add(note);
  //   notifyListeners();
  // }

  // void updateNote(int index, String judul, String deskripsi) {
  //   List<Note> listNoteTemp = [];
  //   for (var i = 0; i < _notes.length; i++) {
  //     if (i == index) {
  //       listNoteTemp.add(_notes[i]);
  //       continue;
  //     }
  //     listNoteTemp.add(_notes[i]);
  //   }
  //   _notes = listNoteTemp;
  //   notifyListeners();
  // }
}
