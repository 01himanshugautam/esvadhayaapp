import 'dart:io';
import 'package:esvadhayaapp/ui/screens/parentsSccreen.dart';
import 'package:esvadhayaapp/ui/screens/principalScreen.dart';
import 'package:esvadhayaapp/ui/screens/studentScreen.dart';
import 'package:esvadhayaapp/ui/screens/teachersScreen.dart';
import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:esvadhayaapp/ui/widgets/Buttom.dart';
import 'package:esvadhayaapp/ui/widgets/inputBox.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2 * SizeConfig.heightMultiplier,
            vertical: 2 * SizeConfig.heightMultiplier,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputBox(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
              ),
              SizedBox(height: 1 * SizeConfig.heightMultiplier),
              InputBox(
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {},
              ),
              SizedBox(height: 2 * SizeConfig.heightMultiplier),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 2 * SizeConfig.heightMultiplier),
                child: DropdownButton<String>(
                  value: _chosenValue,
                  elevation: 5,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  disabledHint: Text("data"),
                  hint: Text(
                    "Please Select",
                  ),
                  isExpanded: true,
                  items: <String>[
                    'Principal',
                    'Teacher',
                    'Student',
                    'Parents',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _chosenValue = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 1 * SizeConfig.heightMultiplier),
              Button(
                txt: "Submit",
                height: 5 * SizeConfig.heightMultiplier,
                width: 10 * SizeConfig.heightMultiplier,
                onPressed: () {
                  print(_chosenValue);
                  if (_chosenValue == "Principal") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrincipalScreen()));
                  } else if (_chosenValue == "Teacher") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeachersScreen()));
                  } else if (_chosenValue == "Student") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentsScreen()));
                  } else if (_chosenValue == "Parents") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ParentsScreen()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _createFolder() async {
  //   final folderName = "esvadhayaapp";
  //   final path = Directory("/storage/emulated/0/$folderName");
  //   if (await path.exists()) {
  //     print("exist");
  //   } else {
  //     print("not exist");
  //     path.create();
  //     print(path.create());
  //     print(path);
  //     print("File Created");
  //   }
  // }
}
