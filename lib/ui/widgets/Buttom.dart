import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class Button extends StatelessWidget {
  final double? height;
  final double? width;
  final Function() onPressed;
  final String txt;
  final Color? color;
  final Color? txtColor;
  final double? fontSize;
  Button({
    this.height,
    this.width,
    required this.onPressed,
    required this.txt,
    this.color,
    this.txtColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 5 * SizeConfig.heightMultiplier,
        width: width ?? 8 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
            color: color ?? Colors.black,
            borderRadius:
                BorderRadius.circular(1 * SizeConfig.heightMultiplier)),
        child: Center(
          child: Text(
            txt,
            textAlign: TextAlign.center,
            // maxLines: 1,
            style: TextStyle(
              color: txtColor ?? Colors.white,
              fontSize: fontSize ?? 1.4 * SizeConfig.heightMultiplier,
            ),
          ),
        ),
      ),
    );
  }
}
