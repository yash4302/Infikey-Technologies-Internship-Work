import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:core';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHandler databaseHandler = DatabaseHandler.privateConstructor();
  List<Tasks> tasks = await databaseHandler.readNotCompleted();
  for(Tasks task in tasks) {
    ids.add(task.id);
    limits.add(task.limit);
    counts.add(task.counting);
    incomplete.add(task.name);
  }

  tasks = await databaseHandler.readCompleted();
  for(Tasks task in tasks) {
    completed.add(task.name);
    completed_ids.add(task.id);
  }
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
      home: HomePage(),
    );
  }
}

List<String> completed = <String>[];
List<String> incomplete = <String>[];
List<int> counts = <int>[];
List<int> limits = <int>[];
List<int> ids = <int>[];
List<int> completed_ids = <int>[];

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final String title = 'To-do Counter';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DatabaseHandler databaseHandler = DatabaseHandler.privateConstructor();
    setState(() {});

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              Text(
                'Incomplete Tasks',

                style: TextStyle(
                  fontSize: 30,
                ),
              ),

              SizedBox(height: 10,),

              Container(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.35,
                    width: MediaQuery.of(context).size.width*0.865,

                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: incomplete.length,

                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,

                            child: ConstrainedBox(
                              constraints: BoxConstraints.expand(),

                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FirstPage(
                                            title: '${incomplete[index]}', index: index
                                        )
                                    ),
                                  ).then( (_) {
                                    setState(() {});
                                  }
                                  );
                                },

                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),

                                    Text(
                                      '${incomplete[index]}',

                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),

                                    SizedBox(height: 10,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,

                                      children: [
                                        Text(
                                          '${counts[index]}/${limits[index]}'
                                        ),

                                        SizedBox(width: 10,),

                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                counts[index] = 0;
                                                Tasks task = Tasks(id: ids[index], name: incomplete[index], isCompleted: 0, limit: limits[index], counting: counts[index]);
                                                databaseHandler.update(task);
                                              });
                                              setState(() {});
                                            },
                                            child: Text('Reset'),
                                        ),

                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              Tasks task = Tasks(id: ids[index], name: incomplete[index], isCompleted: 1, limit: limits[index], counting: counts[index]);
                                              databaseHandler.update(task);
                                              completed_ids.add(ids[index]);
                                              completed.add(incomplete[index]);
                                              incomplete.removeAt(index);
                                              counts.removeAt(index);
                                              limits.removeAt(index);
                                            });
                                            setState(() {});
                                          },
                                          child: Text('Mark as Completed'),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ),
                            ),

                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                )
                            ),
                          );
                        },

                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 5,);
                        },
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Text(
                'Completed Tasks',

                style: TextStyle(
                  fontSize: 30,
                ),
              ),

              SizedBox(height: 10,),

              Container(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width*0.865,

                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            color: Colors.grey[300],
                            padding: EdgeInsets.all(10.0),

                            child: Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        Tasks task = Tasks(id: completed_ids[index], name: completed[index], isCompleted: 1, limit: 0, counting: 0);
                                        databaseHandler.delete(task.id);
                                        completed.removeAt(index);
                                      });
                                      setState(() {});
                                    },
                                    child: Text("Delete")
                                ),

                                SizedBox(width: 10,),

                                Text(
                                  "${completed[index]}",

                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            )
                          );
                        },

                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 5,);
                        },

                        itemCount: completed.length
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewTaskPage())
          );
        },
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  FirstPage({Key? key, required this.title, required this.index}) : super(key: key);

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
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    DatabaseHandler databaseHandler = DatabaseHandler.privateConstructor();
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
            Text(
              '${incomplete[widget.index]}',
              style: Theme.of(context).textTheme.headline3,
            ),

            Text(
              'Limit: ${limits[widget.index]}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),

            SizedBox(height: 50,),

            Text(
              '${counts[widget.index]}',
              style: TextStyle(
                fontSize: 46,
              ),
            ),

            SizedBox(height: 75,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  color: Colors.transparent,
                  width: 100,
                  height: 100,

                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0)
                    ),

                    onPressed: () {
                      setState(() {
                        // This call to setState tells the Flutter framework that something has
                        // changed in this State, which causes it to rerun the build method below
                        // so that the display can reflect the updated values. If we changed
                        // _counter without calling setState(), then the build method would not be
                        // called again, and so nothing would appear to happen.
                        if(counts[widget.index] < limits[widget.index]) {
                          counts[widget.index]++;
                          Tasks task = Tasks(id: ids[widget.index], name: incomplete[widget.index], isCompleted: 0, limit: limits[widget.index], counting: counts[widget.index]);
                          databaseHandler.update(task);
                        }
                        else {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text('Congratulations!!!'),
                                  content: Text('Your counting has completed.'),

                                  actions: [
                                    RaisedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: Text('OK'),
                                    ),

                                    RaisedButton(
                                      onPressed: () {
                                        setState(() {
                                          Tasks task = Tasks(id: ids[widget.index], name: incomplete[widget.index], isCompleted: 1, limit: limits[widget.index], counting: counts[widget.index]);
                                          databaseHandler.update(task);
                                          completed_ids.add(ids[widget.index]);
                                          completed.add(incomplete[widget.index]);
                                          incomplete.removeAt(widget.index);
                                          counts.removeAt(widget.index);
                                          limits.removeAt(widget.index);
                                        });

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => HomePage() )
                                        ).then((_) => setState(() {}));
                                      },
                                      child: Text('Mark as Completed'),
                                    ),
                                  ],
                                );
                              }
                          );
                        }
                      });
                      setState(() {});
                    },

                    color: Colors.blue,
                    child: Text(
                      "+",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 20,),

                Container(
                  color: Colors.transparent,
                  width: 100,
                  height: 100,

                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0)
                    ),

                    onPressed: () {
                      setState(() {
                        if(counts[widget.index] > 0) {
                          setState(() {
                            counts[widget.index]--;
                            Tasks task = Tasks(id: ids[widget.index], name: incomplete[widget.index], isCompleted: 0, limit: limits[widget.index], counting: counts[widget.index]);
                            databaseHandler.update(task);
                          });
                        }
                        else {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text("Counts can't be less than 0."),

                                  actions: [
                                    RaisedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },

                                        child: Text('OK'),
                                    ),
                                  ],
                                );
                              }
                          );
                        }
                      });
                      setState(() {});
                    },
                    color: Colors.red[300],
                    child: Text(
                      "-",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20,),

            Container(
              color: Colors.transparent,
              width: 220,
              height: 60,

              child: FlatButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),

                onPressed: () {
                  setState(() {
                    counts[widget.index] = 0;
                    Tasks task = Tasks(id: ids[widget.index], name: incomplete[widget.index], isCompleted: 0, limit: limits[widget.index], counting: counts[widget.index]);
                    databaseHandler.update(task);
                  });
                  setState(() {});
                },
                color: Colors.red[400],
                child: Text(
                  "Reset",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewTaskPage extends StatefulWidget {
  NewTaskPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = 'Add New Task';

  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  TextEditingController taskLimit = TextEditingController();
  TextEditingController taskName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DatabaseHandler databaseHandler = DatabaseHandler.privateConstructor();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width*0.865,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  TextField(
                    controller: taskName,

                    decoration: InputDecoration(
                      hintText: "Task name",
                      border: OutlineInputBorder(),
                      labelText: 'Task name',
                    ),
                  ),

                  SizedBox(height: 10,),

                  TextField(
                    controller: taskLimit,

                    decoration: InputDecoration(
                      hintText: "Limit of Counts",
                      border: OutlineInputBorder(),
                      labelText: 'Set Limit',
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()
                      ),
                    );
                  },
                  child: Text('Cancel'),
                ),

                SizedBox(width: 20,),

                RaisedButton(
                  onPressed: () {
                    setState(() {
                      Tasks task = Tasks(id: 0, name: taskName.text, isCompleted: 0, limit: int.parse(taskLimit.text), counting: 0);
                      databaseHandler.insert(task);
                      incomplete.add(taskName.text);
                      limits.add(int.parse(taskLimit.text));
                      counts.add(0);
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()
                      ),
                    );
                  },
                  child: Text('Add'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Tasks {
  int isCompleted;
  int id;
  String name;
  int counting;
  int limit;

  Tasks({
    required this.id,
    required this.name,
    required this.isCompleted,
    required this.limit,
    required this.counting
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isCompleted': isCompleted,
      'counts': counting,
      'limits': limit
    };
  }
}

class DatabaseHandler {
  DatabaseHandler.privateConstructor();

  static final DatabaseHandler instance = DatabaseHandler.privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'todo.db';
    var todosDatabase = await openDatabase(path, version: 2, onCreate: _createDb);
    return todosDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, isCompleted INTEGER, limits INTEGER, counts INTEGER);');
  }

  Future<void> insert(Tasks task) async {
    Database? db = await this.database;
    db!.insert(
      'tasks',
      {
        'limits': task.limit,
        'name': task.name,
        'isCompleted': task.isCompleted,
        'counts': task.counting
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Tasks>> readCompleted() async {
    Database? db = await this.database;

    final List<Map<String, dynamic>> maps = await db!.query('tasks', where: 'isCompleted=1');

    return List.generate(maps.length, (i) {
      return Tasks(
        id: maps[i]['id'],
        name: maps[i]['name'],
        isCompleted: maps[i]['isCompleted'],
        counting: maps[i]['counts'],
        limit: maps[i]['limits'],
      );
    });
  }

  Future<List<Tasks>> readNotCompleted() async {
    Database? db = await this.database;

    final List<Map<String, dynamic>> maps = await db!.query('tasks', where: 'isCompleted=0');

    return List.generate(maps.length, (i) {
      return Tasks(
        id: maps[i]['id'],
        name: maps[i]['name'],
        isCompleted: maps[i]['isCompleted'],
        counting: maps[i]['counts'],
        limit: maps[i]['limits'],
      );
    });
  }

  Future<void> update(Tasks task) async {
    Database? db =  await this.database;

    db!.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> delete(int id) async {
    Database? db = await this.database;

    db!.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}