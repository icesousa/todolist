import 'package:flutter/material.dart';
import 'package:todolist/pages/loginpage/login.dart';
import 'package:todolist/pages/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: LoginPage(),
    );
  }
}
