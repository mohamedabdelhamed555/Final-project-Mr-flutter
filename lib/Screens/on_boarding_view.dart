import 'package:final_project/Widget/onpoarding/on_boarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff14142B),
      body: OnBoardingViewBody(),
    );
  }
}
