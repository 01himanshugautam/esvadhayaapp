import 'dart:io';
import 'package:path_provider/path_provider.dart';

class AppUtil {
  static Future<String> createFolderInAppDocDir() async {
    //Get this App Document Directory
    final Directory? _appDocDir = await getApplicationDocumentsDirectory();
    //App Document Directory + folder name
    print(_appDocDir);
    String folderName = "esvadhiyaapp";
    final Directory _appDocDirFolder =
        Directory('${_appDocDir!.path}/$folderName/');
    print(_appDocDirFolder);
    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      print("File already Exits");
      return _appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      print("File not Exits");
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }
}
