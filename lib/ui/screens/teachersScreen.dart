import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:esvadhayaapp/ui/screens/addData.dart';
import 'package:esvadhayaapp/ui/screens/loadCsvDataScreen.dart';
import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:esvadhayaapp/ui/widgets/Attendance.dart';
import 'package:esvadhayaapp/ui/widgets/Buttom.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
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
                          final reusltPath = "$directory/Result.csv";
                          print("$reusltPath");
                          File resultCsvFile = new File(reusltPath);
                          print("$resultCsvFile");
                          if (await resultCsvFile.exists()) {
                            print("Result File Exits");
                            print(resultCsvFile);
                          } else {
                            print("Result File Not Exits");
                            createResultCsv(resultCsvFile);
                            print("Result File Created");
                          }
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) {
                                return LoadResult(
                                  title: " Result List",
                                  path: reusltPath,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
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
                                  title: "Students List",
                                  path: studentsPath,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Take Attendance",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 13 * SizeConfig.heightMultiplier,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Attendance(),
                            ),
                          );
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
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Chatting",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 13 * SizeConfig.heightMultiplier,
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
    int _index = 0;
    String _id = "Email Id";
    String _name = "NAME";
    String _class = "CLASS";
    String _pName = "PARENT'S NAME";
    String _phone = "PHONE NUMBER";

    myCSVFile.writeAsStringSync(
        "$_index, $_name, $_id, $_pName, $_phone, $_class\r\n",
        mode: APPEND);
    print("Student's File Created");
  }

  void createResultCsv(File myCSVFile) {
    int _index = 0;

    String _name = "NAME";
    String _class = "CLASS";
    String _pName = "PARENT'S NAME";
    String _marks = "Marks";

    myCSVFile.writeAsStringSync(
        "$_index, $_name, $_pName, $_class, $_marks\r\n",
        mode: APPEND);
    print("Result File Created");
  }

  // void _uploadFile(filePath) async {
  //   String fileName = basename(filePath.path);
  //   print("File base name : $fileName");
  //   try{

  //   }
  // }
}

class LoadResult extends StatelessWidget {
  final String path;
  final String title;

  LoadResult({
    required this.path,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder(
        future: loadingCsvData(path),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          print(snapshot.data.toString());
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 3 * SizeConfig.heightMultiplier,
                                  width: 9 * SizeConfig.heightMultiplier,
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
                                  width: 9 * SizeConfig.heightMultiplier,
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
                                  width: 8 * SizeConfig.heightMultiplier,
                                  // color: Colors.black,
                                  child: Center(
                                    child: Text(
                                      data[4].toString(),
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
