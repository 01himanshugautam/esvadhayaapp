import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';

import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final Function(String) onChanged;
  InputBox({
    this.hintText,
    this.keyboardType,
    required this.onChanged,
  });

  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
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
        onChanged: widget.onChanged,
        cursorColor: Colors.white,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText ?? " Hint Text Here",
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
