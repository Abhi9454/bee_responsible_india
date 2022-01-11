import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config.dart';
import 'viewModels/home_page_view_model.dart';
import 'views/AboutPage/about_page_widget.dart';
import 'views/HelpPage/help_page_widget.dart';
import 'views/HomePage/home_page_widget.dart';
import 'views/KeyPage/key_page_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig().appName,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomePageViewModel()),
        ],
        child: const NavigationTab(),
      ),
    );
  }
}

class NavigationTab extends StatefulWidget {
  const NavigationTab({Key? key}) : super(key: key);

  @override
  _NavigationTabState createState() => _NavigationTabState();
}

class _NavigationTabState extends State<NavigationTab> {
  int _currentIndex = 0;
  final List<Widget> _children = <Widget>[
    ChangeNotifierProvider<HomePageViewModel>(
      create: (_) => HomePageViewModel(),
      child: HomePageWidget(),
    ),
    const HelpPageWidget(),
    const KeyPageWidget(),
    const AboutPageWidget(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        // new
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppConfig().primaryColor,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: AppConfig().primaryColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.help),
              label: 'Help',
              backgroundColor: AppConfig().primaryColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: 'Key',
              backgroundColor: AppConfig().primaryColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.details),
              label: 'About',
              backgroundColor: AppConfig().primaryColor),
        ],
      ),
    );
  }
}
