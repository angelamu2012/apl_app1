import 'package:flutter/material.dart';
import './main.dart';
import './FireProc.dart';
import './assailantProc.dart';

class ProceduresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        color: Colors.blueAccent,
        title: "JHU APL",
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Scaffold (
            appBar: new AppBar(
              title: new Text("JHU APL"),
            ),
            body: CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                new SliverPadding (
                  padding: const EdgeInsets.all(0.0),
                  sliver: new SliverList(
                    delegate: new SliverChildListDelegate(
                      <Widget>[
                        new Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: new Column (
                            children: <Widget>[
                              new MyCard(
                                  title: "Radiological Event",
                                  color: Colors.teal[100]
                              ),
                              new MyCard(
                                  title: "Pandemic",
                                  color: Colors.teal[200]
                              ),
                              new MyCard(
                                  title: "Tornado",
                                  color: Colors.teal[300]
                              ),
                              new MyCard(
                                  title: "Weather",
                                  color: Colors.teal[400]
                              ),
                              new MyCard(
                                  title: "Medical",
                                  color: Colors.teal
                              ),
                              new MyCard(
                                  title: "Hazmat Spill",
                                  color: Colors.teal[600]
                              ),
                              new MyCard(
                                  title: "Earthquake",
                                  color: Colors.teal[700]
                              ),
                              new MyCard(
                                  title: "Fire",
                                  color: Colors.teal[800]
                              ),
                              new MyCard(
                                  title: "Active Assailant",
                                  color: Colors.teal[900]
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
        )
    );
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
                                  if (title =="Active Assailant")
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => assailantProc()),
                                    );
                                  else if (title == "Fire")
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => FireProc()),
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
