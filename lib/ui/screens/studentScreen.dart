import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:esvadhayaapp/ui/widgets/Buttom.dart';
import 'package:flutter/material.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Screen"),
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
                      padding:
                          EdgeInsets.all(1.0 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Join Meeting",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 10 * SizeConfig.heightMultiplier,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Test",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 13 * SizeConfig.heightMultiplier,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "DownUpload Books and Pdfs",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 13 * SizeConfig.heightMultiplier,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Your Attendance",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 10 * SizeConfig.heightMultiplier,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Check Result",
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
}
