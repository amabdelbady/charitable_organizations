import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'RetrieveData.dart';
import 'SubmitData.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                "Add New Organization",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SubmitData()),
                );
              },
            ),

            RaisedButton(
              child: Text("View Organizations",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RetrieveData()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
