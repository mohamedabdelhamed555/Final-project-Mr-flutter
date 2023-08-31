import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({Key? key, this.title, this.subTitle, this.image}) : super(key: key);

  final String? title;
  final String? subTitle;
  final String? image;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),

        SizedBox(
          height: 200,
          child: Image.asset(
              image!,
          ),
        ),

        SizedBox(height: 30,),

        Text(
          title!,
          style: TextStyle(
            fontSize: 20,
            fontWeight:FontWeight.w600,
            color: Color(0xff2f2e41),
          ),
          textAlign: TextAlign.left,
        ),

        SizedBox(height: 20,),

        Text(
          subTitle!,
          style: TextStyle(
            fontSize: 15,
            fontWeight:FontWeight.w600,
            color: Color(0xff78787c),
          ),
          textAlign: TextAlign.left,
        ),

      ],
    );
  }
}
