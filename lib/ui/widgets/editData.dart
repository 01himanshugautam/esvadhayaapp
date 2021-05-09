import 'dart:io';
import 'package:csv/csv.dart' as csv;
import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:esvadhayaapp/ui/widgets/Buttom.dart';
import 'package:esvadhayaapp/ui/widgets/inpurfield.dart';
import 'package:esvadhayaapp/ui/widgets/inputBox.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class EditData extends StatefulWidget {
  final List<dynamic> data;
  final String path;

  EditData({
    key,
    required this.data,
    required this.path,
  });

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late int _index;
  late int _rIndex;
  String? _id;
  String? _name;
  String? _pName;
  String? _phone;
  String? _class;
  String? _salary;

  @override
  void initState() {
    setState(() {
      File tFile = new File("${widget.path}");
      List<List<dynamic>> csv = csvToList(tFile);
      _index = csv.length;
      _index = _index + 1;
      _rIndex = widget.data[0];
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.data[1]}"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 1.5 * SizeConfig.heightMultiplier,
                vertical: 1 * SizeConfig.heightMultiplier),
            child: Column(
              children: [
                InputField(
                  hintText: "Enter Teacher Name",
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  inputValue: "${widget.data[1]}",
                ),
                SizedBox(height: 1 * SizeConfig.heightMultiplier),
                InputField(
                  hintText: "Enter Phone Number",
                  onChanged: (value) {
                    setState(() {
                      _phone = value;
                    });
                  },
                  inputValue: "${widget.data[2]}",
                ),
                SizedBox(height: 1 * SizeConfig.heightMultiplier),
                InputField(
                  hintText: "Enter Email",
                  onChanged: (value) {
                    setState(() {
                      _id = value;
                    });
                  },
                  inputValue: "${widget.data[3]}",
                ),
                SizedBox(height: 1 * SizeConfig.heightMultiplier),
                Button(
                  txt: "Save",
                  onPressed: () {
                    print("You Entered : $_name $_phone $_id");
                    // if (_name==null &&_name==null &&_name==null) {

                    // } else {
                    // }

                    File teacher = new File(widget.path);
                    List<List<dynamic>> csv = csvToList(teacher);
                    print(csv);
                    print(_index);
                    print(_rIndex);
                    csv.remove(csv[_rIndex]);
                    print(csv.remove(csv[_rIndex]));
                    String newCsv = listToCsv(csv);
                    print(newCsv);
                    saveCsvFile(newCsv, teacher);
                    teacher.writeAsStringSync(
                        "$_index, $_name, $_id, $_phone\r\n",
                        mode: APPEND);
                    print("Teacher Added");
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: 2 * SizeConfig.heightMultiplier),
            child: Container(
              child: Text("Class Distributed"),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2 * SizeConfig.heightMultiplier,
                ),
                child: Container(
                  width: 12 * SizeConfig.heightMultiplier,
                  height: 5 * SizeConfig.heightMultiplier,
                  child: InputBox(
                    hintText: "Enter Salary",
                    onChanged: (value) {
                      _salary = value;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 2 * SizeConfig.heightMultiplier),
                child: Container(
                  width: 12 * SizeConfig.heightMultiplier,
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
              ),
              MaterialButton(
                onPressed: () async {
                  print(widget.data);
                  print(_class);
                  print(_salary);
                  print("You Entered : $_name $_salary $_class");
                  final String directory =
                      (await getApplicationSupportDirectory()).path;
                  final sraffPath = "$directory/Staff.csv";
                  print("${sraffPath}");
                  File staffCsvFile = new File(sraffPath);
                  staffCsvFile.writeAsStringSync(
                      "$_index, $_name ,$_salary, $_class\r\n",
                      mode: APPEND);
                  print("Staff's File Created");

                  print(" Added");
                  Navigator.pop(context);
                },
                color: Colors.yellow,
                child: Text(
                  "Save",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<List> csvToList(File mycsvFile) {
    csv.CsvToListConverter c = new csv.CsvToListConverter(
        eol: "\r\n", fieldDelimiter: ",", shouldParseNumbers: true);
    List<List> listCreated = c.convert(mycsvFile.readAsStringSync());
    return listCreated;
  }

  saveCsvFile(String dataToSave, File myCsvFile) {
    myCsvFile.writeAsStringSync(dataToSave);
    print("File Saved");
  }

  String listToCsv(List<List<dynamic>?>? listToConvert) {
    csv.ListToCsvConverter c = new csv.ListToCsvConverter();
    String stringCreated = c.convert(listToConvert, fieldDelimiter: ',');
    return stringCreated;
  }
}
