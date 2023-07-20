import 'package:flutter/material.dart';

void main() {
  // 가장 기본이 되는 앱 : MaterialApp (widget tree에 최상위에 위치

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Stateless VS Stateful'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ExampleStateless(),
      ExampleStateful(index: 3),
    ]);
  }
}

class ExampleStateless extends StatelessWidget {
  const ExampleStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}

// widget의 색, 형태 등을 바꿀 수 있다
// 모든 객체들은 state class 안에 넣어야함 -> class _ExampleStatefulState extends State<ExampleStateful>
class ExampleStateful extends StatefulWidget {
  final int index;

  // 매개변수로 받아 오기
  const ExampleStateful({required this.index, super.key});

  @override
  State<ExampleStateful> createState() => _ExampleStatefulState();
}

class _ExampleStatefulState extends State<ExampleStateful> {
  late int _index;
  late TextEditingController textController;

  // method 찾을 땐 ctrl + o(알파벳)

  // 초기값 조정
  @override
  void initState() {
    super.initState(); // 항상 이거부터 선언
    _index = widget.index;
    textController = TextEditingController();
  }

  // 리소스를 다 사용하고 반납 -> 앱이 리소스를 많이 잡아먹어 점점 느려지는 현상을 방어 가능
  @override
  void dispose() {
    textController.dispose();
    super.dispose(); // 마지막에 선언
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (_index == 5) {
              _index = 0;
              return;
            }
            _index++;
          });
        },
        child: Container(
          color: Colors.blue.withOpacity(_index / 5),
          child: Center(
            child: Text('$_index'),
          ),
        ),
      ),
    );
  }
}
