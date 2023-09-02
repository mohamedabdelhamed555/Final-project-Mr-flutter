import 'package:final_project/Widget/teams_screen_view_body.dart';
import 'package:flutter/material.dart';

class LeaguesScreen extends StatelessWidget {
  final String country;

  LeaguesScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff14142B),
      appBar: AppBar(
        title: Text('Leagues of $country'),
        backgroundColor: Color(0xff14142B),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const TeamsScreenViewBody(),
              ),
            );
          },
          child: Text(
            'Display leagues of $country',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
