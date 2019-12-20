import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meetuper/widgets/bottom_navigation.dart';

class CounterHomeScreen extends StatefulWidget {
  final String appTitle;

  CounterHomeScreen(String appTitle) : appTitle = appTitle;

  @override
  CounterHomeScreenState createState() {
    return CounterHomeScreenState();
  }
}

class CounterHomeScreenState extends State<CounterHomeScreen> {
  int _counter = 0;

  _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome in ${widget.appTitle}!, lets increment numbers",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 15.0),
            ),
            Text(
              "Counter: $_counter",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 30.0),
            ),
            RaisedButton(child: Text("Go to details"),
            onPressed: (){
              Navigator.pushNamed(context, '/meetupDetail');
            },)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _increment(),
        tooltip: "Increment",
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("${widget.appTitle}"),
      ),
    );
  }
}
