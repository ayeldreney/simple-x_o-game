import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:x_o/game_screen.dart';
import 'package:x_o/players_names.dart';

class Login extends StatelessWidget {
  static const String routename = "login";
  late String p1;
  late String p2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "PLayer 1 name"),
            onChanged: (value) => p1 = value,
          ),
          TextField(
            decoration: InputDecoration(hintText: "PLayer 2 name"),
            onChanged: (value) => p2 = value,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, GameScreen.routename,
                  arguments: PLayerName(p1, p2));
            },
            child: Text("Enter"),
          ),
        ],
      ),
    );
  }
}
