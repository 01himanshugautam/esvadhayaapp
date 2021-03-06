import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:flutter/material.dart';

class LoadCsvDataScreen extends StatelessWidget {
  final String path;
  final String title;

  LoadCsvDataScreen({
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
                                Container(
                                  height: 3 * SizeConfig.heightMultiplier,
                                  width: 5 * SizeConfig.heightMultiplier,
                                  // color: Colors.black,
                                  child: Center(
                                    child: Text(
                                      data[5].toString(),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 3 * SizeConfig.heightMultiplier,
                                  width: 4 * SizeConfig.heightMultiplier,
                                  // color: Colors.black,
                                  child: Container(
                                    child: (data[1].toString() == "NAME")
                                        ? Center(child: Text("Edit"))
                                        : Center(
                                            child: IconButton(
                                                onPressed: () {
                                                  print("Edit");
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: (context) =>
                                                  //         EditData(
                                                  //       data: data,
                                                  //     ),
                                                  //   ),
                                                  // );
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
