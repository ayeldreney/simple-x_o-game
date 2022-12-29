import 'package:flutter/material.dart';
import 'package:x_o/game_screen.dart';
import 'package:x_o/login.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData(
      textTheme: TextTheme(
        bodySmall: TextStyle(fontSize: 20, color: Colors.red),
        bodyLarge: TextStyle(
          fontSize: 24,
        ),
      ),
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: Login.routename,
    routes: {
      GameScreen.routename: (context) => GameScreen(),
      Login.routename: (context) => Login(),
    },
  ));
}
