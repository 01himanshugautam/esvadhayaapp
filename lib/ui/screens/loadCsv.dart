import 'dart:io';
import 'package:csv/csv.dart' as csv;
import 'package:esvadhayaapp/ui/utilities/csvOperation.dart';
import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class LoadCsv extends StatefulWidget {
  final String title;
  final String path;
  LoadCsv({
    key,
    required this.title,
    required this.path,
  });

  @override
  _LoadCsvState createState() => _LoadCsvState();
}

class _LoadCsvState extends State<LoadCsv> {
  late List<List<dynamic>> data;
  @override
  void initState() {
    setState(() {
      data = csvToList(widget.path);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: (data.isNotEmpty)
          ? Container(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        Text("${data[index]}"),
                      ],
                    ),
                  );
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  List<List<dynamic>> csvToList(String path) {
    File myCsvFile = new File(path);
    csv.CsvToListConverter c = new csv.CsvToListConverter(
        eol: "\r\n", fieldDelimiter: ",", shouldParseNumbers: true);
    List<List> listCreated = c.convert(myCsvFile.readAsStringSync());
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

  String generateRandomString(int len) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        len, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
 // GestureDetector(
                //   onTap: () {
                //     print(data);
                //   },
                //   child: Padding(
                //     padding: EdgeInsets.all(2 * SizeConfig.heightMultiplier),
                //     child: Center(child: Text("ONClick")),
                //   ),
                // ),