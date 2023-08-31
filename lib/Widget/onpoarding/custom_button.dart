import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.text, this.onTap}) : super(key: key);

  final String? text;
  final VoidCallback? onTap;  //typedef

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 410,
        decoration: BoxDecoration(
          color: Color(0xff14142B),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child:  Text(
            text!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xffffffff)
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
