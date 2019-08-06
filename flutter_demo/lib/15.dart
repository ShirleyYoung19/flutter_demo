import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom UI'),
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.system_update), text: '组合'),
            Tab(icon: Icon(Icons.cake), text: '自绘'),
          ],
          controller: _controller,
        ),
      ),
      body: TabBarView(
          children: [
            UpdateItemWidget(
              model: UpdateItemModel(
                  appIcon:"assets/icon.png",
                  appDescription:"Thanks for using Google Maps! This release brings bug fixes that improve our product to help you discover new places and navigate to them.",
                  appName: "Google Maps - Transit & Fond",
                  appSize: "137.2",
                  appVersion: "Version 5.19",
                  appDate: "2019年6月5日"
              ),
              onPressed: (){},
            ),
            Center(child: Cake()),
          ],
          controller: _controller,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class UpdateItemModel {
  String appIcon;
  String appName;
  String appSize;
  String appDate;
  String appDescription;
  String appVersion;
  UpdateItemModel({this.appIcon, this.appName, this.appSize, this.appDate, this.appDescription, this.appVersion});
}

class UpdateItemWidget extends StatefulWidget {
  final model;
  final onPressed;

  UpdateItemWidget({Key key, this.model, this.onPressed}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _UpdateItemState();
  }
}

class _UpdateItemState extends State<UpdateItemWidget> {
  bool collapse = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildTopRow(context),
        buildBottomRow(context),
      ],
    );
  }

  Widget buildTopRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(widget.model.appIcon, width: 80, height: 80,),
          ),
        ),
        Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.model.appName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF8E8D92),
                  ),
                ),
                Text(
                  "${widget.model.appDate}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8E8D92),
                  ),
                )
              ],
            )
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: FlatButton(
              color: Color(0xFFF1F0F7),
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              onPressed: widget.onPressed,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                'OPEN',
                style: TextStyle(
                  color: Color(0xFF007AFE),
                  fontWeight: FontWeight.bold,
                ),
              )
          ),
        )
      ],
    );
  }

  Widget buildBottomRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  widget.model.appDescription,
                  maxLines: collapse ? 2 : null,
                  overflow: collapse ? TextOverflow.ellipsis : null),
              ),
              Container(
                width: !collapse ? 0 : null,
                child: FlatButton(
                  onPressed: () {
                    setState(() {collapse = false;});
                    },
                  child: Text('More', style: TextStyle(color: Colors.blue),),
                )
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("${widget.model.appVersion} • ${widget.model.appSize} MB"),
          )
        ],
      ),
    );
  }
}

class Cake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: WheelPainter(),
    );
  }
}

class WheelPainter extends CustomPainter {
  Paint getColoredPaint(Color color) {
    Paint paint = Paint();
    paint.color = color;
    return paint;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double wheelSize = min(size.width, size.height) / 2;
    double nbElem = 6;
    double radius = (2 * pi) / nbElem;

    Rect boundingRect = Rect.fromCircle(center: Offset(wheelSize, wheelSize), radius: wheelSize);

    canvas.drawArc(boundingRect, 0, radius, true, getColoredPaint(Colors.orange));
    canvas.drawArc(boundingRect, radius, radius, true, getColoredPaint(Colors.black38));
    canvas.drawArc(boundingRect, radius * 2, radius, true, getColoredPaint(Colors.green));
    canvas.drawArc(boundingRect, radius * 3, radius, true, getColoredPaint(Colors.red));
    canvas.drawArc(boundingRect, radius * 4, radius, true, getColoredPaint(Colors.blue));
    canvas.drawArc(boundingRect, radius * 5, radius, true, getColoredPaint(Colors.pink));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;

}