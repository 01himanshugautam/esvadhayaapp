import 'dart:io';
import 'package:csv/csv.dart';
import 'package:esvadhayaapp/ui/screens/allCsv.dart';
import 'package:esvadhayaapp/ui/screens/loadCsvDataScreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CSVFile extends StatefulWidget {
  CSVFile({Key? key}) : super(key: key);

  @override
  _CSVFileState createState() => _CSVFileState();
}

class _CSVFileState extends State<CSVFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("csv"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => AllCsvFilesScreen()));
              },
              color: Colors.cyanAccent,
              child: Text("Load all csv form phone storage"),
            ),
            MaterialButton(
              onPressed: () {
                loadCsvFromStorage();
              },
              color: Colors.cyanAccent,
              child: Text("Load csv form phone storage"),
            ),
            MaterialButton(
              onPressed: () {
                generateCsv();
              },
              color: Colors.cyanAccent,
              child: Text("Load Created csv"),
            ),
          ],
        ),
      ),
    );
  }

  generateCsv() async {
    List<List<String>> data = [
      ["No.", "Name", "Salary"],
      ["1", "First", "1000"],
      ["2", "Second", "2000"],
      ["3", "Third", "3000"]
    ];
    String csvData = ListToCsvConverter().convert(data);
    final String directory = (await getApplicationSupportDirectory()).path;
    final path = "$directory/Teacher.csv";
    print(path);
    final File file = File(path);
    await file.writeAsString(csvData);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return LoadCsvDataScreen(title: "", path: path);
        },
      ),
    );
  }

  loadCsvFromStorage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['csv'],
      type: FileType.custom,
    );
    String path = "${result!.files.first.path}";
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return LoadCsvDataScreen(title: "", path: path);
        },
      ),
    );
  }
}
