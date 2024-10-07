import 'package:flutter/material.dart';
import 'package:dg_table/screens/main_task/my_bag/next_lecture.dart'; // next_lecture.dart를 import
import 'package:dg_table/screens/main_task/my_bag/my_task_calendar.dart'; // my_task_calendar.dart를 import
import 'package:dg_table/common/widgets/section_title.dart';

class MyBag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // 모듈화된 ClassContainer 사용
          nextLectureContainer(
            subject: '소프트웨어공학',
            time: '13:30',
            buttonText: '수업 정보',
            iconPath: 'assets/image/next_lecture_sym.svg',
          ),
          SectionTitle(
            title: '📚이번주 과제 정보',
            description:'수업 시간표와 과제를 등록하고 관리해보세요' ,
            redirectButton: '관리'),
          // TableCalendarScreen(),
          TimelineCalendar(),
        ],
      ),
    );
  }
}