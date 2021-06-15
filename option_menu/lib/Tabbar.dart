import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      "Alle",
      "Freunde",
      "Famile",
      "Arbeit",
    ];
    final list = List<String>.generate(1337, (index) => "$index");
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("My ultzimate Chat"),
            bottom: TabBar(
              tabs: [for (final t in tabs) Tab(text: t)],
            ),
          ),
          body: TabBarView(
            children: [
              for (final t in tabs)
                Center(child: ListView.builder(itemBuilder: (context, i) {
                  return ListTile(
                    title: Text("$t - ${list[i]}"),
                  );
                }))
            ],
          ),
        ));
  }
}
