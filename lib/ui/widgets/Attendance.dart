import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  Attendance({key});

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staff Details"),
      ),
      body: FutureBuilder(
        future: loadingCsvData("path"),
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
                                      data[0].toString(),
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
                                      data[1].toString(),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 3 * SizeConfig.heightMultiplier,
                                  width: 8 * SizeConfig.heightMultiplier,
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
