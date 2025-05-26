import 'package:flutter/material.dart';
import 'package:note_keeper/model/note_model.dart';
import 'package:note_keeper/view_model/note_view_model.dart';
import 'package:provider/provider.dart';

class NoteDetailsView extends StatelessWidget {
  NoteDetailsView({super.key});

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Note Detail View"), centerTitle: true),
      body: Column(
        children: [
          SizedBox(height: 20),
          ListTile(
            title: DropdownButton(
              items:
                  noteProvider.priorityList.map((String dropDownItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownItem,
                      child: Text(dropDownItem),
                    );
                  }).toList(),
              iconEnabledColor: Colors.indigo,
              dropdownColor: Colors.white,
              iconSize: 30,
              value: noteProvider.priorityAsString(noteProvider.priority),
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              onChanged: (selectedPriority) {
                noteProvider.priorityAsInt(selectedPriority!);
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                label: Text("Title"),
                labelStyle: TextStyle(fontSize: 18, color: Colors.indigo),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.indigo, width: 4),
                ),
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
                labelStyle: TextStyle(fontSize: 18, color: Colors.indigo),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.indigo, width: 4),
                ),
              ),
              maxLines: 3,
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.indigo,
                    ),
                  ),
                  onPressed: () async {
                    NoteModel noteModel = NoteModel(
                      priority: noteProvider.priority,
                      title: _titleController.text.trim(),
                      description: _descriptionController.text.trim(),
                    );
                    // noteProvider.noteList.add(noteModel);
                   await noteProvider.insertData(noteModel);

                    Navigator.of(context).pop();
                    debugPrint("Data Saved");
                  },
                  child: Text("SAVE", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(width: 10),

              ///DELETE BUTTON
              Container(
                width: 150,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.indigo,
                    ),
                  ),
                  onPressed: () {
                    debugPrint("Data DELETED");
                  },
                  child: Text("DELETE", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
