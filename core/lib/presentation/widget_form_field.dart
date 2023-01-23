import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// isEmpty error if empty
class CustomTextFields extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextFields({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primaryColors),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Form Ini tidak boleh kosong*';
        }
      },
    );
  }
}
