import 'package:final_project/Screens/countries_screen.dart';
import 'package:final_project/model/cubit/countries/get_contry_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(homeScreen());
}

class homeScreen extends StatelessWidget {
  homeScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff14142B),
        appBar: AppBar(
          backgroundColor: Color(0xff222232),
          title: Text(
            'What sport do you interest ? ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: GridView.count(
          padding: EdgeInsets.all(4),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 3)],
                borderRadius: BorderRadius.circular(12),
                color: Color(0xff222232),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Countries(),
                    ),
                  );
                },
                child: GridItem(
                  text: 'Football',
                  image: AssetImage('assets/images/football.png'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 3)],
                  color: Color(0xff222232),
                  borderRadius: BorderRadius.circular(12)),
              child: GridItem(
                text: 'Basketball',
                image: AssetImage('assets/images/basketball (1).png'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 3)],
                  color: Color(0xff222232),
                  borderRadius: BorderRadius.circular(12)),
              child: GridItem(
                text: 'Tennis',
                image: AssetImage('assets/images/tennis.png'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 3)],
                  color: Color(0xff222232),
                  borderRadius: BorderRadius.circular(12)),
              child: GridItem(
                text: 'Cricket',
                image: AssetImage('assets/images/cricket (1).png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String text;
  final ImageProvider image;

  const GridItem({required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (text != 'Football') {
          showDialog(
              context: context,
              builder: ((context) {
                return Container(
                  child: AlertDialog(
                    backgroundColor: Color.fromARGB(255, 190, 185, 185),
                    title: Text('Coming Soon'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Close',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                );
              }));
        } else {
          //navigation HERE!!
        }

        // Dismiss the alert box
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image(
              image: image,
              width: 100,
              height: 100,
            ),
            SizedBox(height: 30),
            Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
