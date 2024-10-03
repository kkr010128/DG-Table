import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // flutter_svg 패키지 사용

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF6E58FF),
        title: const Text(
          '학점가방',
          style: TextStyle(fontFamily: 'MalangBold'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Selected tab: $_selectedIndex',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/mv_1.svg',
              color: _selectedIndex == 0 ? const Color(0xFF557BFF) : const Color(0xFF616C94),
              width: 24,
              height: 24,
            ),
            label: '내 가방',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/mv_2.svg',
              color: _selectedIndex == 1 ? const Color(0xFF557BFF) : const Color(0xFF616C94),
              width: 24,
              height: 24,
            ),
            label: '시간표',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/mv_3.svg',
              color: _selectedIndex == 2 ? const Color(0xFF557BFF) : const Color(0xFF616C94),
              width: 24,
              height: 24,
            ),
            label: '과제',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/mv_4.svg',
              color: _selectedIndex == 3 ? const Color(0xFF557BFF) : const Color(0xFF616C94),
              width: 24,
              height: 24,
            ),
            label: '친구',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/mv_5.svg',
              color: _selectedIndex == 4 ? const Color(0xFF557BFF) : const Color(0xFF616C94),
              width: 24,
              height: 24,
            ),
            label: '캠퍼스맵',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF557BFF),
        unselectedItemColor: const Color(0xFF616C94),
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'MalangBold',  // 선택된 아이템의 라벨 스타일
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'MalangBold',  // 선택되지 않은 아이템의 라벨 스타일
        ),
      ),
    );
  }
}