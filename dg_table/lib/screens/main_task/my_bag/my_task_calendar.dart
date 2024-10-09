import 'package:flutter/material.dart';

class WeeklyCalendar extends StatelessWidget {
  final List<Event> events = [
    Event('SE 과제', DateTime(2024, 9, 29), DateTime(2024, 10, 2), Colors.lightBlue),
    Event('봉사 신청', DateTime(2024, 9, 29), DateTime(2024, 9, 29), Colors.lightBlue[100]!),
    Event('DS 보고서', DateTime(2024, 9, 30), DateTime(2024, 10, 2), Colors.red[100]!),
    Event('DB 과제', DateTime(2024, 10, 3), DateTime(2024, 10, 5), Colors.red[200]!),
    Event('NP 팀플', DateTime(2024, 10, 3), DateTime(2024, 10, 4), Colors.blue[200]!),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildWeekHeader(),
        SizedBox(
          height: 300, // 캘린더의 높이를 고정하거나 동적으로 조정 가능
          child: SingleChildScrollView(
            child: _buildEventRows(),
          ),
        ),
      ],
    );
  }

  Widget _buildWeekHeader() {
    final List<String> days = ['일', '월', '화', '수', '목', '금', '토'];
    final List<int> dates = List.generate(7, (index) => 29 + index);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        return Expanded(
          child: Column(
            children: [
              Text(
                days[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: index == 0 ? Colors.red : (index == 6 ? Colors.blue : Colors.black),
                ),
              ),
              Text(
                '${dates[index]}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildEventRows() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double dayWidth = constraints.maxWidth / 7;

        return Column(
          children: events.map((event) {
            final int startOffset = event.startDate.difference(DateTime(2024, 9, 29)).inDays;
            final int eventDuration = event.endDate.difference(event.startDate).inDays + 1;

            return Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  SizedBox(width: dayWidth * (event.startDate.weekday % 7)),
                  Container(
                    width: dayWidth * eventDuration,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: event.color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      event.name,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class Event {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final Color color;

  Event(this.name, this.startDate, this.endDate, this.color);
}