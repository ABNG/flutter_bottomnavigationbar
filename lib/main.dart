import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: "back",
          onPressed: () {},
        ),
        title: Text("AppBar"),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            tooltip: "add",
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "search",
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        currentIndex: index,
        selectedItemColor: Colors.amber,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            title: Text('First'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            title: Text('Second'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            title: Text('Third'),
          )
        ],
      ),
      body: ShowBody(index),
    );
  }
}

class ShowBody extends StatelessWidget {
  final int index;

  ShowBody(this.index);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return ReusableContainer("ONE");
        break;
      case 1:
        return ReusableContainer("TWO");
        break;
      case 2:
        return ReusableContainer("THREE");
        break;
      default:
        return null;
    }
  }
}

class ReusableContainer extends StatelessWidget {
  final String text;

  ReusableContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}
