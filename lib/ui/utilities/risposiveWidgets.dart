import 'package:esvadhayaapp/ui/utilities/sizeConfigration.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget landscapeLayout;
  final Widget portraitLayout;

  ResponsiveWidget({
    required this.portraitLayout,
    required this.landscapeLayout,
  });

  @override
  Widget build(BuildContext context) {
    if (SizeConfig.isPortrait && SizeConfig.isMobilePortrait) {
      return portraitLayout;
    } else {
      return landscapeLayout;
    }
  }
}
