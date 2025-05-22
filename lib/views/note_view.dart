import 'package:flutter/material.dart';
import 'package:note_keeper/utils/routes/name_routes.dart';
import 'package:note_keeper/views/note_details_view.dart';

class NoteView extends StatefulWidget {
  NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
 // List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Note View"), centerTitle: true),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: FloatingActionButton(
          backgroundColor: Colors.indigo,
          child: Icon(Icons.add, color: Colors.white),
          onPressed: ()  {
            Navigator.of(
              context,
            ).pushNamed(RoutesName.noteDetailsView);

            setState(() {
             // notes.add(note);
            });
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 2     ,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.indigo),
              title: Text(''),
              subtitle: Text(''),
            ),
          );
        },
      ),
    );
  }
}
