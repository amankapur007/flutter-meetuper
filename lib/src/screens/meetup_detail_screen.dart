import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meetuper/widgets/bottom_navigation.dart';

class MeetupDetailScreen extends StatefulWidget {
    static final String route='/meetupDetail';

  @override
  _MeetupDetailScreenState createState() => _MeetupDetailScreenState();
}

class _MeetupDetailScreenState extends State<MeetupDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("I am Meetup Detail Screen"),
      appBar: AppBar(title: Text("Meetup Detail"),),
      bottomNavigationBar:BottomNavigation(),
    );
  }
}