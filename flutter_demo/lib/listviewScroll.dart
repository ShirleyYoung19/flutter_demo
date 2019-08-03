import "package:flutter/material.dart";

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
            children: [
              ParalleWidget(),
              ScrollControllerWidget(),
              ScrollNotificationWidget(),
        ]),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home), text: '视差'),
            Tab(icon: Icon(Icons.rss_feed), text: 'Controller'),
            Tab(icon: Icon(Icons.perm_identity), text: 'Notification',)
          ],
          unselectedLabelColor: Colors.blueGrey,
          labelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.red,
        ),
      ),
    );
  }
}

class ParalleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('Paralle Widget'),
          flexibleSpace: Image.network("https://media-cdn.tripadvisor.com/media/photo-s/13/98/8f/c2/great-wall-hiking-tours.jpg",fit:BoxFit.cover),// 设置悬浮头图背景
          expandedHeight: 200,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text('Title $index')),
            childCount: 50,
          )
        )
      ],
    );
  }
}

class ScrollControllerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollControllerState();
  }
}

class _ScrollControllerState extends State<ScrollControllerWidget> {
  ScrollController _controller;
  bool isToTop = false;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      print(_controller.offset);
      if(_controller.offset > 1000) {
        setState(() {
          isToTop = true;
        });
      } else if (_controller.offset < 300 ) {
        setState(() {
          isToTop = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scroll Controller Widget')),
      body: Column(
        children: <Widget>[
          Container(
            height: 40.0,
            child:  RaisedButton(
              onPressed: isToTop ? () {
                if(isToTop) {
                  _controller.animateTo(.0, duration: Duration(milliseconds: 200), curve: Curves.ease);
                }
              } : null,
              child: Text("Top"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemBuilder: (BuildContext context, int index) => ListTile(title: Text('title $index')),
              itemCount: 50,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ScrollNotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification',
      home: Scaffold(
        appBar: AppBar(title: Text('Scroll Notification Demo'),),
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if(scrollNotification is ScrollStartNotification) {
              print('start');
            } else if (scrollNotification is ScrollUpdateNotification) {
              print('update');
            } else if (scrollNotification is ScrollEndNotification) {
              print('end');
            }
            return true;
          },

          child: ListView.builder(
              itemBuilder: (context, index) => ListTile(title: Text('index $index'),),
            itemCount: 50,
            itemExtent: 50,
          )
        ),
      ),
    );
  }
}