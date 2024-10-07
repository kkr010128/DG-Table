import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UniBagNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const UniBagNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icon/nv_1.svg',
            color: selectedIndex == 0 ? const Color(0xFF557BFF) : const Color(0xFF616C94),
            width: 25,
            height: 24,
          ),
          label: '내 가방',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icon/nv_2.svg',
            color: selectedIndex == 1 ? const Color(0xFF557BFF) : const Color(0xFF616C94),
            width: 25,
            height: 24,
          ),
          label: '시간표',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icon/nv_3.svg',
            color: selectedIndex == 2 ? const Color(0xFF557BFF) : const Color(0xFF616C94),
            width: 25,
            height: 24,
          ),
          label: '과제',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icon/nv_4.svg',
            color: selectedIndex == 3 ? const Color(0xFF557BFF) : const Color(0xFF616C94),
            width: 25,
            height: 24,
          ),
          label: '친구',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icon/nv_5.svg',
            color: selectedIndex == 4 ? const Color(0xFF557BFF) : const Color(0xFF616C94),
            width: 25,
            height: 24,
          ),
          label: '캠퍼스맵',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: const Color(0xFF557BFF),
      unselectedItemColor: const Color(0xFF616C94),
      onTap: onItemTapped,
      selectedLabelStyle: const TextStyle(
        fontFamily: 'MalangBold',  // 선택된 아이템의 라벨 스타일
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: 'MalangBold',  // 선택되지 않은 아이템의 라벨 스타일
      ),
    );
  }
}