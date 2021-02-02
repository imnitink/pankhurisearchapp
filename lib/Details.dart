import 'package:flutter/material.dart';
import 'package:pankhurisearchapp/home.dart';

class Details extends StatefulWidget {
  Details(this.course,this.name,this.date,this.time,this.price,this.image);
   String course;
   String name;
   String date;
   String time;
   String price;
   String image;
  @override
  _DetailsState createState() => _DetailsState(this.course,this.name,this.date,this.time,this.price,this.image);
}

class _DetailsState extends State<Details> {
  _DetailsState(this.course,this.name,this.date,this.time,this.price,this.image);
  String course;
  String name;
  String date;
  String time;
  String price;
  String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
            icon: Icon(
              Icons.chevron_left,
              color: Black,
            )
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.55,
            child: Card(
                child: Column(
                  children: <Widget>[
                    Stack(children: <Widget>[
                      Container(
                        //width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          color: DateColor,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/${image}"),
                              fit: BoxFit.cover),
                        ),
                      ),

                      Positioned(
                        top: 120,
                        left: 10,
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 50),
                              child: Row(children: <Widget>[
                                Text("\u20B9",style: TextStyle(fontSize:18,color: Colors.white,fontWeight: FontWeight.bold)),
                                Text("${price}",style: TextStyle(fontSize:18,color: Colors.white,fontWeight: FontWeight.bold),),
                              ],),
                            ),



                          ],
                        ),
                      ),
                    ],),
                    Container(
                      padding: EdgeInsets.only(top: 20,left: 5),
                     // width: 200,
                      child: Text(
                        "${course}",
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            color: CardTitleColor,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 10,left: 5),
                      // width: 200,
                      child: Text(
                        "By ${name}",
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            color: CardTitleColor,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '${date}',
                              style: TextStyle(
                                  color: DateColor,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 2,
                                  fontSize: 18.0),
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
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5,top: 10),
                      alignment: Alignment.topLeft,
                      ///width: MediaQuery.of(context).size.width*0.8,
                      child: FlatButton(shape: RoundedRectangleBorder(
                        //borderRadius: BorderRadius.circular(20),
                        //side: BorderSide( color: Colors.grey.withOpacity(0.5), width: 1,),
                      ),color: Color.fromRGBO(4,15,79,1),child: Text(' Buy this course  ',style: TextStyle(color: Colors.white,fontSize: 18),), onPressed: () {

                      },),
                    )


                  ],
                )),
          )
        ],
      ),
    );
  }
}
