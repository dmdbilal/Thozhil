import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thozhil_flutter_app/screens/login_screen.dart';

void main() {  
  runApp(
    const MainApp()
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = GoogleFonts.dmSans();

    return const MaterialApp(
      home: LoginScreen()
    );
  }
}
