// 섹션 구분 타이틀 컨테이너 위젯
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String redirectButton;
  final String description;

  const SectionTitle({
    required this.redirectButton,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: _MyTaskTitle(),
    );
  }

  Widget _MyTaskTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$title',
              style: TextStyle(fontSize: 21),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "$redirectButton",
                style: TextStyle(fontSize: 17, color: Color(0xFF5867EF)),
              ),
            ),
          ],
        ),
        Text(
          '$description',
          style: TextStyle(fontSize: 14, color: Color(0xFF7D848D)),
        ),
      ],
    );
  }
}