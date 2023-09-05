import 'package:final_project/Screens/home_screen.dart';
import 'package:final_project/Widget/onpoarding/custom_button.dart';
import 'package:final_project/Widget/onpoarding/custom_indicator.dart';
import 'package:final_project/Widget/onpoarding/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {

  PageController? pageController;

  @override
  void initState() {
    pageController=PageController(
      initialPage: 0
    )..addListener(() {
      setState(() {
    });});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   // print(pageController?.page);
    return Stack(
      children: [
        CustomPageView(
          pageController: pageController,
        ),

        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.3,
          left: 0,
          right: 0,
          child: CustomIndicator(
              dotIndex: pageController!.hasClients ? pageController?.page : 0
           ),
        ),

        Visibility(
          visible: pageController!.hasClients ? (pageController?.page == 2 ? false : true) : true,
          child: Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            right: 32,
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => homeScreen(),
                  ),
                );
              },
              child: Text(
                'skip',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff8989415),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),

        Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.height * 0.1,
            right: MediaQuery.of(context).size.height * 0.1,

            child: CustomButton(
              onTap: (){
                if(pageController!.page! < 2){
                  pageController?.nextPage(
                      duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                }else{
                  Get.to(() => homeScreen(), transition: Transition.rightToLeft, duration: Duration(milliseconds: 500));

                }
              },
              text: pageController !.hasClients ? (pageController!.page == 2 ? 'Get Started' : 'Next') : 'Next',
            )
        )
      ],


    );
  }
}
