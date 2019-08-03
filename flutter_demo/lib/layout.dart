import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Layout',
      home: Scaffold(
        appBar: AppBar(title: Text('Layout'),),
        body: Stack(
          children: <Widget>[
            Container(
              child: Center(
                child: Text('我是一个container'),
              ),
              width: 200,
              height: 200,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              child: Text('我是一个Padding'),
              padding: EdgeInsets.all(15),
            ),
            Center(
              child: Text('我是一个Center'),
            ),
            Row(
              children: <Widget>[
                Container(color: Colors.yellow, width: 60, height: 80,),
                Container(color: Colors.red, width: 60, height: 80,),
                Container(color: Colors.blue, width: 60, height: 80,),
              ],
            ),
            Column(
              children: <Widget>[
                Container(color: Colors.green, width: 60, height: 80,),
                Container(color: Colors.blue, width: 60, height: 80,),
                Expanded(flex: 1, child: Container(color: Colors.yellow, width: 60, height: 80,)),
              ],
            )
          ],
        ),
      ),
    );
//    Container(
//      child: Text('我是一个container'),
//      padding: EdgeInsets.all(18.0),
//      margin: EdgeInsets.all(44),
//      width: 100.0,
//      height: 100.0,
//      alignment: Alignment.center,
//      decoration: BoxDecoration(
//        color: Colors.red,
//        borderRadius: BorderRadius.circular(10.0),
//      ),
//    );
  }
}