import 'package:flutter/material.dart';

void main() {
  // 가장 기본이 되는 앱 : MaterialApp (widget tree에 최상위에 위치

  runApp(MaterialApp(
    // scaffold : 기본이 되는 도화지같은 위젯
    home: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.home), onPressed: () {
            print('Tab!');
          },),
          Icon(Icons.play_arrow),
        ],
        centerTitle: false,
        title: Text('This is App bar'),
      ),
      body: TestWidget(),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.bug_report,),
        onPressed: () {
          print('Tab! FAB!');
        },
        foregroundColor: Colors.black,
        backgroundColor: Colors.black,
      ),
    ),
  ));
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Hello, Flutter!',
          style: TextStyle(
            fontSize: 60,
            color: Colors.black,
          ),
        ),
      ),
    ); //
  }
}
