import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TimelineCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
        view: CalendarView.timelineMonth,
        dataSource: MeetingDataSource(getDataSource()),
        monthViewSettings: MonthViewSettings(
          showTrailingAndLeadingDates: false,
          dayFormat: 'EEE',
        ),
        timeSlotViewSettings: TimeSlotViewSettings(
          timeIntervalHeight: calculateDynamicHeight(), // 동적으로 높이를 계산
        ),
        todayHighlightColor: Colors.grey,
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
          backgroundColor: Colors.transparent,
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
  }

  // 일정 개수에 따라 동적으로 높이를 계산하는 함수
  double calculateDynamicHeight() {
    // 일정 데이터 기반으로 최대 일정 개수를 계산하여 높이 설정
    List<Meeting> meetings = getDataSource();
    int maxMeetings = 1;
    Map<DateTime, int> meetingCounts = {};

    for (var meeting in meetings) {
      DateTime start = meeting.from;
      DateTime end = meeting.to;
      for (DateTime date = start; date.isBefore(end) || date.isAtSameMomentAs(end); date = date.add(Duration(days: 1))) {
        if (meetingCounts.containsKey(date)) {
          meetingCounts[date] = meetingCounts[date]! + 1;
        } else {
          meetingCounts[date] = 1;
        }
        maxMeetings = maxMeetings > meetingCounts[date]! ? maxMeetings : meetingCounts[date]!;
      }
    }

    // 기본 높이 100을 기준으로 일정이 많을수록 높이를 증가
    return maxMeetings * 50.0; // 일정 개수에 따라 동적으로 높이 결정
  }

  List<Meeting> getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    
    meetings.add(Meeting('SE 과제', today.add(Duration(days: 2)), today.add(Duration(days: 3)), Colors.lightBlue, true));
    meetings.add(Meeting('DB 과제', today.add(Duration(days: 4)), today.add(Duration(days: 5)), Colors.red[200]!, true));
    meetings.add(Meeting('봉사 신청', today, today.add(Duration(days: 1)), Colors.lightBlue[100]!, true));
    meetings.add(Meeting('DS 보고서', today.add(Duration(days: 1)), today.add(Duration(days: 2)), Colors.red[100]!, true));
    meetings.add(Meeting('NP 팀플', today.add(Duration(days: 5)), today.add(Duration(days: 6)), Colors.blue[200]!, true));

    return meetings;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}