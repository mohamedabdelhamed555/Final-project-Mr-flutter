import 'package:final_project/Screens/login_screen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Raneem Fayez",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            accountEmail: Text(
              "012987231023",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            currentAccountPicture: Image.asset("assets/images/man.png"),
            decoration: BoxDecoration(
              color: Color(0xff14142B),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Sign out"),
            onTap: () => LoginScreen(),
          ),
        ],
      ),
    );
  }
}
