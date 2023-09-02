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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1 / 3,
                    child: Column(
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        Text(
                          item.position,
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 190, 185, 185)),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      item.image,
                      width: 80,
                      height: 100,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
