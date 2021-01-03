import 'package:TrackCOVID/Screens/About.dart';
import 'package:TrackCOVID/Screens/Home.dart';
import 'package:TrackCOVID/Screens/India.dart';
import 'package:TrackCOVID/Screens/US.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, Object>> _pages = [
    {'page': Home(), 'title': "TRACK COVID"},
    {'page': India(), 'title': "India"},
    {'page': US(), 'title': "US"},
  ];
  int _selectedPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff202029),
        title: Text(
          _pages[_selectedPageIndex]['title'],
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outline_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: _selectedPage,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey[300],
        backgroundColor: Color(0xff202029),
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.coronavirus),
            label: "World",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: "India",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wifi_tethering),
            label: "US",
            backgroundColor: Colors.white,
          ),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
