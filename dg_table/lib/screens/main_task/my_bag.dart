import 'package:flutter/material.dart';
import 'package:dg_table/screens/main_task/my_bag/next_lecture.dart'; // next_lecture.dart를 import

class MyBag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // 모듈화된 ClassContainer 사용
          ClassContainer(
            subject: '소프트웨어공학',
            time: '13:30',
            buttonText: '수업 정보',
            iconPath: 'assets/image/next_lecture_sym.svg',
          ),
        ],
      ),
    );
  }
}