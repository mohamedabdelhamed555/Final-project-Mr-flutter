import 'package:final_project/Screens/countries_screen.dart';
import 'package:final_project/Widget/Side_Menu.dart';
import 'package:final_project/model/cubit/countries/get_contry_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class homeScreen extends StatelessWidget {
  homeScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: NavBar(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Center(child: Text("Sports App")),
            backgroundColor: Color(0xff14142B),
            actions: [
              IconButton(
                icon: Image.asset('assets/images/tv.png'),
                onPressed: () {
                  // Add your desired functionality here
                },
              ),
            ],
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.only(top: 20, left: 20, bottom: 40),
                child: Text('What sport do you interest ?',
                    style: TextStyle(
                      color: Color(0xff14142B),
                      fontSize: 40,
                      // fontWeight: FontWeight.bold,
                    ))),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(4),
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // boxShadow: [BoxShadow(blurRadius: 3)],
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<GetContryCubit>().getAllCountries();
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
                        // boxShadow: [BoxShadow(blurRadius: 3)],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: GridItem(
                      text: 'Basketball',
                      image: AssetImage('assets/images/basketball (1).png'),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        // boxShadow: [BoxShadow(blurRadius: 3)],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: GridItem(
                      text: 'Tennis',
                      image: AssetImage('assets/images/tennis.png'),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        // boxShadow: [BoxShadow(blurRadius: 3)],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: GridItem(
                      text: 'Cricket',
                      image: AssetImage('assets/images/cricket (1).png'),
                    ),
                  ),
                ],
              ),
            ),
          ])),
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
                    backgroundColor: Colors.white,
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
        } else {}
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
                  color: Color(0xff14142B)),
            ),
          ],
        ),
      ),
    );
  }
}
