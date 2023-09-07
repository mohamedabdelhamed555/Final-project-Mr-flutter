import 'dart:async';

import 'package:final_project/Widget/onpoarding/page_view_item.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({Key? key, required this.pageController})
      : super(key: key);

  final PageController? pageController;

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    // Start automatic page scrolling timer
    startAutoPageScroll();
  }

  void startAutoPageScroll() {
    const Duration autoScrollDuration = Duration(seconds: 2);

    Timer.periodic(autoScrollDuration, (timer) {
      if (currentPageIndex < 3) {
        currentPageIndex++;
        widget.pageController?.animateToPage(
          currentPageIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      } else {
        // Stop the timer when we reach the last page
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.pageController,
      onPageChanged: (index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      children: [
        PageViewItem(
          image: 'assets/images/cristiano.png',
          title: 'Hello amegos',
          subTitle: 'I will be with you in everything about sports',
        ),
        PageViewItem(
          image: 'assets/images/Messi.png',
          title: 'Hello amegos',
          subTitle: 'You will know the dates of all matches',
        ),
        PageViewItem(
          image: 'assets/images/neymar.png',
          title: 'Hello amegos',
          subTitle: 'You will know sports news',
        )
      ],
    );
  }
}
