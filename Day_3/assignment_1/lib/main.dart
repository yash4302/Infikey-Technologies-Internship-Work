import 'package:flutter/cupertino.dart';
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
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Day-3 Task'),
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

String description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
List _featured = ["Black Panther", "Avengers: Infinity War", "Loki", "Bahubali"];
List _images = [
  "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQPpcKQ9eWZGxJe6eXyCW91eayLVm4KqruvJz3GP0F2T2w46yKZ",
  "https://i.pinimg.com/originals/72/fc/a7/72fca72b95cef647b2dde1bd67a79049.jpg",
  "https://terrigen-cdn-dev.marvel.com/content/prod/1x/loki_lob_crd_04.jpg",
  "https://images-na.ssl-images-amazon.com/images/I/711eHgGtnFL._SX522_.jpg"
];

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
      appBar: AppBar(
        title: Text("Day-3 Task"),
      ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
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

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              SizedBox(height: 10,),

              Text(
                "Featured",

                style: TextStyle(
                  fontSize: 30,
                ),
              ),

              SizedBox(height: 10,),

              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 400,
                      child: ListView.separated(
                        itemCount: _featured.length,
                        scrollDirection: Axis.horizontal,

                        itemBuilder: (context, index){
                          return Container(
                            width: MediaQuery.of(context).size.width*0.865,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),

                              child: ConstrainedBox(
                                  constraints: BoxConstraints.expand(),
                                  child: FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SecondRoute(
                                                title: 'Sign In', index: index
                                              )),
                                        );
                                      },
                                      padding: EdgeInsets.all(0.0),
                                      child: Image.network(_images[index]),
                                  )
                              )

                          );
                        },

                        separatorBuilder: (BuildContext context, int index) {
                          return Text("");
                        },

                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),

              Text(
                "Category",

                style: TextStyle(
                  fontSize: 30,
                ),
              ),

              SizedBox(height: 10,),

              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 400,
                      child: ListView.separated(
                        itemCount: _featured.length,
                        scrollDirection: Axis.horizontal,

                        itemBuilder: (context, index){
                          return Container(
                              width: MediaQuery.of(context).size.width*0.865,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),

                              child: ConstrainedBox(
                                  constraints: BoxConstraints.expand(),
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SecondRoute(
                                              title: _featured[index], index: index
                                            )),
                                      );
                                    },
                                    padding: EdgeInsets.all(0.0),
                                    child: Image.network(_images[index]),
                                  )
                              )

                          );
                        },

                        separatorBuilder: (BuildContext context, int index) {
                          return Text("");
                        },

                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

        ),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          color: Colors.redAccent,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.home_outlined),
                      onPressed: () {},
                    ),

                    Text("Home"),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),

                    Text("Search"),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.local_movies),
                      onPressed: () {},
                    ),

                    Text("Films"),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.tv),
                      onPressed: () {},
                    ),

                    Text("TV"),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.account_circle),
                      onPressed: () {},
                    ),

                    Text("My Account"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class SecondRoute extends StatefulWidget {
  SecondRoute({Key? key, required this.title, required this.index}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final int index;

  @override
  _SecondRoutePageState createState() => _SecondRoutePageState();
}

class _SecondRoutePageState extends State<SecondRoute>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_featured[widget.index]),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*0.865,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                
                child: Image.network(_images[widget.index]),
              ),

              SizedBox(height: 10,),
              
              Text(
                _featured[widget.index],

                style: TextStyle(
                  fontSize: 30,
                ),
              ),

              SizedBox(height: 15,),

              Text(
                "Description",

                style: TextStyle(
                  fontSize: 20,
                ),
              ),

              SizedBox(height: 5,),

              Container(
                padding: EdgeInsets.all(15),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Text(
                      description,

                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width*0.865,
                height: 60,

                child: FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),

                  onPressed: () {},
                  color: Colors.red[400],
                  child: Text(
                    "Book Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          color: Colors.redAccent,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.home_outlined),
                      onPressed: () {},
                    ),

                    Text("Home"),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),

                    Text("Search"),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.local_movies),
                      onPressed: () {},
                    ),

                    Text("Films"),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.tv),
                      onPressed: () {},
                    ),

                    Text("TV"),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.account_circle),
                      onPressed: () {},
                    ),

                    Text("My Account"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}