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
//         //margin: EdgeInsets.symmetric(horizontal: 24, horizontal: 30), // margin : container 자체가 앱 모서리들과 간격 조절
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

// class Body extends StatelessWidget {
//   const Body({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Placeholder : 특정 위젯이 올 자리를 확보
//     // Column은 수직으로 배열해준다. 상하에 대해서만 지정. mainAxisAligment로 start(상), center(중), end(하)로 위치 조정 가능
//     // -> 좌우의 폭을 지정할 수 없다 -> container로 wrap하고 width을 무제한으로 주고 crossAxisAligment로 좌, 중 ,우 조정 가능
//     // Row는 Column과 유사하지만 수평으로 배열해준다 -> 좌우에 대해서만 지정한다. mainAxisAlignment로 start(좌), center(중), end(우)로 위치 조정 가능
//     // -> 상, 중, 하로 위치 조절은 불가능 -> container로 wrap하고 height를 무제한으로 주고 crossAxisAligment로 상, 중, 하 조정 가능
//
//     // SingleChildScrollView : 하나의 자식 객체를 갖는 scroll view -> 높이가 초과할 거 같다면 scroll로 구현해 erorr 해결
//     // child가 Column인 경우 문제 없지만 Row로 하면 따로 선언해줄게 있음
//     // ctrl + r -> 한번에 replace 가능
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//
//         children: [
//           Container(
//             width:  double.infinity,
//             height: 100,
//             color: Colors.grey,
//             margin: EdgeInsets.symmetric(horizontal: 8),
//           ),
//           Container(
//             width:  double.infinity,
//             height: 100,
//             color: Colors.grey,
//             margin: EdgeInsets.symmetric(horizontal: 8),
//           ),Container(
//             width:  double.infinity,
//             height: 100,
//             color: Colors.grey,
//             margin: EdgeInsets.symmetric(horizontal: 8),
//           ),Container(
//             width:  double.infinity,
//             height: 100,
//             color: Colors.grey,
//             margin: EdgeInsets.symmetric(horizontal: 8),
//           ),Container(
//             width:  double.infinity,
//             height: 100,
//             color: Colors.grey,
//             margin: EdgeInsets.symmetric(horizontal: 8),
//           ),Container(
//             width:  double.infinity,
//             height: 100,
//             color: Colors.grey,
//             margin: EdgeInsets.symmetric(horizontal: 8),
//           ),Container(
//             width:  double.infinity,
//             height: 100,
//             color: Colors.grey,
//             margin: EdgeInsets.symmetric(horizontal: 8),
//           ),Container(
//             width:  double.infinity,
//             height: 100,
//             color: Colors.grey,
//             margin: EdgeInsets.symmetric(horizontal: 8),
//           ),
//         ],
//       ),
//     );
//   }
// }

// 고정 길이를 사용하면 화면을 넘어가거나 부족하거나 하는 현상이 발생 가능 -> flexible widget 사용
// Flexible : 비율도 조절 가능
// Expanded : 남은 부분을 모두 하나의 widget으로 채우고 싶을 때 -> SingleChild
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {

    // SingleChildScrollView 에서 Container 사이에 Expanded를 사용하게 된다면 scroll이기에 높이가 정해지지 않아서 에러 발생
    // -> flexible을 사용해 height를 명시적으로 정할 필요가 있다
    return Container(
      width: double.infinity,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container(width: double.infinity,
          height: 100,
          color: Colors.red,
          margin: const EdgeInsets.symmetric(vertical: 8),),


          Expanded(
            child: Container(width:  double.infinity,
              height: 100,
              color: Colors.red,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(color: Colors.blue, height: 50, width:  double.infinity, margin: const EdgeInsets.symmetric(vertical: 8),),
                    Container(color: Colors.blue, height: 50, width:  double.infinity, margin: const EdgeInsets.symmetric(vertical: 8),),
                    Container(color: Colors.blue, height: 50, width:  double.infinity, margin: const EdgeInsets.symmetric(vertical: 8),),
                    Container(color: Colors.blue, height: 50, width:  double.infinity, margin: const EdgeInsets.symmetric(vertical: 8),),
                    Container(color: Colors.blue, height: 50, width:  double.infinity, margin: const EdgeInsets.symmetric(vertical: 8),),
                    Container(color: Colors.blue, height: 50, width:  double.infinity, margin: const EdgeInsets.symmetric(vertical: 8),),
                    Container(color: Colors.blue, height: 50, width:  double.infinity, margin: const EdgeInsets.symmetric(vertical: 8),),
                    Container(color: Colors.blue, height: 50, width:  double.infinity, margin: const EdgeInsets.symmetric(vertical: 8),),
                    Container(color: Colors.blue, height: 50, width:  double.infinity, margin: const EdgeInsets.symmetric(vertical: 8),),
                    Container(color: Colors.blue, height: 50, width:  double.infinity, margin: const EdgeInsets.symmetric(vertical: 8),),
                  ],
                ),
              ),
            ),
          ),

          Container(width:  double.infinity,
            height: 100,
            color: Colors.red,
            margin: const EdgeInsets.symmetric(vertical: 8),),


        ],
      ),
    );
  }
}


