import 'package:flutter/material.dart';

class GameBtn extends StatelessWidget {
  String title;
  Function fun;
  int index;

  GameBtn(this.title, this.index, this.fun);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          fun(index);
        },
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}
