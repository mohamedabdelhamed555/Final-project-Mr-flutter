import 'package:final_project/Screens/leagues_screen.dart';
import 'package:flutter/material.dart';

class GridItem {
  final String imageUrl;
  final String text;

  GridItem({required this.imageUrl, required this.text});
}

class Countries extends StatefulWidget {
  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  final List<GridItem> items = [
    GridItem(imageUrl: 'assets/images/علم-مصر-أهم-الحقائق.jpg', text: 'Egypt'),
    GridItem(
        imageUrl: 'assets/images/Saudi-Flag-wallpapers-HD-388x276.jpg',
        text: 'saudi arbia'),
    GridItem(imageUrl: 'assets/images/engeland.png', text: 'engeland'),
    GridItem(imageUrl: 'assets/images/jermany.jpg', text: 'jermany'),
    GridItem(imageUrl: 'assets/images/italy.jpg', text: 'italy'),
    GridItem(imageUrl: 'assets/images/Portugal.jpg', text: 'Portugal'),
    GridItem(imageUrl: 'assets/images/Spain.jpg', text: 'Spain'),
    GridItem(imageUrl: 'assets/images/France.jpg', text: 'France'),
    GridItem(imageUrl: 'assets/images/America.jpg', text: 'America'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff14142B),
      body: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 20,
          // Number of columns in the grid
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return GridTile(
            child: GestureDetector(
              onTap: () {
                // Navigate to the leagues screen for the specific country here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LeaguesScreen(country: item.text),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    item.imageUrl,
                  ),
                  Text(
                    item.text,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
