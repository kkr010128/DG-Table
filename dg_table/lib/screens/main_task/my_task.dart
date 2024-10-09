import 'package:flutter/material.dart';
import 'package:dg_table/screens/main_task/my_task/calendar.dart';

class MyTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CalenderWidget(title: 'TEST',),
      ],
      ),
    );
  }
}