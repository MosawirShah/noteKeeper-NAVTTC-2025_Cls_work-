import 'package:flutter/material.dart';
import 'package:note_keeper/utils/routes/name_routes.dart';
import 'package:note_keeper/view_model/note_view_model.dart';
import 'package:note_keeper/views/note_details_view.dart';
import 'package:provider/provider.dart';

class NoteView extends StatefulWidget {
  NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {


  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Note View"), centerTitle: true),
      body: noteProvider.loading ? Center(child: CircularProgressIndicator(),):
      noteProvider.errorText != null ? Center(child: Text("ERROR: ${noteProvider.errorText}")):ListView.builder(
        itemCount: noteProvider.noteList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(backgroundColor: noteProvider.noteList[index].priority == 1 ? Colors.red: Colors.amber,child: Icon(noteProvider.noteList[index].priority == 1 ? Icons.play_arrow: Icons.keyboard_arrow_right),),
              title: Text(noteProvider.noteList[index].title),
              subtitle: Text(""),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.indigo,size: 30,)),
            ),
          );
        },
      ),
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
    );
  }
}
