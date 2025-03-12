import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
    required this.prefixIcon,
    this.obsecureText,
    this.onChanged,
    this.onSubmit,
    this.type,
    this.enabled,
    this.suffixIcon,
  });

  final Icon prefixIcon;
  final IconButton? suffixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSubmit;
  final String label;
  final TextEditingController controller;
  final bool? obsecureText;
  final TextInputType? type;
  final bool? enabled;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      validator: validator,
      onFieldSubmitted: onSubmit,
      obscureText: obsecureText ?? false,
      keyboardType: type,
      enabled: enabled,
      style: const TextStyle(
        fontSize: 12,
      ),
      decoration: InputDecoration(
        prefixIconColor: Color(0xff5b9ee1),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: customOutlineInputBorder(),
        border: customOutlineInputBorder(),
        focusedBorder: customFocustOutlineInputBorder(),
        hintText: label,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    );
  }

  OutlineInputBorder customFocustOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff5b9ee1)),
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    );
  }
}
