//import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.share),
          )
        ],
        leading: Icon(Icons.menu_open),
        backgroundColor: Colors.black87,
        title: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Center(
            child: Text("FEED"),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chandan').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text("Eroor");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircleAvatar();
          } else {
            final list = snapshot.data.docs;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Feedwidget(
                  name: list[index]["name"],
                  email: list[index]["email"],
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Feedwidget extends StatefulWidget {
  final String name;
  final String email;
  Feedwidget({this.name, this.email});
  @override
  _FeedwidgetState createState() => _FeedwidgetState();
}

class _FeedwidgetState extends State<Feedwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.black87,
      ),
      child: Column(
        children: [
          // image: Image.asset("./images/bombay_stock_exchange.jpg")
          Image(
            image: AssetImage("./images/bombay_stock_exchange.jpg"),
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height/2.2,
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              widget.name,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 12, 12),
            child: Text(
              "Like every other market, the National Stock Exchange of India (NSE) and the Bombay Stock Exchange (BSE) will remain shut on different occasions and special days in the coming year. The off time will be followed by Equity Segment, Equity Derivative Segment, and SLB Segment.Muhurat Trading will take place on November 04, 2021, during the festival of Diwali, timings of which are notified later by the stock exchange.",
              style: TextStyle(
                color: Colors.white60,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 12, 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.email,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white60,
                ),
              ),
            ),
          ),

          // Container(
          //   padding: const EdgeInsets.only(top: 70),
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //    decoration: BoxDecoration(

          //    ),
          //   )
          // ) ,
          // Expanded(
          //   child: Align(
          //     alignment: FractionalOffset.bottomCenter,
          //     child: Container(
          //       decoration: BoxDecoration(color: Colors.white24),
          //       child: Center(
          //         child: Text(
          //           "Tap To know More => ",
          //           style: TextStyle(
          //               color: Colors.white38,
          //               fontSize: 15,
          //               fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //       width: MediaQuery.of(context).size.width,
          //       height: 60,
          //     ),
          //   ),
          // ),

          // Expanded(
          //   child: StreamBuilder<QuerySnapshot>(
          //     stream:
          //         FirebaseFirestore.instance.collection('chandan').snapshots(),
          //     builder: (BuildContext context,
          //         AsyncSnapshot<QuerySnapshot> snapshot) {
          //       if (snapshot.hasError) return Text("Eroor");
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return CircleAvatar();
          //       } else {
          //         final list = snapshot.data.docs;
          //         return ListView.builder(
          //           itemBuilder: (context, index) {
          //             return ListTile(
          //               title: Text(
          //                 list[index]["email"],
          //                 style: TextStyle(
          //                   color: Colors.white60,
          //                 ),
          //               ),
          //               subtitle: Text(
          //                 list[index]["name"],
          //                 style: TextStyle(
          //                   color: Colors.white60,
          //                 ),
          //               ),
          //             );
          //           },
          //           itemCount: list.length,
          //         );
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
