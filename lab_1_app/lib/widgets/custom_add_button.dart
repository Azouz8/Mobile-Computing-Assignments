import 'package:flutter/material.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({
    super.key,
    required this.formKey, this.onPressed,
  });

  final GlobalKey<FormState> formKey;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 14)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(const Color(0xff5b9ee1)),
      ),
      child: Text(
        "Add",
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
      ),
    );
  }
}
