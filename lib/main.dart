import 'package:basic_wedget/sliver_app_bar.dart';
import 'package:basic_wedget/sliver_grid.dart';
import 'package:basic_wedget/sliver_list.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          elevation: 0.0,
        ),
        body: CustomScrollView(
          slivers: <Widget>[
             SliverAppBarWidget(),
             SliverListWidget(),
             SliverGridWidget(),
          ],
        ));
  }
}


