import 'dart:io';
import 'dart:math';
import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:esvadhayaapp/ui/widgets/Buttom.dart';
import 'package:esvadhayaapp/ui/widgets/inputBox.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart' as csv;

class AddData extends StatefulWidget {
  final String path;

  AddData({
    Key,
    required this.path,
  });

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  int _index = 1;
  String? _id;
  String? _name;
  String? _pName;
  String? _phone;
  String? _class;
  @override
  void initState() {
    setState(() {
      File tFile = new File("${widget.path}");
      List<List<dynamic>> csv = csvToList(tFile);
      _index = csv.length;
      _index = _index + 1;
    });

    super.initState();
  }

  List<List> csvToList(File mycsvFile) {
    csv.CsvToListConverter c = new csv.CsvToListConverter(
        eol: "\r\n", fieldDelimiter: ",", shouldParseNumbers: true);
    List<List> listCreated = c.convert(mycsvFile.readAsStringSync());
    return listCreated;
  }

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
          child: (widget.path ==
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
                        print("You Entered : $_index $_name $_phone $_id");
                        File teacher = new File(widget.path);
                        teacher.writeAsStringSync(
                            "$_index ,$_name, $_id, $_phone\r\n",
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
                      hintText: "Enter Student Email",
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
                      hintText: "Enter Parent's Phone Number",
                      onChanged: (value) {
                        _phone = value;
                      },
                    ),
                    SizedBox(height: 1 * SizeConfig.heightMultiplier),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2 * SizeConfig.heightMultiplier),
                      child: DropdownButton<String>(
                        value: _class,
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
                          'Class A',
                          'Class B',
                          'Class C',
                          'Class D',
                          'Class E',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _class = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 1 * SizeConfig.heightMultiplier),
                    Button(
                      txt: "Save",
                      onPressed: () {
                        print(
                            "You Entered : $_index $_name $_id $_phone $_pName $_class");
                        File student = new File(widget.path);
                        student.writeAsStringSync(
                            "$_index, $_name, $_id, $_pName, $_phone, $_class\r\n",
                            mode: APPEND);
                        print("Student Added");
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
