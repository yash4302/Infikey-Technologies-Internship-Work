import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _peoples = [
    "Ankit",
    "Jay",
    "mohan",
    "Sakshi",
    "Ria",
    "Yosuf",
    "Priya",
    "Dipali",
    "Preet",
    "Harsimar",
    "Aarti"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Tutorial'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 600,
              child: ListView.separated(
                  itemCount: _peoples.length,

                  itemBuilder: (context,index){
                return Container(
                    margin: EdgeInsets.all(40),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),



                    child: Text(_peoples[index]+"Height of screen is ${MediaQuery.of(context).size.height}"+"Width of screen is ${MediaQuery.of(context).size.width}"));
              },
                separatorBuilder: (_,index){
                    return index%2==1?Container():Divider(
                      color: Colors.green,
                      height: 20,
                      thickness: 20,
                    );
                },


              ),
            ),

            Container(
              height: 300,
              child: ListView.builder(
                  itemCount: _peoples.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Container(


                        margin: EdgeInsets.all(40),
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width*0.865,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://static.india.com/wp-content/uploads/2020/05/pjimage-18.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),



                        child: Text(''));
                  }),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                  itemCount: _peoples.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Container(


                        margin: EdgeInsets.all(40),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10),
                        ),



                        child: Text(_peoples[index]+"Height of screen is ${MediaQuery.of(context).size.height}"+"Width of screen is ${MediaQuery.of(context).size.width}"));
                  }),
            ),

            /// Read it
            
            PageView.builder(itemBuilder: (_,index){return Text('$index');}),

          ],
        ),
      ),


    );
  }
}