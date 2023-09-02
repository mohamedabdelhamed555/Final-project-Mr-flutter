import 'package:final_project/Screens/leagues_screen.dart';

import 'package:final_project/Widget/gridItem_countries.dart';
import 'package:flutter/material.dart';

class Countries extends StatefulWidget {
  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff14142B),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
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
      ),
    );
  }
}
