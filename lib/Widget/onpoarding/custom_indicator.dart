import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({Key? key, required this.dotIndex}) : super(key: key);

  final double? dotIndex;

  @override
  Widget build(BuildContext context) {
    final int index = dotIndex?.round() ?? 0;
    return DotsIndicator(
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: Color(0xff14142B),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
              side: BorderSide(color: Color(0xff14142B))
          )
      ),
      dotsCount: 3,
      position: index ,
    );
  }
}
