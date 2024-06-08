import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoapp/Config/images.dart';

class BackgroundWidgets extends StatelessWidget {
  const BackgroundWidgets({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AppImages.bgImage),
        child,
      ],
    );
  }
}
