import 'package:flutter/material.dart';

class RoundedInput extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onSubmit;

  const RoundedInput({
    Key? key,
    required this.hintText,
    this.controller,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      onSubmitted: onSubmit,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        hintText: hintText,
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      controller: controller,
    );
  }
}
