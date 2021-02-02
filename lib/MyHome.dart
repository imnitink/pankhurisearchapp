import 'package:flutter/material.dart';


const backgroundColor = const Color.fromRGBO(245, 245, 245, 1);

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
            ),
            actions: [Container(

            )],
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Card(
                  elevation: 0,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Image.asset('assets/mehendi.png',width: 100,),
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Container(
                                width:200,
                                child: Text("Lorem ipsum dolor sit amet.",style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),maxLines: 2,),
                              ),
                                Container(
                                  child: Text("Lorem ipsum",style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                ),],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Container(

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Lorem",style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),),
                                    Text("Lorem",style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),maxLines: 2,),
                                  ],
                                ),
                              ),
                                ],
                            ),


                          ],
                        ),
                      )
                    ],
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
