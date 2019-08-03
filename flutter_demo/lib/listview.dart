import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: PageView(
          children: <Widget>[
            ListView.separated(
                itemBuilder: (BuildContext context, int index) => ListTile(title: Text('title $index'), subtitle: Text('body $index'),),
                separatorBuilder: (BuildContext context, int index) => index % 2 == 0 ? Divider(color: Colors.green) : Divider(color: Colors.red),
                itemCount: 50
            )
          ],
        ),
      ),
    );
  }
}