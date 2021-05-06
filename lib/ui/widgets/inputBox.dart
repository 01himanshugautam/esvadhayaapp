import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';

import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final Function(String) onChanged;
  InputBox({
    this.hintText,
    this.keyboardType,
    required this.onChanged,
  });
  String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.055,
      padding: EdgeInsets.only(left: 1.5 * SizeConfig.heightMultiplier),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      // width: 100,
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.white,
        keyboardType: keyboardType ?? TextInputType.text,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: hintText ?? " Hint Text Here",
          fillColor: Colors.white,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
