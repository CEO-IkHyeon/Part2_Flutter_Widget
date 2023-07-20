import 'package:flutter/material.dart';

void main() {
  // 가장 기본이 되는 앱 : MaterialApp (widget tree에 최상위에 위치

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Widget을 상하로 배치하기'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    // stack으로 widget을 겹쳐서 만들 수 있다
    // 겹쳐진 것 중 하나의 위치를 옮기고 싶다면
    // 1. Positioned widget을 활용해 top, bottom, left, right 매개변수를 통해 위치를 조정할 수 있음 -> 각 변수에 정확한 수치를 입력해 간격을 떨어뜨림
    // 2. Align widget을 활용해 위치를 조정 가능

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(150),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(140),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text('Count 0',
          style: TextStyle(color: Colors.red, fontSize: 32),),
        )
      ],
    );
  }
}
