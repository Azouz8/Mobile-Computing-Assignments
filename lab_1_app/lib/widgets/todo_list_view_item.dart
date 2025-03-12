import 'package:flutter/material.dart';

class ToDoListViewItem extends StatelessWidget {
  const ToDoListViewItem({
    super.key,
    required this.todo,
    required this.onChanged,
  });
  final String todo;
  final Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Color(0xff5b9ee1)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              todo,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Checkbox(value: false, onChanged: onChanged)
        ],
      ),
    );
  }
}
