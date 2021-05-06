import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:esvadhayaapp/ui/widgets/Buttom.dart';
import 'package:flutter/material.dart';

class ParentsScreen extends StatelessWidget {
  ParentsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parents Screen"),
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
                        txt: "Student Report",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 10 * SizeConfig.heightMultiplier,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Student Record",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 13 * SizeConfig.heightMultiplier,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Attendance",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 13 * SizeConfig.heightMultiplier,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Chatting",
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 10 * SizeConfig.heightMultiplier,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                      child: Button(
                        txt: "Meeting Links",
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
