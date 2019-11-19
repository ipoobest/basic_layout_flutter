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

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List _listPages = List();
  Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _listPages
      ..add(Birthdays())
      ..add(Gratitude())
      ..add(Reminders());
    _currentPage = Birthdays();
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text(widget.title),
        ),
       body: SafeArea(
         child: Container()
       ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.red,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.access_alarm),
                color: Colors.white,
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.bookmark_border),
                color: Colors.white,
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.flight),
                color: Colors.white,
                onPressed: (){},
              ),
              Divider(),
            ],
          ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: Icon(Icons.add),
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
