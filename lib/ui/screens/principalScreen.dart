import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:esvadhayaapp/ui/screens/addData.dart';
import 'package:esvadhayaapp/ui/screens/csv.dart';
import 'package:esvadhayaapp/ui/screens/loadCsv.dart';
import 'package:esvadhayaapp/ui/screens/loadCsvDataScreen.dart';
import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:esvadhayaapp/ui/widgets/Buttom.dart';
import 'package:esvadhayaapp/ui/widgets/editData.dart';
import 'package:esvadhayaapp/ui/widgets/staffDetails.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PrincipalScreen extends StatelessWidget {
  PrincipalScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Principal Screen"),
      ),
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    txt: " Teachers list",
                    height: 12 * SizeConfig.heightMultiplier,
                    width: 18 * SizeConfig.heightMultiplier,
                    fontSize: 2 * SizeConfig.heightMultiplier,
                    onPressed: () async {
                      print("Teachers list");
                      final String directory =
                          (await getApplicationSupportDirectory()).path;
                      final teachersPath = "$directory/Teacher.csv";
                      print("${teachersPath}");
                      File teacherCsvFile = new File(teachersPath);
                      print("${teacherCsvFile}");
                      if (await teacherCsvFile.exists()) {
                        print("Teachers File Exits");
                        print(teacherCsvFile);
                      } else {
                        print("Teachers File Not Exits");
                        createTeachersCsv(teacherCsvFile);
                        print("Teachers File Created");
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return LoadTeachersData(
                              title: "Teachers list",
                              path: teachersPath,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Button(
                    txt: " Students List",
                    height: 12 * SizeConfig.heightMultiplier,
                    width: 18 * SizeConfig.heightMultiplier,
                    fontSize: 2 * SizeConfig.heightMultiplier,
                    onPressed: () async {
                      print("Student's List");
                      final String directory =
                          (await getApplicationSupportDirectory()).path;
                      final studentsPath = "$directory/Student.csv";
                      print("${studentsPath}");
                      File studentsCsvFile = new File(studentsPath);
                      print("${studentsCsvFile}");
                      if (await studentsCsvFile.exists()) {
                        print("Students File Exits");
                        print(studentsCsvFile);
                      } else {
                        print("Students File Not Exits");
                        createStudentCsv(studentsCsvFile);
                        print("Students File Created");
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return LoadCsvDataScreen(
                              title: " Students List",
                              path: studentsPath,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    txt: "Staff Details",
                    height: 12 * SizeConfig.heightMultiplier,
                    width: 18 * SizeConfig.heightMultiplier,
                    fontSize: 2 * SizeConfig.heightMultiplier,
                    onPressed: () async {
                      print("Staff Details");

                      final String directory =
                          (await getApplicationSupportDirectory()).path;
                      final staffPath = "$directory/Staff.csv";
                      print("${staffPath}");
                      File staffCsvFile = new File(staffPath);
                      print("${staffCsvFile}");
                      if (await staffCsvFile.exists()) {
                        print("Staff File Exits");
                        print(staffCsvFile);
                      } else {
                        print("Staff File Not Exits");
                        createStaffCsv(staffCsvFile);
                        print("Staff File Created");
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StaffDetails(path: staffPath),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    txt: "Add Teachers",
                    height: 5 * SizeConfig.heightMultiplier,
                    width: 10 * SizeConfig.heightMultiplier,
                    onPressed: () async {
                      print("Add Teachers");
                      final String directory =
                          (await getApplicationSupportDirectory()).path;
                      final teachersPath = "$directory/Teacher.csv";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddData(
                                    path: teachersPath,
                                  )));
                    },
                  ),
                  Button(
                    txt: "Add Students and Parents",
                    height: 5 * SizeConfig.heightMultiplier,
                    width: 13 * SizeConfig.heightMultiplier,
                    onPressed: () async {
                      print("Add Students and Parents");
                      final String directory =
                          (await getApplicationSupportDirectory()).path;
                      final studentsPath = "$directory/Student.csv";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddData(
                                    path: studentsPath,
                                  )));
                    },
                  ),
                  Button(
                    txt: "csv file",
                    height: 5 * SizeConfig.heightMultiplier,
                    width: 13 * SizeConfig.heightMultiplier,
                    onPressed: () {
                      print("csv file");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CSVFile()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createStaffCsv(File myCSVFile) {
    int _index = 0;

    String _name = "NAME";
    String _salary = "Salary";
    String _class = "Class";

    myCSVFile.writeAsStringSync("$_index, $_name ,$_salary, $_class\r\n",
        mode: APPEND);
    print("Staff's File Created");
  }

  void createTeachersCsv(File myCSVFile) {
    int _index = 0;
    String _id = "Email Id";
    String _password = "Password";
    String _name = "NAME";
    String _phone = "PHONE NUMBER";

    myCSVFile.writeAsStringSync(
        "$_index, $_name, $_id, $_phone, $_password\r\n",
        mode: APPEND);
    print("Teacher's File Created");
  }

  void createStudentCsv(File myCSVFile) {
    int _index = 0;
    String _id = "Email Id";
    String _password = "Password";
    String _name = "NAME";
    String _class = "CLASS";
    String _pName = "PARENT'S NAME";
    String _phone = "PHONE NUMBER";

    myCSVFile.writeAsStringSync(
        "$_index, $_name, $_id, $_pName, $_phone, $_class, $_password\r\n",
        mode: APPEND);
    print("Student's File Created");
  }
}

class LoadTeachersData extends StatelessWidget {
  final String path;
  final String title;

  LoadTeachersData({
    required this.path,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: loadingCsvData(path),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              return snapshot.hasData
                  ? Column(
                      children: snapshot.data!
                          .map(
                            (data) => Padding(
                                padding: EdgeInsets.only(
                                  top: .5 * SizeConfig.heightMultiplier,
                                  bottom: 1 * SizeConfig.heightMultiplier,
                                  left: .5 * SizeConfig.heightMultiplier,
                                  right: .5 * SizeConfig.heightMultiplier,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      height: 3 * SizeConfig.heightMultiplier,
                                      width: 10 * SizeConfig.heightMultiplier,
                                      // color: Colors.black,
                                      child: Center(
                                        child: Text(
                                          data[1].toString(),
                                          style: TextStyle(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 3 * SizeConfig.heightMultiplier,
                                      width: 20 * SizeConfig.heightMultiplier,
                                      // color: Colors.black,
                                      child: Center(
                                        child: Text(
                                          data[2].toString(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 3 * SizeConfig.heightMultiplier,
                                      width: 8 * SizeConfig.heightMultiplier,
                                      // color: Colors.black,
                                      child: Center(
                                        child: Text(
                                          data[3].toString(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 3 * SizeConfig.heightMultiplier,
                                      width: 4 * SizeConfig.heightMultiplier,
                                      // color: Colors.black,
                                      child: Container(
                                        child: (data[2].toString() == "NAME")
                                            ? Center(
                                                child: Text(
                                                    "${data[2].toString()}"))
                                            : Center(
                                                child: IconButton(
                                                    onPressed: () async {
                                                      print("Edit");
                                                      final String directory =
                                                          (await getApplicationSupportDirectory())
                                                              .path;
                                                      final teachersPath =
                                                          "$directory/Teacher.csv";
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditData(
                                                            data: data,
                                                            path: teachersPath,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    icon: Icon(Icons.edit)),
                                              ),
                                      ),
                                    ),
                                  ],
                                )),
                          )
                          .toList(),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ],
      ),
    );
  }

  Future<List<List<dynamic>>> loadingCsvData(String path) async {
    final csvFile = new File(path).openRead();
    return await csvFile
        .transform(utf8.decoder)
        .transform(
          CsvToListConverter(),
        )
        .toList();
  }
}
