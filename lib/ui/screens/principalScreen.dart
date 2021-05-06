import 'dart:io';
import 'package:csv/csv.dart';
import 'package:esvadhayaapp/ui/screens/addData.dart';
import 'package:esvadhayaapp/ui/screens/csv.dart';
import 'package:esvadhayaapp/ui/screens/loadCsv.dart';
import 'package:esvadhayaapp/ui/screens/loadCsvDataScreen.dart';
import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:esvadhayaapp/ui/widgets/Buttom.dart';
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
                            return LoadCsvDataScreen(
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

  void createTeachersCsv(File myCSVFile) {
    String id = "Email Id";
    String name = "NAME";
    String phone = "PHONE NUMBER";

    myCSVFile.writeAsStringSync("${id},${name},${phone}\r\n", mode: APPEND);
    print("Teacher's File Created");
  }

  void createStudentCsv(File myCSVFile) {
    String id = "Email Id";
    String name = "NAME";
    String className = "CLASS";
    String parentsName = "PARENTS NAME";

    myCSVFile.writeAsStringSync("${id},${name},${parentsName},${className}\r\n",
        mode: APPEND);
    print("Student's File Created");
  }
}
