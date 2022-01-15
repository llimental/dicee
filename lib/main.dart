import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1; // var 사용 자제.
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton( // FlatButton 구식 문법. TextButton 사
              onPressed: (){ // void callback
                setState(() {
                  leftDiceNumber = Random().nextInt(6) + 1; // setState로 인해 반영. 없다면 콘솔로만 변동 확인 가능
                  // 이후 이를 사용하는 코드는 Dirty라 해서 새로 리빌딩 해야함(반영하기 위해)
                  // import 'dart:math'; 이후 Random()을 사용하여 nextInt로 숫자 생성
                  // NextInt는 0부터 ()-1 의 숫자까지 범위. 우리는 1~6이 필요하기 때문에 뒤에 +1을 해야함.
                });
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: (){
                setState(() {
                  rightDiceNumber = Random().nextInt(6) + 1;
                });
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          )
        ],
      ),
    );
  }
}