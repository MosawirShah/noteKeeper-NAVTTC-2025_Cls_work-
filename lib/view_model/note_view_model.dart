import 'package:flutter/cupertino.dart';
import 'package:note_keeper/model/note_model.dart';
import 'package:note_keeper/services/db_helper.dart';

class NoteViewModel with ChangeNotifier{

  DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  bool _loading = false;
  bool get loading => _loading;

  String _errorText = "";
  String get errorText => _errorText;

  fetchData()async{
    try{
      _loading = true;
      _errorText = "";
      await _databaseHelper.fetchData();
      _loading = false;
      notifyListeners();
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
      await _databaseHelper.insertion(noteModel);
      _loading = false;
      notifyListeners();
    }catch(e){
      _errorText = e.toString();
      _loading = false;
      notifyListeners();
    }
  }
}