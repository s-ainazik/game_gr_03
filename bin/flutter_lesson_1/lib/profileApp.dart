import 'package:flutter/material.dart';
import 'package:flutter_lesson_1/profilePage.dart';

class ProfileApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User  Profile',
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}