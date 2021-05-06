import 'dart:io';
import 'package:esvadhayaapp/ui/screens/addData.dart';
import 'package:esvadhayaapp/ui/screens/loadCsvDataScreen.dart';
import 'package:esvadhayaapp/ui/utilities/createFiles.dart';
import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:esvadhayaapp/ui/widgets/Buttom.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class TeachersScreen extends StatelessWidget {
  TeachersScreen();

  @override
  Widget build(BuildContext context) {
    //
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Screen"),
      ),
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Column(
          children: [
            Container(
              child: Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Result Update",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 10 * SizeConfig.heightMultiplier,
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
                    ),
                    Padding(
                      padding:
                          EdgeInsets.all(1.0 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Add Student",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 10 * SizeConfig.heightMultiplier,
                        onPressed: () async {
                          print("Add Students and Parents");
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
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Upload Assignment",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 13 * SizeConfig.heightMultiplier,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Upload Books and Pdfs",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 13 * SizeConfig.heightMultiplier,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Drive links",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 10 * SizeConfig.heightMultiplier,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Result Update",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 10 * SizeConfig.heightMultiplier,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createStudentCsv(File myCSVFile) {
    String id = "ID";
    String name = "NAME";
    String className = "CLASS";
    String parentsName = "PARENTS NAME";

    myCSVFile.writeAsStringSync("${id},${name},${parentsName},${className}\r\n",
        mode: APPEND);
    print("File Created");
  }
}
