import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String? Errormsg;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.Errormsg,
    this.isPassword = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,

      validator: validator,
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        // hintText: hint,
        fillColor: Colors.white,
        filled: true,
        errorText: Errormsg,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
