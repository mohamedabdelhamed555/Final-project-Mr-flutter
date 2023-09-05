import 'package:flutter/material.dart';

class GridItemTeams extends StatelessWidget {
  final String imageUrl;
  final String text;

  const GridItemTeams({super.key, required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        childrenDelegate: SliverChildListDelegate([
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Column(
              children: [
                Image.network(
                  imageUrl,
                  width: 50,
                  height: 50,
                ),
                Text(text)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
