import 'package:flutter/material.dart';
import 'weekname_calculator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Weekname Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Weekname Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int year = 2000;
  int month = 1;
  int day = 1;

  DateTime targetDate;
  String weekName;

  @override
  Widget build(BuildContext context) {

    targetDate = new DateTime(year, month, day);
    weekName = getWeekName(targetDate);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new NumberSelectWidget(
                    max: 2030,
                    name: "Year",
                    onChanged: (var selected) {
                      setState(() {
                        year = selected;
                      });
                    },
                  ),
                ),
                new Expanded(
                  child: new NumberSelectWidget(
                    max: 12,
                    name: "Month",
                    onChanged: (var selected) {
                      setState(() {
                        month = selected;
                      });
                    },
                  ),
                ),
                new Expanded(
                  child: new NumberSelectWidget(
                    max: 31,
                    name: "Day",
                    onChanged: (var selected) {
                      setState(() {
                        day = selected;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          new Expanded(child: new Center(
            child: new Text("Weekname is $weekName."),
          )),
        ],
      ),
    );
  }
}

class NumberSelectWidget extends StatefulWidget {
  final int max;
  final String name;
  final ValueChanged onChanged;

  NumberSelectWidget({Key key, this.max, this.name, this.onChanged})
      : super(key: key);

  @override
  State createState() => new NumberSelectWidgetState();
}

class NumberSelectWidgetState extends State<NumberSelectWidget> {
  int _selectedNum;

  List<DropdownMenuItem<int>> items = List();

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new DropdownButton<int>(
          onChanged: (int selected) {
            setState(() {
              print(selected);
              _selectedNum = selected;
              widget.onChanged(selected);
            });
          },
          value: _selectedNum,
          items: _makeDropdownItems(),
        ),
        new Text(widget.name),
      ],
    );
  }

  List<DropdownMenuItem<int>> _makeDropdownItems() {
    List<DropdownMenuItem<int>> items = new List();
    for (var i = 1; i <= widget.max; i++) {
      items.add(new DropdownMenuItem(
        value: i,
        child: new Text(i.toString()),
      ));
    }
    return items;
  }
}
