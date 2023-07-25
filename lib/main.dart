import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

const assetImagePath = 'assets/images';
const myFaceImage = '$assetImagePath/myFace.jpg';

void main() {
  // 가장 기본이 되는 앱 : MaterialApp (widget tree에 최상위에 위치

  runApp(const MaterialApp(
    home: HomeWidget(),
  ));
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter에서 화면 이동하기 1'),
        centerTitle: true,
      ),
      body: homeBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
        currentIndex: index,
        onTap: (newIndex) => setState(() => index = newIndex),
      ),
    );
  }

  Widget homeBody() {
    switch (index) {
      case 1:
        return const Center(
          child: Icon(Icons.search, size: 100),
        );
      case 2:
        return const Center(
          child: Icon(Icons.person, size: 100),
        );
      case 0:
      default:
        return const Center(
          child: Icon(Icons.home, size: 100),
        );
    }
  }
}
