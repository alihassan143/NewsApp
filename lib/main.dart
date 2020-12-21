

import 'package:apibasedApp/Screen/search.dart';
import 'package:apibasedApp/Screen/sports.dart';
import 'package:apibasedApp/Screen/topchannelsgridview.dart';
import 'package:apibasedApp/mainscreen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyAppScreen(),
    );
  }
}
class MyAppScreen extends StatefulWidget {
  @override
  _MyAppScreenState createState() => new _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new HomeScreen(),
      imageBackground:AssetImage('assets/news.png'),
      );
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   PageController _pageController;
  int _selectedIndex = 0;
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: <Widget>[
           Screen(),
           Search(),
           Sports(),
           TopChannelsInGridView(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() => _selectedIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Item One'),
            icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
            title: Text('Search'),
            icon: Icon(Icons.search)
          ),
          BottomNavyBarItem(
            title: Text('Sports'),
            icon: Icon(Icons.sports_baseball_rounded)
          ),
          BottomNavyBarItem(
            title: Text('Sources'),
            icon: Icon(Icons.more)
          ),
        ],
      ),
    );
  }
}
