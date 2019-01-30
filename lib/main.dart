import 'package:flutter/material.dart';

import './Pages/Auth.dart';
import './Pages/Products_Admin.dart';
// here you build the main function that run your app by using the calss that you made with the widget that you need
// you can use this syntax to make a function void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: AuthPage(),
      routes: {
        '/admin' : (BuildContext context) => ProductsAdmin(),
      },
    );
  }
}

    