import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dg_table/screens/main_task/my_timetable/timetable.dart'; // next_lecture.dart를 import

class MyTimetable extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView( // 스크롤 가능하게 변경
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Timetable(),
          ],
        ),
      ),
    );
  }
}