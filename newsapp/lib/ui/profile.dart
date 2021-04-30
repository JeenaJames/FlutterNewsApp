import 'package:flutter/material.dart';
import 'package:newsapp/Widgets/profileCard.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: (Text(
          'PROFILE',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        )),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                elevation: 100,
                shadowColor: Colors.grey[200],
                color: Colors.grey[400],
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Icon(Icons.account_circle_rounded, size: 70),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text("Welcome XXX"),
                      ],
                    )),
              ),
              SizedBox(height: 5),
              Card(
                  elevation: 100,
                  shadowColor: Colors.grey[200],
                  color: Colors.grey[400],
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ProfileCard(Icons.lock, 'Privacy policy'),
                          Divider(thickness: 2),
                          ProfileCard(Icons.rate_review, 'Rate'),
                          Divider(thickness: 2),
                          ProfileCard(Icons.more, 'More'),
                          Divider(thickness: 2),
                          ProfileCard(Icons.help, 'about'),
                        ],
                      ))),
            ],
          )),
    );
  }
}
