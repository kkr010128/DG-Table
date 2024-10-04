import 'package:flutter/material.dart';
import 'package:dg_table/screens/appbar/appbar.dart';
import 'package:dg_table/screens/navigationbar/navigationbar.dart';
import 'package:dg_table/screens/main_task/my_bag.dart'; 
import 'package:dg_table/screens/main_task/my_timetable.dart';
import 'package:dg_table/screens/main_task/my_task.dart';
import 'package:dg_table/screens/main_task/my_friends.dart';
import 'package:dg_table/screens/main_task/campus_map.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // 선택한 인덱스에 따라 다른 페이지를 반환
  static List<Widget> _pages = <Widget>[
    MyBag(),
    MyTimetable(),
    MyTask(),
    MyFriends(),
    CampusMap(),
    // 필요한 만큼 페이지 추가
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UnibagAppBar(),
      body: _pages[_selectedIndex],  // 선택된 페이지를 body에 표시
      bottomNavigationBar: UniBagNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}