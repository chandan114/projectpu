//import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// changes made

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
        stream: FirebaseFirestore.instance.collection('Details').snapshots(),
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
                  title: list[index]["title"],
                  subtitle: list[index]["subtitle"],
                  link: list[index]["link"],
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
  final String title;
  final String subtitle;
  final String link;
  Feedwidget({this.title, this.subtitle, this.link});
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
            image: AssetImage(widget.link),
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height/2.2,
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              widget.title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 12, 12),
            child: Text(
              widget.subtitle,
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
                "Swipe left to see full view",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white60,
                ),
              ),
            ),
          ),

          Container(
              padding: const EdgeInsets.only(top: 30, right: 0.0, bottom: 0.0),
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(),
              )),
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
