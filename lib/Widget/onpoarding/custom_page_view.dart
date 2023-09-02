import 'package:final_project/Widget/onpoarding/page_view_item.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key, required this.pageController})
      : super(key: key);

  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          image: 'assets/images/img1.png',
          title: 'Hello amegos',
          subTitle: 'I will be with you in everything about sports',
        ),
        PageViewItem(
          image: 'assets/images/img2.png',
          title: 'Hello amegos',
          subTitle: 'You will know the dates of all matches',
        ),
        PageViewItem(
          image: 'assets/images/img3.png',
          title: 'Hello amegos',
          subTitle: 'You will know sports news',
        )
      ],
    );
  }
}
