import 'package:flutter/material.dart';
import './main.dart';

class TextFormat extends StatelessWidget {
  TextFormat({this.title, this.text});

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
                      new Text(this.title, textAlign: TextAlign.center, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold), ),
                      new Text(this.text)
                    ])
            )
        ));
  }
}

class PhoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Emergency Call"),
        ),
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            new SliverPadding (
              padding: const EdgeInsets.all(0.0),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate(
                  <Widget>[
                    new TextFormat (title: "Emergency Contact:", text:"Dial 555 or 443-778-7575"),
                    new TextFormat(title: "APL Security:", text: "ext. 555 or 443-778-7575"),
                    new TextFormat(title:"Inclement Weather Recorded Announcements:", text: " 240-228-6101"),
                    new TextFormat (title:"Environmental Health and Safety Group (HES):", text: "​ext. 86452 or 240-228-6452​"),
                    new TextFormat(title:"Medical Services:", text: " ext. 85592 or 240-228-5592"),
                    new TextFormat(title:"APL Fire Department:", text: " ext. 84882 or 240-228-4882 ​"),
                    new Text ("For more information about the Incident Command System, contact Brian Donohue at ext. 82271"),
                    new RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Back"),
                    )],
                ),
              ),
            ),
          ],
        )
    );
  }
}
