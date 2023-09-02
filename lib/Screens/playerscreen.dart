import 'package:final_project/Widget/onpoarding/on_boarding_body.dart';
import 'package:final_project/Widget/players.dart';
import 'package:flutter/material.dart';

class playersScreen extends StatelessWidget {
  const playersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff14142B),
      body: ListView.builder(
          itemCount: itemss.length,
          itemBuilder: (context, index) {
            final item = itemss[index];
            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "ronaldo",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    "Cf",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 190, 185, 185)),
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.transparent,
                    child: Image.asset("assets/images/Ronaldo.webp"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
