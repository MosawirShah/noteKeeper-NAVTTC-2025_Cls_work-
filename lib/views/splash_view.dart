import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_keeper/utils/routes/name_routes.dart';

class SplashView extends StatefulWidget {
  SplashView({super.key});


  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    // TODO: implement initState
    delayedView();
    super.initState();
  }

  delayedView(){
    Future.delayed(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacementNamed(RoutesName.noteView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome to NoteKeeper",style: GoogleFonts.dancingScript(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.indigo
        ),),
      ),

    );
  }
}
