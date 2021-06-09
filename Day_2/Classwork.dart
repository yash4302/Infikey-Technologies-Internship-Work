import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MaterialApp will come once in complete project

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
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  TextEditingController _nameFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infikey'),
        actions: [
          Icon(Icons.add),
        ],
      ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/app-logo.jpg",
                height: 300,
                width: 300,
              ),
              Image.network(
                "https://cdn.pixabay.com/photo/2015/03/04/22/35/head-659652_960_720.png",
                height: 200,
                width: 200,
              ),

              TextField(
                controller: _nameFieldController,
                decoration: InputDecoration(
                  hintText: "Enter name",
                ),
              ),

              CircleAvatar(
                radius: 100,
                child: Text(
                  'X',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 100),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  print("The Value you entered is ${_nameFieldController.text}");
                  _showDialogBox();
                },
                child: Text('Press Me'),
              ),
            ],
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _showDialogBox() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('You entered wrong information'),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('OK'),
              ),
            ],
          );
        });
  }
}
