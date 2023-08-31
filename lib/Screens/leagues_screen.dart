import 'package:flutter/material.dart';

class LeaguesScreen extends StatelessWidget {
  final String country;

  LeaguesScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leagues of $country'),
      ),
      body: Center(
        child: Text(
          'Display leagues of $country',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
