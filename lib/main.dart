import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
const assetImagePath = 'assets/images';
const myFaceImage = '$assetImagePath/myFace.jpg';
void main() {
  // 가장 기본이 되는 앱 : MaterialApp (widget tree에 최상위에 위치

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Flutter에서 로컬 데이터 사용하기'),
        centerTitle: true,
      ),
      body: const Body(),
    ),
  ));
}

//
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(myFaceImage),
    );
  }
}

