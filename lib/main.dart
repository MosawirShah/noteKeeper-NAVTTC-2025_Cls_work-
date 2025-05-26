import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_keeper/utils/routes/app_routes.dart';
import 'package:note_keeper/utils/routes/name_routes.dart';
import 'package:note_keeper/view_model/note_view_model.dart';
import 'package:note_keeper/views/splash_view.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(NoteKeeperApp());
}

class NoteKeeperApp extends StatelessWidget {
  const NoteKeeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> NoteViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            titleTextStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
        ),
        initialRoute: RoutesName.splashView,
        routes: AppRoutes.appRoutes(context),
      ),
    );
  }
}
