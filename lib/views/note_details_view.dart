import 'package:flutter/material.dart';

class NoteDetailsView extends StatelessWidget {
   NoteDetailsView({super.key});

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Detail View"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                label: Text("Title"),
                labelStyle: TextStyle(fontSize:18,color: Colors.indigo),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                      color: Colors.indigo,
                      width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: Colors.indigo,
                    width: 4
                  ),
                )
              ),
            ),
          ),

          //DESC
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                  label: Text("Description"),
                  labelStyle: TextStyle(fontSize:18,color: Colors.indigo),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.indigo,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 4
                    ),
                  )
              ),
            ),
          ),
          SizedBox(height: 40,),
          Container(
            width: 150,
            height: 45,

            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(Colors.indigo),
              ),
                onPressed: (){
               Note note = Note(title: _titleController.text, description: _descriptionController.text);
                Navigator.of(context).pop(note);
              debugPrint("Data Saved");
            },
                child: Text("Save",style: TextStyle(color: Colors.white),)),
          ),
        ],
      ),
    );
  }
}

class Note{
  String title;
  String description;

  Note({required this.title, required this.description});
}