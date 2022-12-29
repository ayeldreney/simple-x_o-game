import 'package:flutter/material.dart';
import 'package:x_o/players_names.dart';

import 'game_btn.dart';

class GameScreen extends StatefulWidget {
  static const routename = "gameScreen";

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> board = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  int player1S = 0;
  int player2S = 0;

  @override
  Widget build(BuildContext context) {
    PLayerName args = ModalRoute.of(context)?.settings.arguments as PLayerName;

    return Scaffold(
      appBar: AppBar(
        title: const Text("X-O"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      args.name1,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      ("$player1S"),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      args.name2,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "$player2S",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBtn(
                  board[0],
                  0,
                  onClicked,
                ),
                GameBtn(
                  board[1],
                  1,
                  onClicked,
                ),
                GameBtn(
                  board[2],
                  2,
                  onClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBtn(
                  board[3],
                  3,
                  onClicked,
                ),
                GameBtn(
                  board[4],
                  4,
                  onClicked,
                ),
                GameBtn(
                  board[5],
                  5,
                  onClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBtn(
                  board[6],
                  6,
                  onClicked,
                ),
                GameBtn(
                  board[7],
                  7,
                  onClicked,
                ),
                GameBtn(
                  board[8],
                  8,
                  onClicked,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// 0 2 4 (x)
// 1 3 5 (o)

  int counter = 0;

  void onClicked(index) {
    if (!board[index].isEmpty) {
      return;
    }

    if (counter % 2 == 0) {
      board[index] = "X";
      checkwinner("X");
      counter++;
    } else {
      board[index] = "O";
      checkwinner("O");
      counter++;
    }
    setState(() {});
  }

  void initBoard() {
    board = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
  }

  void checkwinner(String symbol) {
    //row check

    for (int i = 0; i < 9; i += 3) {
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        if (symbol == "X") {
          player1S += 10;
          counter = -1;
          initBoard();
        } else {
          player2S += 10;
          counter = -1;
          initBoard();
        }
      }
    }
    //column check
    for (int i = 0; i < 3; i++) {
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        if (symbol == "X") {
          player1S += 10;

          initBoard();
          counter = -1;
        } else {
          player2S += 10;

          initBoard();
          counter = -1;
        }
      }

      if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
        {
          if (symbol == "X") {
            player1S += 10;
            initBoard();
            counter = -1;
          } else {
            player2S += 10;

            initBoard();
            counter = -1;
          }
        }
      }

      if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
        {
          if (symbol == "X") {
            player1S += 10;

            initBoard();
            counter = -1;
          } else {
            player2S += 10;

            initBoard();
            counter = -1;
          }
        }
      }

      if (counter == 8) {
        counter = -1;
        initBoard();
      }

      setState(() {});
    }
  }
}
