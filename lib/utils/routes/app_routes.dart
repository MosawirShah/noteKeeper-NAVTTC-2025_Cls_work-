import 'package:flutter/cupertino.dart';
import 'package:note_keeper/utils/routes/name_routes.dart';
import 'package:note_keeper/views/note_details_view.dart';
import 'package:note_keeper/views/note_view.dart';
import 'package:note_keeper/views/splash_view.dart';

class AppRoutes{

 static Map<String, Widget Function(BuildContext)> appRoutes(BuildContext context){
    return {
      RoutesName.splashView : (context) => SplashView(),
      RoutesName.noteView : (context) => NoteView(),
      RoutesName.noteDetailsView: (context) => NoteDetailsView(),
    };
  }
}