import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_keeper/model/note_model.dart';
import 'package:note_keeper/view_model/note_view_model.dart';
import 'package:provider/provider.dart';

class NoteDetailsView extends StatefulWidget {
  NoteDetailsView({super.key});

  @override
  State<NoteDetailsView> createState() => _NoteDetailsViewState();
}

class _NoteDetailsViewState extends State<NoteDetailsView> {
  final _titleController = TextEditingController();

  final _descriptionController = TextEditingController();


  late NoteDetailArgument args;
  late NoteViewModel noteProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize only once
    args = ModalRoute.of(context)!.settings.arguments as NoteDetailArgument;
    noteProvider = Provider.of<NoteViewModel>(context);

    if (args.appBarTitle == "Edit Note") {
      _titleController.text = args.noteModel!.title;
      _descriptionController.text = args.noteModel!.description;
      //noteProvider.priority = args.noteModel!.priority;
    }
  }

  @override
  Widget build(BuildContext context) {
    //
    // final noteProvider = Provider.of<NoteViewModel>(context);
    // final args = ModalRoute.of(context)!.settings.arguments as NoteDetailArgument;
    //
    // if(args.appBarTitle == "Edit Note"){
    //   _titleController.text = args.noteModel!.title;
    //   _descriptionController.text = args.noteModel!.description;
    // }
    return Scaffold(
      appBar: AppBar(title: Text(args.appBarTitle), centerTitle: true),
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
                    String time = DateFormat.yMMMd().format(DateTime.now());
                    if(args.appBarTitle == "Add Note"){
                      NoteModel noteModel = NoteModel(
                        priority: noteProvider.priority,
                        title: _titleController.text.trim(),
                        description: _descriptionController.text.trim(),
                        time: time
                      );
                      // noteProvider.noteList.add(noteModel);
                      await noteProvider.insertData(noteModel);
                      debugPrint("Data Saved");
                    }else if(args.appBarTitle == "Edit Note"){
                      String title = _titleController.text;
                      String description = _descriptionController.text;
                      NoteModel noteModel = NoteModel(
                        id: args.noteModel!.id,
                        //id: noteProvider.noteModel!.id,
                        ///ERROR REASON: I was used the (noteProvider.noteModel.id) which is null..
                        priority: noteProvider.priority,
                        title: title,
                        description: description,
                        time: time
                      );
                      // noteProvider.noteList.add(noteModel);
                      await noteProvider.updateNote(noteModel);
                      debugPrint("UPDATED");
                    }

                    Navigator.of(context).pop();

                  },
                  child: Text(args.buttonText, style: TextStyle(color: Colors.white)),
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
                    if(args.appBarTitle == "Edit Note"){
                      noteProvider.deleteNote(args.noteModel!.id!);
                      Navigator.of(context).pop();
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Note is not deleted")));
                    }
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
class NoteDetailArgument{
  String appBarTitle;
  NoteModel? noteModel;
  String buttonText;
  NoteDetailArgument({required this.appBarTitle,required this.buttonText, this.noteModel});
}
