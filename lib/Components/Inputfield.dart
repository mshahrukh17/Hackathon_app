// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  var prefixicon;
  var suffixicon;
  TextEditingController controller;
  String hinttext;
  Inputfield(
      {super.key,
      required this.controller,
      required this.hinttext,
      this.prefixicon,
      this.suffixicon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Color(0xfff283393),
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixicon,
        prefixIcon: prefixicon,
        hintText: hinttext,
        fillColor: Colors.grey.shade200,
        filled: true,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Color(0xfff283393),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
           borderSide: BorderSide(
            color: Color(0xfff283393),
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
           borderSide: BorderSide(
            color: Color(0xfff283393),
            width: 2,
          ),
        ),
      ),
    );
  }
}
