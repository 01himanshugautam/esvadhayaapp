import 'dart:io';
import 'package:csv/csv.dart' as csv;
import 'dart:math';

class CsvOperations {
  CsvOperations._();

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

  List<List<dynamic>> csvToList(String path) {
    File myCsvFile = new File(path);
    csv.CsvToListConverter c = new csv.CsvToListConverter(
        eol: "\r\n", fieldDelimiter: ",", shouldParseNumbers: true);
    List<List> listCreated = c.convert(myCsvFile.readAsStringSync());
    return listCreated;
  }
}
