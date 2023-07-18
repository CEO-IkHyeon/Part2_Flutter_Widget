import 'package:flutter/material.dart';

void main() {
  // 가장 기본이 되는 앱 : MaterialApp (widget tree에 최상위에 위치

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Widget을 상하로 배치하기'),
        ),
        body: Body(),

      ),
    )
  );
}

// class CustomContainer extends StatelessWidget {
//   const CustomContainer({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: 300,
//         height: 300,
//         padding: EdgeInsets.fromLTRB(10, 12, 10, 12), // pading : container 내부에서 상하좌우에서 각 모서리와 간격 조절
//         //margin: EdgeInsets.symmetric(vertical: 24, horizontal: 30), // margin : container 자체가 앱 모서리들과 간격 조절
//         decoration: BoxDecoration(
//           // container에서 boxdecoration의 경우 밖에 또는 doxdeco 둘 중 하나에만 color가 선언되어야 함 -> boxdeco안에서도 color를 선언할 수 있기 때문
//           color: Color(0xFF85D07B),   // FF : 투명도 , 이후 2자리씩 RGB값을 나타냄
//           border: Border.all(color: Colors.red, width: 5, style: BorderStyle.solid), //외곽선 그리기
//           borderRadius: BorderRadius.circular(100), //외곽선 둥글게
//           boxShadow: [
//             BoxShadow(color: Colors.black.withOpacity(0.3), offset: Offset(6, 6), blurRadius: 10, spreadRadius: 10), // 음영지게 만들고 검정 그림자를 좀 흐리게 만들 때 withOpacity 사용
//             BoxShadow(color: Colors.blue.withOpacity(0.3), offset: Offset(-6, -6), blurRadius: 10, spreadRadius: 10), // 음영지게 만들고 검정 그림자를 좀 흐리게 만들 때 withOpacity 사용
//
//           ]
//         ),
//         child: Center(child: Container(
//             color: Colors.yellow,
//             child: Text('Hello Container!'))), // wrap with center -> container의 중앙에 위치시킴
//       ),
//     );
//   }
// }

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder : 특정 위젯이 올 자리를 확보
    // Column은 수직으로 배열해준다. 상하에 대해서만 지정. mainAxisAligment로 start(상), center(중), end(하)로 위치 조정 가능
    // -> 좌우의 폭을 지정할 수 없다 -> container로 wrap하고 width을 무제한으로 주고 crossAxisAligment로 좌, 중 ,우 조정 가능
    // Row는 Column과 유사하지만 수평으로 배열해준다 -> 좌우에 대해서만 지정한다. mainAxisAlignment로 start(좌), center(중), end(우)로 위치 조정 가능
    // -> 상, 중, 하로 위치 조절은 불가능 -> container로 wrap하고 height를 무제한으로 주고 crossAxisAligment로 상, 중, 하 조정 가능
    return Container(
      //width: double.infinity,
      height: double.infinity,
      // child: Column(
      child: Row(
        // min : column의 상하 값은 딱 child container 크기에 맞춰짐 -> mainAxisAlignment: center가 의미가 없음
        // max : 최대 높이를 Column이 차지함
        mainAxisSize: MainAxisSize.max,
        // 해당 container 기준에서 중앙에 Column이 위
        mainAxisAlignment: MainAxisAlignment.center,  // 상하 기준 중앙에 위치
        crossAxisAlignment: CrossAxisAlignment.center, // start : 좌측에 붙음 / end : 우측에 붙음 / center : 중앙
        children: [
          Container(
            width: 100,
            height: 80,
            color: Colors.red,
            child: Text('Container1'),
          ),
          Container(
            width: 100,
            height: 80,
            color: Colors.green,
            child: Text('Container2'),
          ),
          Container(
            width: 100,
            height: 80,
            color: Colors.blue,
            child: Text('Container3'),
          ),

        ],
      ),
    );
  }
}

