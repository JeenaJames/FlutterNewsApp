import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final IconData icon;

  ProfileCard(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Row(
        children: [
          Padding(padding: EdgeInsets.all(8)),
          Icon(icon),
          Padding(padding: EdgeInsets.all(8)),
          Text(title),
        ],
      )),
    );
  }
}
