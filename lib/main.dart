import 'dart:io';
import 'package:esvadhayaapp/ui/screens/loginScreen.dart';
import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'App',
              home: LoginScreen(),
            );
          },
        );
      },
    );
  }
}

// createFolder() async {
//     var status = await Permission.storage.status;
//     final folderName = "esvadhayaapp";
//     final path = Directory("storage/emulated/0/$folderName");

//     if (!status.isGranted) {
//       await Permission.storage.request();
//     }
//     if ((await path.exists())) {
//       print("exist");
//       return path.path;
//     } else {
//       print("not exist");
//       path.create();
//       print("File Created");
//       return path.path;
//     }
//   }