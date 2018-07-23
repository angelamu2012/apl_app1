import 'package:flutter/material.dart';
import './proceduresScreen.dart';

class FireProc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fire Procedures"),
      ),

      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
        itemCount:data.length,
      ),
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

final List<Entry> data = <Entry> [
  Entry ("Fire-Specific Procedures",
  <Entry> [
    Entry ("First: Call x555 (or, if using cell phone, 443-778-7575) to report ",
    <Entry> [
      Entry ("◦ Fire in progress"),
      Entry ("◦ Visible Smoke"),
      Entry ("◦ Odors from burning materials"),
      Entry ("◦ Odors from natural gas, suspect chemicals or flammable liquids"),
    ]),
  Entry ("Next: Activate a fire alarm pull station when a fire is in progress"),
  ]),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles (Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey <Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
