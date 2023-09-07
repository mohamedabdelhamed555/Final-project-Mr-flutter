import 'package:flutter/material.dart';

class GridItemTeams extends StatelessWidget {
  final String imageUrl;
  final String text;

  const GridItemTeams({super.key, required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: 50,
            height: 50,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 18),
          )
        ],
      ),
    );
  }
}
