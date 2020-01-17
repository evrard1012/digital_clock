import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      title: 'My Digital_Clock',
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer _everysecond;
  String _currentTime;
  String _currentHour;
  String _currentminute;
  String _currentsecond;
  _HomeScreenState();

  _CurrentTime() {
    _currentsecond = "${DateTime.now().second}";
    _currentminute = "${DateTime.now().minute}";
    _currentHour = "${DateTime.now().hour}";

    if (_currentHour.length == 1) {
      _currentHour = "0" + _currentHour;
    }
    if (_currentminute.length == 1) {
      _currentminute = "0" + _currentminute;
    }
    if (_currentsecond.length == 1) {
      _currentsecond = "0" + _currentsecond;
    }
    return _currentHour + ":" + _currentminute + ":" + _currentsecond;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _currentTime = _CurrentTime();

    _everysecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _currentTime = _CurrentTime();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Center(child: Text('D_Clock')),
      ),
      body: Container(
        color: Colors.blue.shade700,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: Colors.black,
                child: Container(
                  width: 320,
                  height: 270,
                  child: Center(
                    child: Text(
                      _currentTime,
                      style: TextStyle(
                          fontSize: 70.0,
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Digital'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
