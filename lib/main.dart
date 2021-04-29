import 'package:flutter/material.dart';
import 'package:p_paycsv/csv/allcsv.dart';
import 'package:p_paycsv/screens/export.dart';
import 'package:p_paycsv/screens/home_screen.dart';
import 'package:p_paycsv/screens/splashscreen.dart';

import 'screens/add_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "splash",
      routes: {
        "splash": (context) => Splash(),
        "home": (context) => MyHome(),
        "add_form": (context) => Add(),
        "export": (context) => Export(),
        "allcsv": (context) => AllCsvFilesScreen(),
      },
    );
  }
}
