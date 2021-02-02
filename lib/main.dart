
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
                child: ListSearch()
            )
        )
    );
  }
}

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {

  TextEditingController _textController = TextEditingController();

  static List<Map<String, dynamic>> mainDataList = [
  {"id":"Live Course- How to learn the art of mehendi with..."},
    {"id":"bmb"},
   /* "Banana",
    "Blackberry",
    "Coconut",
    "Date",
    "Fig", 
    "Gooseberry",
    "Grapes",
    "Lemon",
    "Litchi",
    "Mango",
    "Orange",
    "Papaya",
    "Peach",
    "Pineapple",
    "Pomegranate",
    "Starfruit"*/
  ];

  // Copy Main List into New List.
  List<Map> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
      /*newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();*/
      final newDataList = mainDataList.firstWhere((e) => e['id'] == value);
      print(newDataList['id']);
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
                    title: Text(data["id"]),
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