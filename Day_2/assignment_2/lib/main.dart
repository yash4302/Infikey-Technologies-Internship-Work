import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'E-Commerce'),
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
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network("http://www.enabled.co.in/img/karsten.png", width: 300,),

            SizedBox(height: 70,),

            Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Get Started",

                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: 10,),

                  Text(
                      "Millions of people\n"
                          "use to turn their\n"
                          "ideas into reality",

                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 70,),

            Container(
              child: Row(
                children: [
                  SizedBox(width: 20,),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThirdRoute(
                              title: 'Home Page',
                            )),
                      );
                    },

                    child: (
                        Text(
                          "Skip now",

                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                    ),
                  ),

                  SizedBox(width: 180,),

                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondRoute(
                          title: 'Sign In',
                        )),
                      );
                    },

                    color: Colors.red,

                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10)),

                    child: (
                      Text(
                        "Next",

                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      
    );
  }
}

class SecondRoute extends StatefulWidget{
  final String title;

  SecondRoute({Key? key, required this.title}) : super(key: key);

  @override
  _SecondRoutePageState createState() => _SecondRoutePageState();
}

class _SecondRoutePageState extends State<SecondRoute> {
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Text(
                "\t\tHey,\n"
                    "\t\tLogin Now.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 30),

              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "If you are new/",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: null,
                        child: (Text(
                          "Create New",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )),
                      )
                    ]),
              ),

              SizedBox(height: 30,),

              TextField(
                controller: null,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                style: TextStyle(color: Colors.white),
              ),

              TextField(
                controller: null,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                style: TextStyle(color: Colors.white),
              ),

              SizedBox(height: 30),

              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forgotten password?/",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: null,
                        child: (Text(
                          "Reset",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )),
                      )
                    ]),
              ),

              SizedBox(height: 100,),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: null,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                      padding: EdgeInsets.all(15),

                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),

              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ThirdRoute(
                              title: 'Sign In',
                            )),
                          );
                        },

                        child: (Text(
                          "Skip now",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdRoute extends StatefulWidget{
  final String title;

  ThirdRoute({Key? key, required this.title}) : super(key: key);

  @override
  _ThirdRoutePageState createState() => _ThirdRoutePageState();
}

class _ThirdRoutePageState extends State<ThirdRoute> {
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text("Infikey"),

        actions: [
          Icon(Icons.menu),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            SizedBox(height: 20,),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: <Widget>[
                        Text(
                          "Applied",
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        ),

                        Text(
                          "28",
                        )
                      ],
                    ),
                  ),

                  SizedBox(width: 30,),

                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: <Widget>[
                        Text(
                          "Reviewed",
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        ),

                        Text(
                          "73",
                        )
                      ],
                    ),
                  ),

                  SizedBox(width: 30,),

                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: <Widget>[
                        Text(
                          "Contracted",
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        ),

                        Text(
                          "18",
                        )
                      ],
                    ),
                  ),

                  SizedBox(width: 20,),
                ],
              ),
            ),

            SizedBox(height: 30,),

            Text(
              "Complete Profile",

              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),

            TextButton(
              onPressed: null,
              child: (Text(
                "Buy Pro \$23.99",
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
