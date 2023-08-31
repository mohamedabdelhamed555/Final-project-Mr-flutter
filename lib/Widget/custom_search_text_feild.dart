import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 1 / 7,
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            filled: true,
            focusedBorder: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Opacity(
                opacity: .4,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 20,
                ),
              ),
            )),
      ),
    );
  }
}
