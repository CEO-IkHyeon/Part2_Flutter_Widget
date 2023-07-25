import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:part2/screen/new_page.dart';

const assetImagePath = 'assets/images';
const myFaceImage = '$assetImagePath/myFace.jpg';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: GoRouter(initialLocation: '/', routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, _) => const HomeWidget(),
        ),
        GoRoute(
          path: '/new',
          name: 'new1',
          builder: (context, _) => const NewPage(),
          // route 안에 route를 만들 수 있다 -> app의 path를 효과적으로 만들 수 있다
          routes: [

          ]
        ),
        GoRoute(
          path: '/new1',
          name: 'new2',
          builder: (context, _) => const NewPage2(),
        ),
      ]),
    ),
  );
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter에서 화면 이동하기 3'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          child: Text('Go to Page'),
          onPressed: () {
            context.pushNamed('new1');
          },
        ),
      ),
    );
  }
}
