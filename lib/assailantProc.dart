import 'package:flutter/material.dart';
import './main.dart';
import './proceduresScreen.dart';


class assailantProc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Active Assailant Procedures"),
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
  Entry (
      "Active Assailant",
      <Entry> [
        Entry("•APL will use the term “lockdown” during emergencies that could endanger your life, such as an active assailant/armed intruder on campus "),
        Entry("•You might receive this message via the PA system, phone call, email or text message "),
        Entry("•When a “lockdown” is announced: ",
            <Entry> [
              Entry ("◦In open or public areas, such as a cafeteria, the Kossiakoff Center or Parsons Auditorium:",
                  <Entry> [
                    Entry ("◾Quickly determine your proximity to the shooter (if possible) "),
                    Entry ("◾If you see an escape path away from the threat, take it "),
                  ]
              ),
              Entry ("◦In most instances the exact location of the assailant will be unclear and the situation may be evolving. Therefore, if escape is not a viable option, the safest course of action is to seek safe haven in a location not easily observable or accessible by the assailant: ",
                  <Entry>[
                    Entry ("◾Go into an office or nearby room, lock all doors and use any available items to block the doors "),
                    Entry("◾Remain quiet; put phones on silent or vibrate "),
                    Entry("◾If no lockable rooms are close by, hide where the assailant is least likely to find you ")
                  ]
              ),
            ]),
        Entry ("•You might have to stay in the room or in hiding for several hours while police deal with the situation "),
        Entry("•If you need medical attention, call ext. 555"),
        Entry("•Do NOT open your door and look out")
      ]
  ),
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
