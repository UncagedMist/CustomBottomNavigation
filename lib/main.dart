import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  void showLongToast() {
    Fluttertoast.showToast(
      msg: "clicked...",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (currentIndex) {
      case 0:
        child = FlutterLogo();
        break;
      case 1:
        child = FlutterLogo(colors: Colors.orange);
        break;
      case 2:
        child = FlutterLogo(colors: Colors.red);
        break;
      case 3:
        child = FlutterLogo(colors: Colors.green);
        break;
    }
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: new AppBar(
        title: new Text('BottomNav'),
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => showLongToast(),
          )
        ],
      ),
      body: SizedBox.expand(child: child),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.looks_one),
            title: Text('Blue'),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.looks_two),
              title: Text('Orange'),
              activeColor: Colors.orange),
          BottomNavyBarItem(
              icon: Icon(Icons.looks_3),
              title: Text('Red'),
              activeColor: Colors.red),
          BottomNavyBarItem(
              icon: Icon(Icons.looks_4),
              title: Text('Green'),
              activeColor: Colors.green),
        ],
      ),
    );
  }
}
