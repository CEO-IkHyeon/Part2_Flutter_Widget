import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // 가장 기본이 되는 앱 : MaterialApp (widget tree에 최상위에 위치

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('다양한 Flutter의 입력 알아보기'),
      ),
      body: const Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    // const를 안하면 물결모양이 생김 --> 변경될 일 없으니 const로 선언해달라는 의미
    return const Column(
      children: [
        TestCheckBox(),
        TestRadioButton(),
        TestSlider(),
        TestSwitch(),
        TestPopupMenu(),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
// 1. CheckBox
class TestCheckBox extends StatefulWidget {
  const TestCheckBox({super.key});

  @override
  State<TestCheckBox> createState() => _TestCheckBoxState();
}

class _TestCheckBoxState extends State<TestCheckBox> {
  // checkBox의 값을 담을 list 선언
  late List<bool> values;

  // 주로 initState method를 통해 초기화하는 것이 좋음
  @override
  void initState() {
    super.initState();
    values = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: values[0],
            onChanged: (value) => changeValue(0, value: value)),
        // value에 Null이 들어오면 false로 바꿔줌
        Checkbox(
            value: values[1],
            onChanged: (value) => changeValue(1, value: value)),
        Checkbox(
            value: values[2],
            onChanged: (value) => changeValue(2, value: value)),
      ],
    );
  }

  //매개변수로 NULL이 들어오면 자동적으로 false로 바꿔준다
  void changeValue(int index, {bool? value = false}) {
    setState(() {
      values[index] = value!; // ! : NUll이 아니라는 의미?
    });
  }
}

////////////////////////////////////////////////////////////////////////////////
// 2. Radio : eNum이랑 같이 자주 쓰임
// 줄 정리 : ctrl + alt + L
class TestRadioButton extends StatefulWidget {
  const TestRadioButton({super.key});

  @override
  State<TestRadioButton> createState() => _TestRadioButtonState();
}

// 객체 이름 바꿀 때 shift + F6
enum TestValue {
  test1,
  test2,
  test3;
}

class _TestRadioButtonState extends State<TestRadioButton> {
  // ? : 초기에 값이 없을 수도 있다
  TestValue? selectValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // RadioButton 옆에 text 쓰기
        ListTile(
          leading: Radio<TestValue>(
              value: TestValue.test1,
              groupValue: selectValue,
              onChanged: (value) => setState(() => selectValue = value!)),
          title: Text(TestValue.test1.name),
          // onTap : 꼭 radio button이 아닌 해당 라인을 클릭해도 인식하게 함 -> 클릭 범위를 확장
          onTap: () => setState(() {
            if (selectValue != TestValue.test1) {
              selectValue = TestValue.test1;
            }
          }),
        ),
        Radio<TestValue>(
            value: TestValue.test2,
            groupValue: selectValue,
            onChanged: (value) => setState(() => selectValue = value!)),
        Radio<TestValue>(
            value: TestValue.test3,
            groupValue: selectValue,
            onChanged: (value) => setState(() => selectValue = value!)),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
// 3. Slider
class TestSlider extends StatefulWidget {
  const TestSlider({super.key});

  @override
  State<TestSlider> createState() => _TestSliderState();
}

class _TestSliderState extends State<TestSlider> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider 위에 Text
        Text('${value.round()}'),
        Slider(
          value: value,
          // int값을 double로 변환 : value as double
          onChanged: (newValue) => setState(() => value = newValue),
          divisions: 100,
          max: 100,
          min: 0,
          label: '${value.round()}',
          // slider 잡고 움직일 때 label로 값 표시
          activeColor: Colors.grey, // slider 색
        ),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
// 4. Switch()
class TestSwitch extends StatefulWidget {
  const TestSwitch({super.key});

  @override
  State<TestSwitch> createState() => _TestSwitchState();
}

class _TestSwitchState extends State<TestSwitch> {
  bool value1 = false;
  bool value2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: value1,
          onChanged: (newValue) => setState(() => value1 = newValue),
        ),
        CupertinoSwitch(
          value: value2,
          onChanged: (newValue) => setState(() => value2 = newValue),
        ),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
// 5. PopupMenuButton()
class TestPopupMenu extends StatefulWidget {
  const TestPopupMenu({super.key});

  @override
  State<TestPopupMenu> createState() => _TestPopupMenuState();
}

class _TestPopupMenuState extends State<TestPopupMenu> {
  TestValue selectValue = TestValue.test1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PopupMenu에서 선택한 것을 보여주기 위해 Text()
        Text(selectValue.name),
        PopupMenuButton(itemBuilder: (context) {
          return TestValue.values
              .map((value) => PopupMenuItem(value: value, child: Text(value.name)))
              .toList();
        },
        onSelected: (newValue) => setState(() => selectValue = newValue),),
      ],
    );
  }
}
