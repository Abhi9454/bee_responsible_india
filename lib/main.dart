import 'package:beeresponsibleindia/views/LoginPage/login_page_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bee Responsible India',
      debugShowCheckedModeBanner: false,
      home: LoginPageWidget(),
    );
  }
}
