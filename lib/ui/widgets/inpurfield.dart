import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final Function(String) onChanged;
  final String? inputValue;
  InputField({
    this.hintText,
    this.keyboardType,
    required this.onChanged,
    this.inputValue,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String? value;
  var val = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      val.text = "${widget.inputValue}";
    });
  }

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
        controller: val,
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
