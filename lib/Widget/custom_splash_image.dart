import 'package:flutter/material.dart';

class CustomSplashImage extends StatelessWidget {
  const CustomSplashImage({Key? key, required this.image, this.width, this.height}) : super(key: key);
  final String? image;
  final num? width;
  final num? height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        image!,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width * (width ?? 1),
        height: MediaQuery.of(context).size.height * (height ?? 1),
      ),
    );
  }
}