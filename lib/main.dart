import 'package:flutter/material.dart';
import './auth.dart';
import './home.dart';
import './productadmin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: AuthPage(),
      routes: {
        '/home': (BuildContext context) => HomePage(),
        '/admin': (BuildContext context) => ProductsAdmin()
      },
    ); // Core Route Widget
  }
}
