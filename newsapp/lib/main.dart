import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/ui/home.dart';
import 'package:newsapp/widgets/navBar.dart';
import 'package:newsapp/provider/favouriteProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<FavouriteList>(create: (context) => FavouriteList(), child:(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NEWS APP',
        home: NavBar(),
      )),
    );
  }
}