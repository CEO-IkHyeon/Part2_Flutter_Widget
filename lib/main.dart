import 'package:flutter/material.dart';

void main() {
  // 가장 기본이 되는 앱 : MaterialApp (widget tree에 최상위에 위치

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Study to Container'),
        ),
        body: CustomContainer(),

      ),
    )
  );
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        padding: EdgeInsets.fromLTRB(10, 12, 10, 12), // pading : container 내부에서 상하좌우에서 각 모서리와 간격 조절
        //margin: EdgeInsets.symmetric(vertical: 24, horizontal: 30), // margin : container 자체가 앱 모서리들과 간격 조절
        decoration: BoxDecoration(
          // container에서 boxdecoration의 경우 밖에 또는 doxdeco 둘 중 하나에만 color가 선언되어야 함 -> boxdeco안에서도 color를 선언할 수 있기 때문
          color: Color(0xFF85D07B),   // FF : 투명도 , 이후 2자리씩 RGB값을 나타냄
          border: Border.all(color: Colors.red, width: 5, style: BorderStyle.solid), //외곽선 그리기
          borderRadius: BorderRadius.circular(100), //외곽선 둥글게
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), offset: Offset(6, 6), blurRadius: 10, spreadRadius: 10), // 음영지게 만들고 검정 그림자를 좀 흐리게 만들 때 withOpacity 사용
            BoxShadow(color: Colors.blue.withOpacity(0.3), offset: Offset(-6, -6), blurRadius: 10, spreadRadius: 10), // 음영지게 만들고 검정 그림자를 좀 흐리게 만들 때 withOpacity 사용

          ]
        ),
        child: Center(child: Container(
            color: Colors.yellow,
            child: Text('Hello Container!'))), // wrap with center -> container의 중앙에 위치시킴
      ),
    );
  }
}


