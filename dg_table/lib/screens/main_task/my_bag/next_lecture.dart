import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class MyBag extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           // 모듈화된 nextLectureContainer 사용
//           nextLectureContainer(
//             subject: '소프트웨어공학',
//             time: '13:30',
//             buttonText: '수업 정보',
//             iconPath: 'assets/image/next_lecture_sym.svg',
//           ),
//         ],
//       ),
//     );
//   }
// }

// 수업 정보를 출력하는 전체 컨테이너를 모듈화
class nextLectureContainer extends StatelessWidget {
  final String subject;
  final String time;
  final String buttonText;
  final String iconPath;

  const nextLectureContainer({
    required this.subject,
    required this.time,
    required this.buttonText,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF729FFF),
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.only(top: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildClassInfo(),
          _buildClassIcon(),
        ],
      ),
    );
  }

  // 수업 정보를 출력하는 위젯
  Widget _buildClassInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '다가오는 수업',
          style: TextStyle(
            fontSize: 14, 
            fontWeight: FontWeight.bold, 
            color: Colors.white,
          ),
        ),
        Text(
          '$time $subject',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold, 
            color: Colors.white,
          ),
        ),
        ElevatedButton(
          onPressed: () {}, // 비활성화된 상태
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF729FFF),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            minimumSize: const Size(0, 0), // 버튼 기본 크기 초기화
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: const BorderSide(color: Colors.white, width: 1),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ],
    );
  }

  // 수업 아이콘 출력하는 위젯
  Widget _buildClassIcon() {
    return SvgPicture.asset(
      iconPath,
      width: 80,
      height: 80,
    );
  }
}