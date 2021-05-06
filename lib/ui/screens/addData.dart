import 'dart:io';
import 'dart:math';
import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:esvadhayaapp/ui/widgets/Buttom.dart';
import 'package:esvadhayaapp/ui/widgets/inputBox.dart';
import 'package:flutter/material.dart';

class AddData extends StatelessWidget {
  final String path;

  AddData({
    Key,
    required this.path,
  });
  String? _id;
  String? _name;
  String? _pName;
  String? _phone;
  String? _salary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: 1 * SizeConfig.heightMultiplier,
            right: 1 * SizeConfig.heightMultiplier,
            top: 2 * SizeConfig.heightMultiplier,
          ),
          child: (path !=
                  "/data/user/0/com.example.esvadhayaapp/files/Teacher.csv")
              ? Column(
                  children: [
                    InputBox(
                      hintText: "Enter Teacher Name",
                      onChanged: (value) {
                        _name = value;
                      },
                    ),
                    SizedBox(height: 1 * SizeConfig.heightMultiplier),
                    InputBox(
                      hintText: "Enter Phone Number",
                      onChanged: (value) {
                        _phone = value;
                      },
                    ),
                    SizedBox(height: 1 * SizeConfig.heightMultiplier),
                    InputBox(
                      hintText: "Enter Email",
                      onChanged: (value) {
                        _id = value;
                      },
                    ),
                    SizedBox(height: 1 * SizeConfig.heightMultiplier),
                    Button(
                      txt: "Save",
                      onPressed: () {
                        print("You Entered : $_name $_phone $_salary");
                        File teacher = new File(path);
                        teacher.writeAsStringSync(
                            "${_name},${_id},${_phone}\r\n",
                            mode: APPEND);
                        print("Teacher Added");
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              : Column(
                  children: [
                    InputBox(
                      hintText: "Enter Student Name",
                      onChanged: (value) {
                        _name = value;
                      },
                    ),
                    SizedBox(height: 1 * SizeConfig.heightMultiplier),
                    InputBox(
                      hintText: "Enter Email ",
                      onChanged: (value) {
                        _id = value;
                      },
                    ),
                    SizedBox(height: 1 * SizeConfig.heightMultiplier),
                    InputBox(
                      hintText: "Student Parent's Name",
                      onChanged: (value) {
                        _pName = value;
                      },
                    ),
                    SizedBox(height: 1 * SizeConfig.heightMultiplier),
                    InputBox(
                      hintText: "Enter Parents Phone Number",
                      onChanged: (value) {
                        _phone = value;
                      },
                    ),
                    SizedBox(height: 1 * SizeConfig.heightMultiplier),
                    Button(
                      txt: "Save",
                      onPressed: () {
                        print("You Entered : $_name $_phone $_salary");
                        File student = new File(path);
                        student.writeAsStringSync(
                            "${_name},${_id},${_pName},${_phone}\r\n",
                            mode: APPEND);
                        print("Teacher Added");
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
