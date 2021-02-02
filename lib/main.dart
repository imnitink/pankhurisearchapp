
import 'package:flutter/material.dart';
import 'package:pankhurisearchapp/Details.dart';
import  'package:pankhurisearchapp/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home:Scaffold(
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

  static List<Map<String,dynamic>> mainDataList = [
    {"course":"Live Course- How to learn the art of mehendi with...","name":"Sonal Bham","date":"18-19 Sep","time":"1:30","price":"1299","image":"mehendi.png"},
    {"course":"Tips and Tricks of basic tailoring for your DIY Fashion","name":"Amit Tiwari","date":"21-22 Oct","time":"1:30","price":"1499","image":"tailor.jpg"},
    {"course":"Live Course-Master the iconic eyeliner looks","name":"Kalpana Chawla","date":"27-30 July","time":"1:30","price":"1799","image":"makeup.jpg"},
    {"course":"Live Course- How to learn the art of mehendi with...","name":"Sonal Bham","date":"18-19 sept","time":"1:30","price":"1299","image":"mehendi.png"},
    {"course":"Tips and Tricks of basic tailoring for your DIY Fashion","name":"Amit Tiwari","date":"18-19 sept","time":"1:30","price":"1499","image":"tailor.jpg"},
    {"course":"Live Course-Master the iconic eyeliner looks","name":"Kalpana Chawla","date":"18-19 sept","time":"1:30","price":"1799","image":"makeup.jpg"},
    {"course":"Live Course- How to learn the art of mehendi with...","name":"Sonal Bham","date":"18-19 sept","time":"1:30","price":"1299","image":"mehendi.png"},
    {"course":"Tips and Tricks of basic tailoring for your DIY Fashion","name":"Amit Tiwari","date":"18-19 sept","time":"1:30","price":"1499","image":"tailor.jpg"},
    {"course":"Live Course-Master the iconic eyeliner looks","name":"Kalpana Chawla","date":"18-19 sept","time":"1:30","price":"1799","image":"makeup.jpg"},

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
      appBar: AppBar(
        title:  Container(
          width: MediaQuery.of(context).size.width*0.9,
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              border: InputBorder.none,
              //fillColor: Colors.grey[200],
              //focusColor: Colors.grey,
              filled: true,
              prefixIcon: IconButton(icon:Icon(Icons.search,color: Colors.black38,)),
              suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    _textController.clear();
                     newDataList = List.from(mainDataList);
                  });

                },
                  icon:Icon(Icons.cancel,color: Colors.black38,)),
              hintText: 'Search',

            ),
            onChanged: onItemChanged,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_left,
            color: Black,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Stack(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: DateColor,
                                borderRadius: BorderRadius.circular(10),
                                 image: DecorationImage(
                                     image: AssetImage("assets/${data['image']}"),
                                     fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    colors: [
                                      Colors.grey.withOpacity(0.0),
                                      Colors.black45,
                                    ],
                                    stops: [
                                      0.0,
                                      1.0
                                    ]),
                                // image: DecorationImage(
                                //     image: AssetImage("images/logo.png"),
                                //     fit: BoxFit.cover),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0,left: 5),
                                child: Row(
                                  children: <Widget>[
                                    Text("\u20B9",style: TextStyle(color: White),),
                                    Text(
                                      '${data['price']}',
                                      style: TextStyle(color: White),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap:(){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Details(data['course'],data['name'],data['date'],data['time'],data['price'],data['image'])),
                                );
                              },
                              child: Container(
                                width: 200,
                                child: Text(
                                  data['course'],
                                  overflow: TextOverflow.visible,
                                  style: primaryTitle,
                                ),
                              ),
                            ),
                            Text(
                              'By ${data['name']}',
                              style: primarySubTitle,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: '${data['date']}',
                                    style: dateTimeText,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' | ',
                                      ),
                                      TextSpan(text: '09:30 AM'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child:
                                      Icon(Icons.bookmark,color: Colors.grey,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child: Icon(Icons.share,color: Colors.grey,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}