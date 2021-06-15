import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Tabbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TabBarDemo()//DrawerExample() //MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class DrawerExample extends StatefulWidget {
  const DrawerExample({Key key, this.restorationId}) : super(key: key);

  final String restorationId;

  @override
  State<StatefulWidget> createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample> with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);

  @override
  Widget build(BuildContext context) {
    final drawerElements = ListView(children: [
      UserAccountsDrawerHeader(
        accountName: Text("Andi"),
        accountEmail: Text("Danke fürs Zusehen"),
        currentAccountPicture: const CircularProgressIndicator(
          backgroundColor: Colors.black,
        ),
      ),
      Divider(),
      ListTile(
        title: Text("Dashboard"),
        onTap: () {
          print("Tapped");
        },
      ),
      Divider(),
      ListTile(
        title: Text("Impressum"),
      ),
    ]);
    var bottomNavBarItems = [
      BottomNavigationBarItem(
          icon: const Icon(Icons.account_box), label: "Acccount"),
      BottomNavigationBarItem(icon: const Icon(Icons.alarm), label: "Alarm"),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text("Nav Bar Example"),
          actions: [
            PopupMenuButton(
              padding: EdgeInsets.zero,
              onSelected: (value) => print(value),
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: "Teilen",
                  child: ListTile(
                    leading: const Icon(Icons.share),
                    title: Text("Teilen"),
                  )
                  ),
                PopupMenuDivider(),
                PopupMenuItem(
                  value: "Logout",
                  child: ListTile(
                    leading: const Icon(Icons.logout),
                    title: Text("Logout"),
                  )
                  ),
              ],
              )
          ],
        ),
        body: Center(
          child: InkWell(
            onTap: () {
              print("InkWell");
            },
            child: Center(
                child: _MyBottomNavView(
                    key: UniqueKey(),
                    item: bottomNavBarItems[_currentIndex.value])),
          ),
        ),
        drawer: Drawer(
          child: drawerElements,
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          items: bottomNavBarItems,
          currentIndex: _currentIndex.value,
          onTap: (index) {
            setState(() {
              _currentIndex.value = index;
            });
          },
        ));
  }

  @override
  String get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'buttom_navigation_tab_index');
  }
}

class _MyBottomNavView extends StatelessWidget {
  _MyBottomNavView({Key key, this.item}) : super(key: key);
  final BottomNavigationBarItem item;

  
  @override
  Widget build(BuildContext context) {
    return Text(item.label);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  final items = List<String>.generate(50, (i) => "Eintrag ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final title = 'Delete Me';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              key: Key(item),
              child: ListTile(
                title: Text('$item'),
              ),
              background: Container(
                child: Icon(Icons.delete),
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30),
              ),
              secondaryBackground: Container(
                child: Icon(Icons.save),
                color: Colors.green,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 30),
              ),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
                String msg = "deleted";
                if (direction == DismissDirection.startToEnd) {
                  msg = "deleted";
                } else if (direction == DismissDirection.endToStart) {
                  msg = "saved";
                }
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$item $msg"),
                ));
              },
            );
          },
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            MyButton(_counter)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyButton extends StatelessWidget {
  int counter;
  MyButton(int this.counter);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Diese Zahl ist kleiner als Drölf."),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(12),
        child: Text(
          '$counter',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
