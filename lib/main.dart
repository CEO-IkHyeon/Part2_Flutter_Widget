import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:part2/screen/new_page.dart';
import 'package:part2/style/theme.dart';

const assetImagePath = 'assets/images';
const myFaceImage = '$assetImagePath/myFace.jpg';

void main() {
  runApp(
    MaterialApp(
      home: const HomeWidget(),
      // Theme 사용 시 theme 객체를 별도로 분리해서 사용하느 것이 좋음
      theme: customTheme
      // ThemeData(
      //     useMaterial3: true,
      //     // 1. colorScheme 정의 방식 1
      //     // colorScheme: const ColorScheme.light(
      //     //   primary: Colors.indigo,
      //     //   secondary: Colors.green,
      //     //   tertiary: Colors.yellow,
      //     // ),
      //
      //     // 2. colorScheme 정의 방식 2
      //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      //     textTheme: TextTheme(
      //       bodyMedium: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
      //       bodyLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      //     )
      //
      //   // 3. colorScheme 정의 방식 3
      //   // colorScheme: ColorScheme.dark(),
      //   // appBarTheme: AppBarTheme(
      //   //   backgroundColor: Colors.red,
      //   // )
      // ),

    ),
  );
}



class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  late int count;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    // 위에서 설정한 bodyLarge를 가져오려면 theme data를 가져와야함
    // final textTheme = Theme.of(context).textTheme;
    final textTheme = customTheme.textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Theme'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Press Count', style: textTheme.bodyMedium,),
            Text('$count', style: textTheme.displayLarge,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => count++),
      ),
    );
  }
}

