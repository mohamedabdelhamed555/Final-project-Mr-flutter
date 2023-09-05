import 'dart:async';

import 'package:final_project/Widget/onpoarding/page_view_item.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
class CustomPageView extends StatefulWidget {
const CustomPageView({Key? key, required this.pageController}) : super(key: key);

final PageController? pageController;
=======
class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key, required this.pageController})
      : super(key: key);
>>>>>>> 93f0e420a523b128bcd5c6ea6fbdbb2c768bfae7

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
<<<<<<< HEAD
      controller: widget.pageController,
      onPageChanged: (index){
        setState(() {
          currentPageIndex = index;
        });
      },
=======
      controller: pageController,
>>>>>>> 93f0e420a523b128bcd5c6ea6fbdbb2c768bfae7
      children: [
        PageViewItem(
          image: 'assets/images/img1.png',
          title: 'Hello amegos',
          subTitle: 'I will be with you in everything about sports',
        ),
        PageViewItem(
<<<<<<< HEAD
          image: 'assets/images/img2.png',
=======
          image: 'assets/images/Messi.png',
>>>>>>> 93f0e420a523b128bcd5c6ea6fbdbb2c768bfae7
          title: 'Hello amegos',
          subTitle: 'You will know the dates of all matches',
        ),
        PageViewItem(
<<<<<<< HEAD
          image: 'assets/images/img3.png',
=======
          image: 'assets/images/vardy.png',
>>>>>>> 93f0e420a523b128bcd5c6ea6fbdbb2c768bfae7
          title: 'Hello amegos',
          subTitle: 'You will know sports news',
        )
      ],
    );
  }
}
