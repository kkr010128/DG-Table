import 'package:flutter/material.dart';

class MyBag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          // margin: const EdgeInsets.all(10.0),
          margin: EdgeInsets.only(top: 10),
          color: Color(0xFF729FFF),
          width: double.infinity,
          height: 102.0,
          child: Text('다가오는 수업'),
        ),
    Container(
          // margin: const EdgeInsets.all(10.0),
          margin: EdgeInsets.only(top: 5),
          color: Color(0xFF729FFF),
          width: double.infinity,
          height: 102.0,
          child: Text('📚과제'),
        ),
      ],
    );
  }
}