// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  var child;
  final void Function() onpress;
  AppButton({
    super.key,
    required this.child,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(
          blurRadius: 8,
          color: Color(0xfff148BCC),
          spreadRadius: 1.0
        )],
          borderRadius: BorderRadius.circular(12),
          gradient:
              LinearGradient(colors: [Color(0xfff148BCC), Color(0xfff283393)])),
      child: MaterialButton(
        onPressed: onpress,
        child: child,
        disabledColor: Colors.black,
        focusColor: Color(0xfff283393),
        splashColor: Color(0xfff148BCC),
        hoverColor: Color(0xfff148BCC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        height: 55.h,
        elevation: 15,
        minWidth: 310,
      ),
    );
  }
}
