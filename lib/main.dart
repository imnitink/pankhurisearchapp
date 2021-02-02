
import 'package:flutter/material.dart';
import 'package:pankhurisearchapp/MyHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home:ListSearch()/*Scaffold(
            body: Center(
                child: ListSearch()
            )
        )*/
    );
  }
}

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {

  TextEditingController _textController = TextEditingController();

  static List<Map<String,dynamic>> mainDataList = [
    {"course":"Live Course- How to learn the art of mehendi with...","name":"Sonal Bham","date":"18-19 Sep","time":"1:30","price":"1299"},
    {"course":"Tips and Tricks of basic tailoring for your DIY Fashion","name":"Amit Tiwari","date":"21-22 Oct","time":"1:30","price":"1299"},
    {"course":"Live Course-Master the iconic eyeliner looks","name":"Kalpana Chawla","date":"27-30 July","time":"1:30","price":"1299"},
    {"course":"Live Course- How to learn the art of mehendi with...","name":"Sonal Bham","date":"18-19 sept","time":"1:30","price":"1299"},
    {"course":"Tips and Tricks of basic tailoring for your DIY Fashion","name":"Amit Tiwari","date":"18-19 sept","time":"1:30","price":"1299"},
    {"course":"Live Course-Master the iconic eyeliner looks","name":"Kalpana Chawla","date":"18-19 sept","time":"1:30","price":"1299"},
    {"course":"Live Course- How to learn the art of mehendi with...","name":"Sonal Bham","date":"18-19 sept","time":"1:30","price":"1299"},
    {"course":"Tips and Tricks of basic tailoring for your DIY Fashion","name":"Amit Tiwari","date":"18-19 sept","time":"1:30","price":"1299"},
    {"course":"Live Course-Master the iconic eyeliner looks","name":"Kalpana Chawla","date":"18-19 sept","time":"1:30","price":"1299"},

  ];

  // Copy Main List into New List.
  List<Map> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
     /* newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();*/

      /*final newDataList = mainDataList.firstWhere((e) => e['id'] == value);
      print(newDataList['id']);*/
      newDataList.clear();
      for (var map in mainDataList) {
        if (map.containsKey("course")) {
          if (map["course"].toString().toLowerCase().contains(value)) {
            newDataList .add(map);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.only(left:8.0,top: 20),
             child: Row(
               children: <Widget>[
                 Container(child: Icon(Icons.arrow_back_ios),),
                 SizedBox(width: 10,),
                 Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        focusColor: Colors.grey,
                        filled: true,
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.cancel),
                        hintText: 'Search Here...',

                      ),
                      onChanged: onItemChanged,
                    ),
                  ),
               ],
             ),
           ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Container(
                      height:MediaQuery.of(context).size.height*0.16,
                      child: Row(
                        children: [
                          Container(
                            width:MediaQuery.of(context).size.width*0.3,
                            child: Image.asset('assets/mehendi.png'),
                          ),
                          Container(
                              //height:MediaQuery.of(context).size.height*0.16,
                              child: Column(
                                children: [
                                  Flexible(child: Text(data['course'])),
                                  Text(data['date']),
                                  Text(data['time'])
                                ],
                              )),
                        ],
                      ),
                    ),
                    onTap: ()=> print(data),),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}