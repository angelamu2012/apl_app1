import 'package:flutter/material.dart';
import './proceduresScreen.dart';
import './phoneScreen.dart';


void main() {
  runApp(MaterialApp(
    title: 'JHU APL',
    home: MainScreen(),
  ));
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color:Colors.blueAccent,
      title: "JHU APL",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold (
        appBar: new AppBar(
          title: new Text("JHU APL"),
        ),
        body: new Container (
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Column (
                    children: <Widget>[
                      new MyCard(
                          title: "Building Map",
                          color: Colors.lightBlue[100]
                      ),
                      new MyCard(
                          title: "Emergency Call",
                          color: Colors.lightBlue[200]
                      ),
                      new MyCard(
                          title: "Weather Alerts",
                          color: Colors.lightBlue[300]
                      ),
                      new MyCard(
                          title: "Emergency Procedures",
                          color: Colors.lightBlue[400]
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  InfoCard({this.title, this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return new Container (
      child: new Card(
        child: new Container(
          padding: new EdgeInsets.symmetric(horizontal: 20.0,  vertical: 20.0),
          child: new Column(
              children: <Widget> [
                new Text(this.title, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold), ),
                new Text(this.text)
              ])
      )
    ));
  }
}

class MyCard extends StatelessWidget {
  MyCard({this.title, this.color});

  final String title;
  final Color color;
  BuildContext screen;

  @override
  Widget build(BuildContext context) {
    return new Container (
        child: new Card(
            child: new Container(
                color: this.color,
                padding: new EdgeInsets.symmetric(horizontal: 10.0,  vertical: 10.0),
                child: new Column(
                    children: <Widget> [
                      new ButtonTheme.bar( // make buttons use the appropriate styles for cards
                        child: new ButtonBar(
                          children: <Widget>[
                            new FlatButton(
                                child: new Text(this.title, textAlign: TextAlign.left, style: TextStyle(fontFamily: 'Raleway', fontSize: 20.0, color: Colors.white),
                                ),
                                padding: new EdgeInsets.fromLTRB(40.0, 30.0, 10.0, 20.0),
                                color: this.color,
                                onPressed: () {
                                  if (title =="Emergency Call")
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => PhoneScreen()),
                                    );
                                  else if (title == "Building Map")
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => MapScreen()),
                                    );
                                  else if (title == "Emergency Procedures")
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => ProceduresScreen()),
                                    );
                                  else if (title == "Weather Alerts")
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => WeatherScreen()),
                                    );
                                }
                            )],
                        ),

                      )
                    ])
            )
        )
    );
  }
}

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Building Plan"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Alerts"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}