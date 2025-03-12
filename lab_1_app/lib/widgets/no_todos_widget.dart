import 'package:flutter/material.dart';

class NoTodosWidget extends StatelessWidget {
  const NoTodosWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            bottom:
                MediaQuery.sizeOf(context).height * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu, size: 100, color: Colors.grey),
            Text(
              "No ToDos Yet!",
              style: TextStyle(
                  fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      );
  }
}