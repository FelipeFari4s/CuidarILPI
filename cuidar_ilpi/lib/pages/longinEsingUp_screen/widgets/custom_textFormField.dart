import 'package:flutter/material.dart';

class customTextFormFeild extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final VoidCallback? onTap;

  customTextFormFeild({
    required this.icon,
    required this.hint,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onTap: onTap,
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 201, 250, 204),
          filled: true,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black),
          prefixIcon: Icon(
            icon,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(40),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
