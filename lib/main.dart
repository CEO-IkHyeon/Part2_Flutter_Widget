import 'package:flutter/material.dart';
import 'package:part2/screen/new_page.dart';

const assetImagePath = 'assets/images';
const myFaceImage = '$assetImagePath/myFace.jpg';

void main() {
  runApp(const MaterialApp(
    home: HomeWidget(),
  ));
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter에서 화면 이동하기 2'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          child: Text('Go to Page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
