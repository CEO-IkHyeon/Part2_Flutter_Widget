import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Flutter의 CallBack'),
      ),
      body: const Body(),
    ),
  ));
}

// callback : 특정 동작 이후에 다른 widget에서 처리
// Stateful widget일 때 발생한 state를 해당 widget 안에서만 처리 가능 -> widget을 벗어나면 해당 state에 접근하기 어려움
// -> callback으로 어느정도 해결 가능
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return TestWidget();
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'Count : $value',
        style: const TextStyle(fontSize: 30),
      ),
      TestButton(addCounter), //addCounter() 함수의 이름을 넘겨주는 것이지 실행을 넘기는게 아님 -> ()는 빼고 입력
    ]);
  }

  // void addCounter() => setState(() => ++value);

  // 값을 같이 넘길 때는 VoidCallback이 아닌 Function(int)로
  void addCounter(int addValue) => setState(() => value = value + addValue);
}

// TestButton에 addCount() 를 넘겨줘야함 -> 보통 함수를 넘겨줄 땐 VoidCallBack 사용
class TestButton extends StatelessWidget {
  const TestButton(this.callback, {super.key});

  // final VoidCallback callback;
  final Function(int) callback;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      child: InkWell(
        onTap: () => callback.call(1),
        onDoubleTap: () => callback.call(5),
        onLongPress: () => callback.call(10),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text(
              'Up Counter',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}

// 1. GestureDetector : 기본적인 입력 감지기 -> onTap 자주 쓰임 (클릭하는 것을 감지)
// 2. Ink : GestureDetector 와 유사하지만 클릭 시 화영 번지는 듯한 느낌 줌 (UX)