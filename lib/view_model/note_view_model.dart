import 'package:flutter/cupertino.dart';
import 'package:note_keeper/model/note_model.dart';
import 'package:note_keeper/services/db_helper.dart';

class NoteViewModel with ChangeNotifier{


NoteViewModel()
{ fetchData();
}

final _databaseHelper = DatabaseHelper.instance;

  List<String> priorityList = ['High','Low'];

  List<NoteModel> _noteList = [];
  List <NoteModel> get noteList => _noteList;

  bool _loading = false;
  bool get loading => _loading;

  String _errorText = "";
  String get errorText => _errorText;

  //Priority as a integer
  int _priority = 1;
  int get priority=> _priority;

void priorityAsInt(String value){
  switch(value){
    case 'High':
      _priority = 1;
    case 'Low':
      _priority = 2;
  }
  notifyListeners();
}

NoteModel? noteModel;

///Get Priority as String
  String priorityAsString(int value){
    String stringPriority;
    switch(value){
      case 1:
        stringPriority = 'High';
        return stringPriority;
      case 2:
        stringPriority = 'Low';
        return stringPriority;
      default:
        stringPriority = 'Low';
        return stringPriority;
    }

  }


  fetchData()async{
    try{
      _loading = true;
      _errorText = "";
      _noteList = await _databaseHelper.fetchData();
      _loading = false;

    }catch(e){
      _errorText = e.toString();
      _loading = false;
      notifyListeners();
    }
  }

  insertData(NoteModel noteModel)async{
    try{
      _loading = true;
      _errorText = "";
     _databaseHelper.insertion(noteModel);
      _loading = false;
      notifyListeners();
    }catch(e){
      _errorText = e.toString();
      _loading = false;
      notifyListeners();
    }
  }
}