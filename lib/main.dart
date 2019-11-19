import 'package:flutter/material.dart';
import 'package:basic_wedget/Birthdays.dart';
import 'package:basic_wedget/Gratitude.dart';
import 'package:basic_wedget/Reminders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_tabChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _tabChanged() {
// Check if Tab Controller index is changing, otherwise we get the notice twice
    if (_tabController.indexIsChanging) {
      print('tabChanged: ${_tabController.index}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Birthdays(),
          Gratitude(),
          Reminders(),
        ],
      )),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black54,
          unselectedLabelColor: Colors.black38,
          tabs: [
            Tab(
              icon: Icon(Icons.cake),
              text: 'Birthdays',
            ),
            Tab(
              icon: Icon(Icons.sentiment_satisfied),
              text: 'Gratitude',
            ),
            Tab(
              icon: Icon(Icons.access_alarm),
              text: 'Reminders',
            ),
          ],
        ),
      ),
    );
  }

  Container _buildContainer(Color color) {
    return Container(
      color: color,
      height: 60.0,
      width: 60.0,
    );
  }
}

class RowAndStackWidget extends StatelessWidget {
  const RowAndStackWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.lightGreen,
          radius: 100,
          child: Stack(
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                color: Colors.yellow,
              ),
              Container(
                height: 60.0,
                width: 60.0,
                color: Colors.amber,
              ),
              Container(
                height: 40.0,
                width: 40.0,
                color: Colors.brown,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RowAndColumnWidget extends StatelessWidget {
  const RowAndColumnWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildContainer(Colors.red),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            _buildContainer(Colors.amber),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            _buildContainer(Colors.brown),
          ],
        )
      ],
    );
  }

  Container _buildContainer(Color color) {
    return Container(
      color: color,
      height: 40.0,
      width: 40.0,
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.yellow,
          height: 40,
          width: 40,
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
        ),
        Expanded(
          child: Container(
            color: Colors.amber,
            height: 40,
            width: 40,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
        ),
        Container(
          color: Colors.brown,
          height: 40,
          width: 40,
        ),
      ],
    );
  }
}
