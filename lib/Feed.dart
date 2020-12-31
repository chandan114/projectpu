// import 'dart:html';
// hello chandan kumar rai


import 'package:flutter/material.dart';

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
      body: ListView(
        children: [
          Feedwidget() ,
          
        ],
      )
    );
  }
}

class Feedwidget extends StatefulWidget {
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
              "Share Market Holidays 2021: List of Days When BSE Will be Closed For Trading in Upcoming Year",
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
                "Swipe left to see full view....",
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
        ],
      ),
    );
  }
}
