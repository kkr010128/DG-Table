import 'package:flutter/material.dart';

class Timetable extends StatefulWidget {
  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  // 시간표 데이터를 30분 단위로 저장. 9시부터 7시까지 30분 단위 총 22칸을 5일에 대해 생성.
  final List<List<String>> timetable = List.generate(
    22, // 22개 30분 단위 (9시부터 7시까지)
    (index) => List.generate(5, (index) => ''), // 초기값은 빈 문자열로 채움
  );

  // 요일과 시간 리스트
  final List<String> days = ['월', '화', '수', '목', '금'];
  final List<String> times = ['9', '10', '11', '12', '1', '2', '3', '4', '5', '6', '7'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), // 바깥쪽 모서리를 둥글게 설정
          border: Border.all(color: Colors.grey), // 테두리 설정
        ),
        child: Table(
          border: TableBorder.symmetric(
            inside: BorderSide(color: Colors.grey), // 내부 셀 구분선
          ),
          columnWidths: {
            0: FixedColumnWidth(60.0), // 'Time' 열의 고정 너비 설정
          },
          children: [
            // 첫 번째 행: 요일 표시
            TableRow(
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: Text('Time', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                ...days.map((day) => Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        day,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
            // 시간표 셀 생성 (1시간 단위로 표시)
            ...List.generate(times.length, (hourIndex) {
              return TableRow(
                children: [
                  // 시간 표시 셀
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    child: Text(times[hourIndex]),
                  ),
                  // 요일별 셀
                  ...List.generate(5, (dayIndex) {
                    int startIndex = hourIndex * 2; // 30분 단위로 관리되는 인덱스
                    String displayText = timetable[startIndex][dayIndex];
                    if (timetable[startIndex + 1][dayIndex].isNotEmpty) {
                      displayText += "\n${timetable[startIndex + 1][dayIndex]}";
                    }
                    return GestureDetector(
                      onTap: () {
                        _editSubject(startIndex, dayIndex);
                      },
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        child: Text(
                          displayText,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    );
                  }),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  // 수업 정보를 편집하는 함수
  void _editSubject(int startIndex, int dayIndex) async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Subject'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Enter subject'),
              onSubmitted: (value) {
                Navigator.pop(context, {
                  'subject': value,
                  'duration': 30, // 여기에서 사용자에게 선택하도록 할 수 있음
                });
              },
            ),
          ],
        ),
      ),
    );

    if (result != null && result['subject'] != '') {
      setState(() {
        // 시간표에 30분 단위로 수업 정보를 저장
        timetable[startIndex][dayIndex] = result['subject'];
        if (result['duration'] == 60) {
          timetable[startIndex + 1][dayIndex] = result['subject'];
        }
      });
    }
  }
}